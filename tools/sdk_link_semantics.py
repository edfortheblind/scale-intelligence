"""Source-bound SDK editorial references and native HTML fragment semantics."""
from urllib.parse import unquote
from audit_module import required_external_reference as default_required

EDITORIAL = {
 ('d3050a31dc639b31cc395e31c64f931e3d04ac7c888cc5f6949d4bcb16a9916d','n112','http://www.json.org/json2.js'): 'External software reference in an informational paragraph; not a loaded documentation resource.',
 ('913c7fe31d59e124b4c85713cc5131f3b97a94b5c84231fc7f2cda328c596151','n48','https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms159253(v=sql.105)'): 'External documentation citation; the route suffix does not identify a download.',
 ('c51d64f300f18a0cba426ee01f5bf39b1d3b9e2b5694ea1a96d3d7a34640d392','n60','https://github.com/mozilla/pdf.js'): 'External project information link; not an embedded script.',
 ('fefe2fa3add9143e0b63ee8a394fb41ed82efb0256b8f7f46cd6fc6c2b869ba5','n167','file:/%25scale_home%25/Settings/Custom.xml'): 'Literal configuration example with an environment placeholder; not an acquired Stage attachment.'
}

def fragment_supported(fragment,anchors):
    value=unquote(fragment or '')
    return not value or value in anchors or value.lower()=='top'

def required_external_reference(ref,source_nodes):
    node=source_nodes.get(ref.get('node_id'),{})
    key=(ref.get('source_sha256'),ref.get('node_id'),ref.get('original_href'))
    if (key in EDITORIAL and ref.get('tag')=='a' and ref.get('attribute')=='href'
        and node.get('tag')=='a' and node.get('attrs',{}).get('href')==ref['original_href']
        and 'download' not in node.get('attrs',{})):
        return False
    return default_required(ref,source_nodes)
