import sys
from pathlib import Path
import unittest
import tempfile
import time
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/"tools"))
from collector import SEEDS
from stage_transport import StageTransport, AcquisitionBlocked, validate_body, retry_after


class Response:
    def __init__(self,status=200,body=b'<html><body>MadCap</body></html>',headers=None,url=None):
        self.status=status; self.raw=body; self.headers=headers or {'content-type':'text/html'}
        self.url=url or SEEDS['AIM']; self.disposed=False
    def body(self): return self.raw
    def dispose(self): self.disposed=True


class Requests:
    def __init__(self,*responses): self.responses=list(responses); self.calls=[]
    def get(self,url,**kwargs):
        self.calls.append((url,kwargs))
        response=self.responses.pop(0)
        if isinstance(response,Exception): raise response
        return response


class TransportTests(unittest.TestCase):
    def transport(self,requests):
        elapsed=[0.0]
        def sleep(delay): elapsed[0]+=delay
        return StageTransport(requests,clock=lambda:elapsed[0],sleep=sleep), elapsed

    def test_raw_bytes_and_response_disposal(self):
        response=Response(body=b'<html><body>\xff\x93MadCap\r\n</body></html>')
        request=Requests(response); transport,_=self.transport(request)
        data,metadata=transport.get(SEEDS['AIM'])
        self.assertEqual(data,response.raw)
        self.assertTrue(response.disposed)
        self.assertEqual(metadata['http_status'],200)
        self.assertEqual(request.calls[0][1]['max_redirects'],0)
        self.assertEqual(request.calls[0][1]['max_retries'],0)

    def test_redirect_outside_scope_never_requested(self):
        for location in ['/scale/trans/dashboard','https://other.example/login',SEEDS['SDK']]:
            request=Requests(Response(302,headers={'location':location}))
            transport,_=self.transport(request)
            with self.assertRaises(AcquisitionBlocked): transport.get(SEEDS['AIM'])
            self.assertEqual(len(request.calls),1)

    def test_in_scope_redirect_provenance_and_request_spacing(self):
        target=SEEDS['AIM'].replace('OnlineHelp.htm','Content/sample.htm')
        request=Requests(Response(302,headers={'location':target}),Response(url=target),Response())
        transport,elapsed=self.transport(request)
        _,metadata=transport.get(SEEDS['AIM'])
        self.assertEqual(metadata['redirect_chain'][0]['target_url'],target)
        transport.get(SEEDS['AIM'])
        self.assertGreaterEqual(elapsed[0],1.0)

    def test_rate_limit_respected_before_next_request(self):
        request=Requests(Response(429,headers={'retry-after':'7'}),Response())
        transport,elapsed=self.transport(request)
        with self.assertRaisesRegex(AcquisitionBlocked,'RATE_LIMIT'):transport.get(SEEDS['AIM'])
        transport.get(SEEDS['AIM'])
        self.assertGreaterEqual(elapsed[0],7)
        self.assertEqual(retry_after('not-a-date'),0)

    def test_circuit_breaker_after_three_origin_failures(self):
        request=Requests(*[OSError('ENOTFOUND') for _ in range(3)])
        transport,_=self.transport(request)
        for _ in range(3):
            with self.assertRaisesRegex(AcquisitionBlocked,'DNS'):transport.get(SEEDS['AIM'])
        with self.assertRaisesRegex(AcquisitionBlocked,'CIRCUIT_OPEN'):transport.get(SEEDS['AIM'])
        self.assertEqual(len(request.calls),3)

    def test_login_soft_error_and_asset_contamination(self):
        for body in [b'<html><body><input type="password"></body></html>',b'<html><title>Access denied</title></html>',b'<html><title>404 Not Found</title></html>']:
            with self.assertRaises(AcquisitionBlocked):validate_body(SEEDS['AIM'],'text/html',body)
        with self.assertRaisesRegex(AcquisitionBlocked,'UNEXPECTED_HTML'):
            validate_body(SEEDS['AIM'].replace('OnlineHelp.htm','a.png'),'image/png',b'<html><body>error</body></html>')
        validate_body(SEEDS['AIM'],'text/html',b'<html><body>MadCap documentation about login functionality.</body></html>')

    def test_documentation_error_title_and_server_error(self):
        validate_body(SEEDS['AIM'],'text/html',b'<html data-mc-runtime-file-type="Topic"><title>Error Codes</title><body><h1>Error Codes</h1></body></html>')
        with self.assertRaises(AcquisitionBlocked):
            validate_body(SEEDS['AIM'],'text/html',b'<html><title>Server Error in application</title><body>Service unavailable</body></html>')
        validate_body(SEEDS['AIM'].replace('OnlineHelp.htm','empty.js'),'application/javascript',b'')
        with self.assertRaises(AcquisitionBlocked):validate_body(SEEDS['AIM'],'text/html',b'')

    def test_cooldown_survives_restart_without_a_request(self):
        with tempfile.TemporaryDirectory() as folder:
            path=Path(folder)/'cooldown.json'
            request=Requests(Response(429,headers={'retry-after':'300'}))
            transport=StageTransport(request,cooldown_path=path)
            with self.assertRaisesRegex(AcquisitionBlocked,'RATE_LIMIT'):transport.get(SEEDS['AIM'])
            resumed_request=Requests()
            resumed=StageTransport(resumed_request,cooldown_path=path)
            with self.assertRaisesRegex(AcquisitionBlocked,'RATE_LIMIT_WAIT'):resumed.get(SEEDS['AIM'])
            self.assertEqual(resumed_request.calls,[])

    def test_body_failure_is_classified_and_disposed(self):
        response=Response()
        def fail():raise TimeoutError('timeout')
        response.body=fail
        transport,_=self.transport(Requests(response))
        with self.assertRaisesRegex(AcquisitionBlocked,'TIMEOUT'):transport.get(SEEDS['AIM'])
        self.assertTrue(response.disposed)


if __name__=='__main__': unittest.main()
