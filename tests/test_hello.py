from unittest import TestCase
from unittest.mock import patch

import hello

class TestHello(TestCase):

    def setUp(self):
        self.patches = []
        self.patches.append(patch("hello.cowsay.stegosaurus"))
        self.stegosaurus = self.patches[-1].start()

    def tearDown(self):
        for p in self.patches:
            p.stop()


    def test_hello(self):
        hello.hello()
        self.stegosaurus.assert_called_once_with("I'm a giraffe!")

