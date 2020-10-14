import unittest
import LCA

class TestLCA(unittest.TestCase):

    def test_lca(self):
        a = LCA.Node('a', None)
        b = LCA.Node('b', a)
        c = LCA.Node('c', a)
        d = LCA.Node('d', b)
        e = LCA.Node('e', b)
        f = LCA.Node('f', e)   
        g = LCA.Node('g', e)
        h = LCA.Node('h', c)
        self.assertEqual('b', LCA.getLCA(d,f))
        self.assertEqual('e', LCA.getLCA(f,g))
        self.assertEqual('a', LCA.getLCA(g,c))
        self.assertEqual('a', LCA.getLCA(d,h))
        self.assertEqual('none', LCA.getLCA(a,b))

if __name__ == "__main__":
    unittest.main()