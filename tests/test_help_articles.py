"""Reader-facing article contracts; source integrity is tested separately."""
import copy
from html.parser import HTMLParser
from collections import Counter
import unittest

from tests.test_help_app import Knowledge, render_page


class ArticleText(HTMLParser):
    def __init__(self):
        super().__init__()
        self.in_article = False
        self.details = 0
        self.blocks = []
        self.current = None
        self.reference_depth = None

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == 'article':
            self.in_article = True
        if self.in_article and tag == 'details':
            self.details += 1
        if self.in_article and not self.details and tag in ('p', 'li'):
            self.current = []

    def handle_data(self, data):
        if self.current is not None and self.in_article and not self.details:
            self.current.append(data)

    def handle_endtag(self, tag):
        if tag in ('p', 'li') and self.current is not None:
            self.blocks.append(' '.join(''.join(self.current).split()))
            self.current = None
        if self.in_article and tag == 'details':
            self.details -= 1
        if tag == 'article':
            self.in_article = False


class ArticleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.knowledge = Knowledge()

    def test_directory_links_every_article_once_and_exposes_setup_guides(self):
        page = render_page(self.knowledge).decode()
        self.assertIn('Configure SCALE', page)
        for key in self.knowledge.topics:
            self.assertEqual(page.count('/topic/'+key+'#answer'), 1, key)
        for key in ('work-profile-configuration', 'packing-preference-configuration', 'receiving-overage-configuration'):
            self.assertEqual(self.knowledge.topic(key)['article_type'], 'configuration')
            article = render_page(self.knowledge, topic_id=key).decode()
            self.assertIn('<h3>How to configure</h3>', article)
            self.assertNotIn('All other articles', article)

    def test_every_article_has_distinct_primary_blocks_without_project_chatter(self):
        forbidden = ('owner accepts', 'owner accepted', 'owner said', 'clutter removed', 'no redundancy', 'review credit', 'batch credit')
        for key in self.knowledge.topics:
            with self.subTest(topic=key):
                parser = ArticleText()
                parser.feed(render_page(self.knowledge, topic_id=key).decode())
                counts = Counter(text.casefold().rstrip('.') for text in parser.blocks if len(text) > 40)
                self.assertFalse([text for text, count in counts.items() if count > 1])
                prose = ' '.join(parser.blocks).casefold()
                self.assertFalse([text for text in forbidden if text in prose])

    def test_optional_sections_do_not_leave_empty_headings(self):
        knowledge = copy.copy(self.knowledge)
        knowledge.topics = copy.deepcopy(self.knowledge.topics)
        topic = knowledge.topics['shipment-detail']
        for field in ('configuration_dependencies', 'expected_results', 'explanation_paths', 'boundaries'):
            topic[field] = []
        topic['trigger'] = ''
        page = render_page(knowledge, topic_id='shipment-detail').decode()
        for title in ('Settings and prerequisites', 'Results', 'Troubleshooting', 'Limits'):
            self.assertNotIn('<h3>'+title+'</h3>', page)
        self.assertIn('<details class="references"><summary>Technical reference and sources</summary>', page)
        self.assertIn('Source SHA-256:', page)

    def test_related_articles_and_page_titles_are_escaped(self):
        knowledge = copy.copy(self.knowledge)
        knowledge.topics = copy.deepcopy(self.knowledge.topics)
        knowledge.topics['shipment-detail']['title'] = '<script>title</script>'
        knowledge.topics['shipment-detail']['related_topics'] = ['work-profile-configuration']
        page = render_page(knowledge, topic_id='shipment-detail').decode()
        self.assertNotIn('<script>', page)
        self.assertIn('&lt;script&gt;title&lt;/script&gt; | SCALE Knowledge</title>', page)
        self.assertIn('/topic/work-profile-configuration#answer', page)


if __name__ == '__main__':
    unittest.main()
