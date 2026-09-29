import sys
import tempfile
from pathlib import Path
import unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
from collector import atomic_json, digest
from verify_delivery import verify, verify_inventory


class DeliveryInventoryTests(unittest.TestCase):
    def test_empty_root_cannot_pass_delivery(self):
        with tempfile.TemporaryDirectory() as folder:
            result=verify(Path(folder)/'absent')
            self.assertFalse(result['checkpoint_integrity_passed'])
            self.assertTrue(any(f['error']=='ARTIFACT_INVENTORY_MISSING' for f in result['failures']))

    def test_deleted_navigation_and_changed_reading_css_are_detected(self):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder);items=[]
            for relative,raw in [('AIM/reading/assets/style.css',b'p{color:black}'),('AIM/docs/INDEX.md',b'Index')]:
                path=root/relative;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw)
                items.append({'path':relative,'sha256':digest(raw),'byte_count':len(raw)})
            atomic_json(root/'_project/artifact-inventory.json',{'schema_version':1,'file_count':2,'files':items})
            self.assertEqual(verify_inventory(root),(2,[]))
            (root/items[0]['path']).write_bytes(b'p{color:green}')
            (root/items[1]['path']).unlink()
            count,errors=verify_inventory(root)
            self.assertEqual(count,0)
            self.assertEqual({e['path'] for e in errors},{i['path'] for i in items})


if __name__=='__main__':unittest.main()
