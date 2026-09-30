"""Serve the reviewed help library on loopback only; no arbitrary file serving."""
import argparse
from functools import partial
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import ipaddress
import json
import socket
from urllib.parse import parse_qs, unquote, urlsplit

from help_knowledge import Knowledge, ROOT
from render_help_page import render_page

ASSETS = {'/style.css': ('style.css', 'text/css; charset=utf-8')}


class HelpHandler(BaseHTTPRequestHandler):
    server_version = 'SCALEHelp/1'

    def __init__(self, *args, knowledge, **kwargs):
        self.knowledge = knowledge
        super().__init__(*args, **kwargs)

    def log_message(self, format, *args):
        # Queries may contain user-entered data; do not log request URLs.
        pass

    def respond(self, status, body, mime='application/json; charset=utf-8'):
        if not isinstance(body, bytes):
            body = json.dumps(body, ensure_ascii=False).encode('utf-8')
        self.send_response(status)
        self.send_header('Content-Type', mime)
        self.send_header('Content-Length', str(len(body)))
        self.send_header('Cache-Control', 'no-store')
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('Referrer-Policy', 'no-referrer')
        self.send_header('Content-Security-Policy', "default-src 'none'; script-src 'none'; style-src 'self'; connect-src 'self'; img-src 'self'; object-src 'none'; base-uri 'none'; frame-ancestors 'none'; form-action 'self'")
        self.end_headers()
        self.wfile.write(body)

    def allowed(self):
        try:
            host = urlsplit('//'+self.headers.get('Host', '')).hostname
            valid_host = host in {'127.0.0.1', 'localhost', '::1'}
            if not valid_host or not ipaddress.ip_address(self.client_address[0]).is_loopback:
                return False
            origin = self.headers.get('Origin')
            return not origin or origin == 'http://'+self.headers['Host']
        except ValueError:
            return False

    def do_GET(self):
        if not self.allowed():
            return self.respond(403, {'error': 'This preview accepts same-origin loopback requests only.'})
        try:
            target = urlsplit(self.path)
            path = unquote(target.path)
            if path == '/':
                values = parse_qs(target.query, keep_blank_values=True)
                if set(values) - {'q'} or len(values.get('q', [''])) != 1:
                    raise ValueError('Provide one q parameter.')
                return self.respond(200, render_page(self.knowledge, question=values.get('q', [''])[0]), 'text/html; charset=utf-8')
            if path.startswith('/topic/'):
                return self.respond(200, render_page(self.knowledge, topic_id=path.removeprefix('/topic/')), 'text/html; charset=utf-8')
            if path in ASSETS:
                filename, mime = ASSETS[path]
                return self.respond(200, (ROOT/'help_app'/filename).read_bytes(), mime)
            if path == '/api/status':
                return self.respond(200, self.knowledge.summary())
            if path == '/api/search':
                values = parse_qs(target.query, keep_blank_values=True)
                if set(values) - {'q'} or len(values.get('q', [''])) != 1:
                    raise ValueError('Provide one q parameter.')
                return self.respond(200, self.knowledge.search(values.get('q', [''])[0]))
            if path == '/api/topics':
                return self.respond(200, [{'topic_id': t['topic_id'], 'title': t['title']} for t in self.knowledge.topics.values()])
            if path.startswith('/api/topics/'):
                return self.respond(200, self.knowledge.topic(path.removeprefix('/api/topics/')))
            if path.startswith('/api/sources/'):
                return self.respond(200, self.knowledge.source(path.removeprefix('/api/sources/')))
            return self.respond(404, {'error': 'No reviewed resource exists at this address.'})
        except KeyError:
            return self.respond(404, {'error': 'The requested topic or source is unavailable.'})
        except ValueError as error:
            return self.respond(400, {'error': str(error)})

    def do_POST(self):
        self.respond(405, {'error': 'The help library is read-only.'})

    do_PUT = do_DELETE = do_PATCH = do_POST


class LocalHelpServer(ThreadingHTTPServer):
    allow_reuse_address = not hasattr(socket, 'SO_EXCLUSIVEADDRUSE')

    def server_bind(self):
        if hasattr(socket, 'SO_EXCLUSIVEADDRUSE'):
            self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_EXCLUSIVEADDRUSE, 1)
        super().server_bind()


def create_server(port=8765, knowledge=None):
    knowledge = knowledge or Knowledge()
    return LocalHelpServer(('127.0.0.1', port), partial(HelpHandler, knowledge=knowledge))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=8765)
    args = parser.parse_args()
    with create_server(args.port) as server:
        print(f'Reviewed SCALE help: http://127.0.0.1:{server.server_port}', flush=True)
        print('Local preview; no warehouse connection or user authentication.', flush=True)
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            pass
