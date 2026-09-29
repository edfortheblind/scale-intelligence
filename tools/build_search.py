"""Rebuild a portable SQLite FTS5 index from app JSON and navigation manifests."""
import argparse
import json
import os
from pathlib import Path
import sqlite3
import tempfile
from contextlib import ExitStack
from collector import Store, ROOTS, atomic_bytes, atomic_json, read_json, digest, writer_lock, now
from article_data import CONVERTER, parse_article, text_of


def build(store, output, provisional=False):
    output=Path(output).resolve()
    docs=[]
    resource_map={r['id']:r for module in ROOTS for r in store.records(module)}
    for module in ROOTS:
        if module == 'SDK':
            from sdk_article_data import CONVERTER as module_converter, parse_article as module_parser
        else:
            module_converter, module_parser = CONVERTER, parse_article
        for path in sorted((store.root/module/'data/articles').glob('*.json')):
            data=read_json(path)
            verification=data['verification']
            approved=verification.get('reading_copy_verified',False)
            provisional_eligible=all(verification['checks'].get(k,False) for k in ('exact_decoded_text','table_cell_structure','exact_code_whitespace','headings','parse_without_repair','supported_elements'))
            if approved or (provisional and provisional_eligible):
                current=resource_map.get(data['id'],{})
                if current.get('sha256')!=data['source']['sha256'] or current.get('app_data_path')!=path.relative_to(store.root).as_posix():
                    raise ValueError('Stale app JSON generation')
                if data.get('converter_version')!=module_converter:
                    raise ValueError('Unsupported app JSON converter')
                original=store.root/data['source']['local_path']
                if digest(original.read_bytes())!=data['source']['sha256']:
                    raise ValueError('Index source hash mismatch')
                _,tree,_,title,_=module_parser(current,original.read_bytes())
                if text_of(tree)!=data['content_text'] or title!=data['title']:
                    raise ValueError('App JSON content differs from its source')
                for kind in ('html','markdown'):
                    derivative=(store.root/data['reading'][kind]).resolve()
                    if not derivative.is_relative_to(store.root) or digest(derivative.read_bytes())!=data['reading'][kind+'_sha256']:
                        raise ValueError('Reading artifact hash mismatch')
                docs.append((path,data))
    with tempfile.TemporaryDirectory(prefix='scale-search-') as folder, ExitStack() as cleanup:
        path=Path(folder)/'search.sqlite'
        db=sqlite3.connect(path)
        cleanup.callback(db.close)
        db.executescript('''
          PRAGMA foreign_keys=ON;
          CREATE TABLE metadata(key TEXT PRIMARY KEY,value TEXT NOT NULL);
          CREATE TABLE resources(id TEXT PRIMARY KEY,module TEXT NOT NULL,type TEXT NOT NULL,
              source_url TEXT NOT NULL,local_path TEXT,sha256 TEXT,status TEXT NOT NULL);
          CREATE TABLE articles(id TEXT PRIMARY KEY REFERENCES resources(id),module TEXT NOT NULL,
              title TEXT NOT NULL,source_url TEXT NOT NULL,source_sha256 TEXT NOT NULL,
              json_path TEXT NOT NULL,html_path TEXT NOT NULL,content_text TEXT NOT NULL,verified INTEGER NOT NULL);
          CREATE TABLE navigation(id TEXT PRIMARY KEY,module TEXT NOT NULL,parent_id TEXT,
              position INTEGER NOT NULL,title TEXT NOT NULL,resource_id TEXT,breadcrumbs_json TEXT NOT NULL);
          CREATE INDEX navigation_parent ON navigation(parent_id,position);
          CREATE INDEX navigation_resource ON navigation(resource_id);
          CREATE TABLE links(source_id TEXT NOT NULL,node_id TEXT NOT NULL,target_id TEXT,fragment TEXT,
              classification TEXT NOT NULL,original_href TEXT NOT NULL,attribute TEXT NOT NULL);
          CREATE INDEX links_target ON links(target_id);
          CREATE TABLE variants(article_id TEXT NOT NULL,node_id TEXT NOT NULL,condition_json TEXT NOT NULL,text_sha256 TEXT NOT NULL);
          CREATE VIRTUAL TABLE article_search USING fts5(id UNINDEXED,module UNINDEXED,title,content_text,
              tokenize='unicode61 remove_diacritics 2',prefix='2 3');
        ''')
        for module in ROOTS:
            for resource in store.records(module):
                db.execute('INSERT INTO resources VALUES(?,?,?,?,?,?,?)',tuple(resource.get(k) for k in ('id','module','type','source_url','local_path','sha256','status')))
            toc_path=store.root/module/'manifests/toc.json'
            if toc_path.exists():
                def insert(nodes,parent=None):
                    for position,node in enumerate(nodes):
                        db.execute('INSERT INTO navigation VALUES(?,?,?,?,?,?,?)',(node['id'],module,parent,position,node['title'],node.get('resource_id'),json.dumps(node['breadcrumbs'],ensure_ascii=False)))
                        insert(node.get('children',[]),node['id'])
                insert(read_json(toc_path).get('nodes',[]))
        for source,data in docs:
            db.execute('INSERT INTO articles VALUES(?,?,?,?,?,?,?,?,?)',(data['id'],data['module'],data['title'],data['source']['source_url'],data['source']['sha256'],source.relative_to(store.root).as_posix(),data['reading']['html'],data['content_text'],int(data['verification'].get('reading_copy_verified',False))))
            db.execute('INSERT INTO article_search VALUES(?,?,?,?)',(data['id'],data['module'],data['title'],data['search_text']))
            for ref in data['references']:
                db.execute('INSERT INTO links VALUES(?,?,?,?,?,?,?)',(data['id'],ref['node_id'],ref.get('target_id'),ref.get('fragment'),ref['classification'],ref['original_href'],ref['attribute']))
            for variant in data['inventory']['variants']:
                db.execute('INSERT INTO variants VALUES(?,?,?,?)',(data['id'],variant['node_id'],json.dumps(variant['condition'],ensure_ascii=False),variant['text_sha256']))
        metadata={'schema_version':'1','provisional':str(provisional).lower(),'complete_corpus':'false',
                  'article_count':str(len(docs)),'source':'Module data/articles JSON and manifests; rebuild with tools/build_search.py'}
        db.executemany('INSERT INTO metadata VALUES(?,?)',metadata.items())
        db.commit()
        integrity=db.execute('PRAGMA integrity_check').fetchall()
        fk=db.execute('PRAGMA foreign_key_check').fetchall()
        if integrity!=[('ok',)] or fk:raise ValueError('SQLite index integrity failed')
        counts={name:db.execute('SELECT count(*) FROM '+name).fetchone()[0] for name in ('articles','resources','navigation','links','variants')}
        db.close()
        atomic_bytes(output,path.read_bytes())
    report={'schema_version':1,'counts':counts,'provisional':provisional,'complete_corpus':False,
            'database':Path(output).relative_to(store.root).as_posix(),'sha256':digest(Path(output).read_bytes()),'integrity_check':'ok'}
    atomic_json(store.root/'_project/search-index.json',report)
    return report


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--provisional',action='store_true',help='Include structurally faithful drafts; explicitly mark the index incomplete.')
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    runtime=Path(os.environ['LOCALAPPDATA'])/'TAB/SCALE-Intelligence/runtime'
    with writer_lock(root,runtime):
        print(json.dumps(build(Store(root),root/'_project/search.sqlite',args.provisional)))
