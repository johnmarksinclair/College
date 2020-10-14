import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class LCATest {

	@Test
	void testLCA() {
		Node a = new Node('a', null);
        Node b = new Node('b', a);
        Node c = new Node('c', a);
        Node d = new Node('d', b);
        Node e = new Node('e', b);
        Node f = new Node('f', e);
        Node g = new Node('g', e);
        Node h = new Node('h', c);
        assertEquals('b', LCA.getLCA(d, f));
        assertEquals('e', LCA.getLCA(f, g));
        assertEquals('a', LCA.getLCA(g, c));
        assertEquals('a', LCA.getLCA(d, h));
        assertEquals('0', LCA.getLCA(a, b));
	}

}
