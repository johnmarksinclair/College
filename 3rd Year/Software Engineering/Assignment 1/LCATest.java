import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class LCATest {
    @Test
    public void testLCA() {
        Node a = new Node('a', null);
        Node b = new Node('b', a);
        Node c = new Node('c', a);
        Node d = new Node('d', b);
        Node e = new Node('e', b);
        Node f = new Node('f', e);
        Node g = new Node('g', e);
        Node h = new Node('h', c);

        
    }
    // System.out.println("Should be 'b' - " + getLCA(d,f));
    // System.out.println("Should be 'e' - " + getLCA(f,g));
    // System.out.println("Should be 'a' - " + getLCA(g,c));
    // System.out.println("Should be 'a' - " + getLCA(d,h));
    // System.out.println("Should be '0' - " + getLCA(a,b));
}