"""Parse published define(literal) data without evaluating JavaScript."""
import re


class LiteralParser:
    def __init__(self, text):
        self.text = text.lstrip('\ufeff')
        self.pos = 0

    def space(self):
        while self.pos < len(self.text):
            match = re.match(r'(?:\s+|//[^\n]*(?:\n|$)|/\*[\s\S]*?\*/)', self.text[self.pos:])
            if not match:
                break
            self.pos += len(match[0])

    def take(self, token):
        self.space()
        if not self.text.startswith(token, self.pos):
            raise ValueError('Static literal syntax at offset ' + str(self.pos))
        self.pos += len(token)

    def string(self):
        quote = self.text[self.pos]
        self.pos += 1
        result = []
        escapes = {'n':'\n', 'r':'\r', 't':'\t', 'b':'\b', 'f':'\f', 'v':'\v', '0':'\0'}
        while self.pos < len(self.text):
            char = self.text[self.pos]
            self.pos += 1
            if char == quote:
                return ''.join(result)
            if char == '\\':
                char = self.text[self.pos]
                self.pos += 1
                if char in ('u', 'x'):
                    size = 4 if char == 'u' else 2
                    result.append(chr(int(self.text[self.pos:self.pos+size], 16)))
                    self.pos += size
                elif char == '\r':
                    if self.text[self.pos:self.pos+1] == '\n':
                        self.pos += 1
                elif char != '\n':
                    result.append(escapes.get(char, char))
            else:
                result.append(char)
        raise ValueError('Unterminated static string')

    def value(self, depth=0):
        if depth > 150:
            raise ValueError('Literal nesting exceeds safe limit')
        self.space()
        char = self.text[self.pos:self.pos+1]
        if char in ('"', "'"):
            return self.string()
        if char in ('{', '['):
            self.pos += 1
            obj = {} if char == '{' else []
            end = '}' if char == '{' else ']'
            self.space()
            while self.text[self.pos:self.pos+1] != end:
                if char == '{':
                    self.space()
                    if self.text[self.pos:self.pos+1] in ('"', "'"):
                        key = self.string()
                    else:
                        match = re.match(r'[A-Za-z_$][\w$]*|\d+', self.text[self.pos:])
                        if not match:
                            raise ValueError('Unsupported object key')
                        key = match[0]
                        self.pos += len(key)
                    self.take(':')
                    if key in obj:
                        raise ValueError('Duplicate data key')
                    obj[key] = self.value(depth+1)
                else:
                    obj.append(self.value(depth+1))
                self.space()
                if self.text[self.pos:self.pos+1] == end:
                    break
                self.take(',')
                self.space()
            self.take(end)
            return obj
        match = re.match(r'-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?|true\b|false\b|null\b', self.text[self.pos:])
        if not match:
            raise ValueError('Executable or unsupported syntax at offset ' + str(self.pos))
        token = match[0]
        self.pos += len(token)
        if token in ('true', 'false', 'null'):
            return {'true':True, 'false':False, 'null':None}[token]
        return float(token) if any(c in token for c in '.eE') else int(token)


def parse_define(text):
    parser = LiteralParser(text)
    parser.take('define')
    parser.take('(')
    value = parser.value()
    parser.take(')')
    parser.space()
    if parser.text[parser.pos:parser.pos+1] == ';':
        parser.pos += 1
    parser.space()
    if parser.pos != len(parser.text):
        raise ValueError('Trailing executable or unsupported syntax')
    return value
