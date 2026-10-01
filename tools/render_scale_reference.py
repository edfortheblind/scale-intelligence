"""Render the single curated SCALE functionality reference from its bound register."""
import argparse
import hashlib
import json
import re
from pathlib import Path
from xml.sax.saxutils import escape

ROOT = Path(__file__).resolve().parents[1]
REGISTER = 'SDD/derived/scale-functional-reference.json'
MARKDOWN = 'SDD/SCALE_FUNCTIONAL_REFERENCE.md'
PDF = 'output/pdf/SCALE Functionality Reference SDD.pdf'
SOURCE_IDS = {'sdd-61bfda888fe30365', 'sdd-f46806ef53e15f07', 'sdd-56008a31665dcc23',
              'sdd-d4675a92502c23f4', 'sdd-c4c7e01f8ccad48a', 'sdd-1c25f20de1eafc3e',
              'sdd-d50ca4a96095c930'}
NAME_PATTERN = re.compile(r'\b(Covetrus|HADDAD|Knipper|Grupo\s+Julio|LAND|MAWM|TAB|DISH|OHW|HLE)\b', re.I)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def fingerprint(value):
    return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':')).encode()).hexdigest()


def validate(data, root=ROOT):
    """Check original bytes, retained nodes and record-level synthesis provenance."""
    if NAME_PATTERN.search(json.dumps(data, ensure_ascii=False)):
        raise ValueError('A client or excluded-product name entered the central register')
    refs = {r['document_id']: r for r in data['references']}
    if set(refs) != SOURCE_IDS or len(data['references']) != 7:
        raise ValueError('The central reference must use exactly the seven SCALE sources')
    legacy_path = root/data['provenance']['review_register_path']
    if sha(legacy_path) != data['provenance']['review_register_sha256']:
        raise ValueError('The retained review-register identity changed')
    legacy = json.loads(legacy_path.read_text(encoding='utf-8'))
    documents = {}
    for identity, ref in refs.items():
        extracted = root/ref['extracted_path']
        if sha(extracted) != ref['extracted_sha256']:
            raise ValueError('A source extraction changed')
        document = json.loads(extracted.read_text(encoding='utf-8'))
        original = (root/'SDD'/document['source_path']).resolve()
        if not original.is_relative_to(root.resolve()/'SDD'):
            raise ValueError('An original path escaped the source directory')
        if document['document_id'] != identity or sha(original) != ref['source_sha256']:
            raise ValueError('An original source identity changed')
        documents[identity] = document
    claim_ids = [c['id'] for c in data['claims']]
    chapter_ids = [entry for chapter in data['chapters'] for entry in chapter['entries']]
    if len(set(claim_ids)) != len(claim_ids) or chapter_ids != claim_ids:
        raise ValueError('Chapter/entry identities are not unique and ordered')
    for claim in data['claims']:
        expected = {}
        if claim['review_state'] != 'SOURCE_REVIEWED_BOUNDED' or not claim['source_records']:
            raise ValueError('An entry lacks bounded review provenance')
        for binding in claim['source_records']:
            record = legacy[binding['kind']][binding['source_array_index']]
            if fingerprint(record) != binding['record_sha256']:
                raise ValueError('A contributing record changed')
            for citation in record['citations']:
                identity = citation['document_id']
                if identity not in SOURCE_IDS:
                    raise ValueError('An entry uses an excluded source')
                expected.setdefault(identity, set()).update(citation['nodes'])
        actual = {c['document_id']: set(c['nodes']) for c in claim['citations']}
        if actual != expected or len(actual) != len(claim['citations']):
            raise ValueError('Entry citations differ from their contributing records')
        for citation in claim['citations']:
            identity = citation['document_id']
            if citation['source_sha256'] != refs[identity]['source_sha256']:
                raise ValueError('Entry original-source hash differs')
            nodes = {n['id'] for n in documents[identity]['nodes']}
            if not set(citation['nodes']) <= nodes:
                raise ValueError('An exact retained source location is unavailable')
    return data


def render_markdown(data):
    claims = {c['id']: c for c in data['claims']}
    codes = {r['document_id']: r['code'] for r in data['references']}
    lines = ['# '+data['title'], '', data['subtitle'], '', *sum(([p,''] for p in data['introduction']), []),
             '## Contents', '']
    lines += [f"{i}. [{c['title']}](#{c['id'].replace('_','-')})" for i,c in enumerate(data['chapters'],1)]
    lines += ['', 'Citations use neutral reference codes. Each entry has an identifier in the '
              '[source-binding register](derived/scale-functional-reference.json), which retains exact source hashes and passage locations.', '']
    for chapter in data['chapters']:
        lines += [f"<a id=\"{chapter['id'].replace('_','-')}\"></a>", '## '+chapter['title'], '', chapter['overview'], '']
        for identity in chapter['entries']:
            entry = claims[identity]
            lines += [f'<a id="{identity.replace("_","-")}"></a>', '### '+entry['title'], '', entry['summary'], '']
            for paragraph in entry['paragraphs']:
                lines += [paragraph,'']
            if entry.get('choices'):
                lines += ['Configuration considerations:', '', *['- '+v for v in entry['choices']], '']
            lines += ['**Limits:** '+entry['limits'], '',
                      '*Sources: '+', '.join(codes[c['document_id']] for c in entry['citations'])+'; entry `'+identity+'`.*','']
    lines += ['## Reference register', '']
    for ref in data['references']:
        lines += ['### '+ref['code']+' — '+ref['title'], '', ref['scope'], '']
    lines += ['## Coverage and use', '', data['coverage_note'], '',
              'This document and its printable PDF are two formats of the same reference. The source-binding register is provenance, not another design document.', '']
    return '\n'.join(lines)


def render_pdf(data, target):
    from reportlab.lib import colors
    from reportlab.lib.enums import TA_LEFT
    from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
    from reportlab.lib.units import inch
    from reportlab.pdfbase import pdfmetrics
    from reportlab.pdfbase.ttfonts import TTFont
    from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak, KeepTogether
    font_dir = Path('C:/Windows/Fonts')
    for name, filename in [('RefRegular','arial.ttf'), ('RefBold','arialbd.ttf'), ('RefItalic','ariali.ttf')]:
        pdfmetrics.registerFont(TTFont(name,str(font_dir/filename)))
    pdfmetrics.registerFontFamily('RefRegular', normal='RefRegular',bold='RefBold',italic='RefItalic',boldItalic='RefBold')
    styles = getSampleStyleSheet()
    for name in ['Normal','BodyText','Title','Heading1','Heading2']:
        styles[name].fontName='RefRegular'
    styles['BodyText'].fontSize=10.5
    styles['BodyText'].leading=14.6
    styles['BodyText'].spaceAfter=8
    styles['Title'].fontName='RefBold'; styles['Title'].fontSize=28; styles['Title'].leading=34
    styles['Title'].textColor=colors.HexColor('#14384A')
    styles['Heading1'].fontName='RefBold';styles['Heading1'].fontSize=20;styles['Heading1'].leading=25
    styles['Heading1'].spaceAfter=16
    styles['Heading2'].fontName='RefBold';styles['Heading2'].fontSize=13;styles['Heading2'].leading=17
    styles['Heading2'].spaceBefore=14;styles['Heading2'].spaceAfter=8
    styles.add(ParagraphStyle('Limits',parent=styles['BodyText'],fontSize=9.5,leading=13,textColor=colors.HexColor('#344B59')))
    styles.add(ParagraphStyle('Citation',parent=styles['BodyText'],fontSize=8,leading=11,textColor=colors.HexColor('#526570'),spaceAfter=12))
    claims={c['id']:c for c in data['claims']}
    codes={r['document_id']:r['code'] for r in data['references']}
    story=[]
    def p(text,style='BodyText'):
        return Paragraph(escape(text),styles[style])
    story += [Spacer(1,0.7*inch),p(data['title'],'Title'),Spacer(1,20),p(data['subtitle'])]
    story += [p(t) for t in data['introduction']]
    story += [Spacer(1,16),p('One functionality reference • October 2026','Citation'),PageBreak(),p('Contents','Heading1')]
    for i,chapter in enumerate(data['chapters'],1):
        story.append(Paragraph(f'<link href="#{chapter["id"]}" color="#14384A">{i}. {escape(chapter["title"])}</link>',styles['BodyText']))
    story += [Spacer(1,14),p('Neutral reference codes connect each explanation to the retained sources. The accompanying source-binding register records exact hashes and passage locations for every entry.','Limits')]
    for chapter in data['chapters']:
        story += [PageBreak(),Paragraph(f'<a name="{chapter["id"]}"/>'+escape(chapter['title']),styles['Heading1']),p(chapter['overview'])]
        for identity in chapter['entries']:
            entry=claims[identity]
            block=[p(entry['title'],'Heading2'),p(entry['summary'])]
            block += [p(t) for t in entry['paragraphs']]
            block += [p('Configuration: '+t) for t in entry.get('choices',[])]
            block += [p('Limits: '+entry['limits'],'Limits'),p('Sources: '+', '.join(codes[c['document_id']] for c in entry['citations'])+' | '+identity.replace('_',' '),'Citation')]
            story.append(KeepTogether(block))
    story += [PageBreak(),p('Reference register','Heading1')]
    for ref in data['references']:
        story += [KeepTogether([p(ref['code']+' — '+ref['title'],'Heading2'),p(ref['scope'])])]
    story += [Spacer(1,14),p('Coverage and use','Heading2'),p(data['coverage_note']),p('This PDF and the repository Markdown are two formats of one reference. The source-binding register is technical provenance.','Limits')]
    def furniture(canvas, doc):
        canvas.saveState()
        canvas.setStrokeColor(colors.HexColor('#BACAD1'));canvas.setLineWidth(.4)
        canvas.line(48,42,564,42)
        canvas.setFont('RefRegular',8);canvas.setFillColor(colors.HexColor('#526570'))
        canvas.drawString(48,28,'SCALE Functionality Reference SDD')
        canvas.drawRightString(564,28,str(doc.page))
        canvas.restoreState()
    target.parent.mkdir(parents=True,exist_ok=True)
    doc=SimpleDocTemplate(str(target),pagesize=(612,792),rightMargin=48,leftMargin=48,topMargin=44,bottomMargin=56,
        title=data['title'],author='SCALE Intelligence',subject='Client-neutral SCALE functionality reference',
        pageCompression=1,invariant=1)
    doc.build(story,onFirstPage=furniture,onLaterPages=furniture)


if __name__ == '__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--pdf',action='store_true')
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    data=validate(json.loads((ROOT/REGISTER).read_text(encoding='utf-8')))
    markdown=render_markdown(data)
    if args.check:
        if (ROOT/MARKDOWN).read_text(encoding='utf-8') != markdown:
            raise SystemExit('Central Markdown differs from its register')
    else:
        (ROOT/MARKDOWN).write_text(markdown,encoding='utf-8',newline='\n')
    if args.pdf:
        render_pdf(data,ROOT/PDF)
    print(json.dumps({'chapters':len(data['chapters']),'entries':len(data['claims']),'references':len(data['references']),'check':args.check,'pdf':args.pdf}))
