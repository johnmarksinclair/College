/*
    a
   / \
  b   c
 / \
d   e
   / \
  f   g
*/

public class LCA {
    public static void main(String[] args) {
        Node a = new Node('a', null);
        Node b = new Node('b', a);
        Node c = new Node('c', a);
        Node d = new Node('d', b);
        Node e = new Node('e', b);
        Node f = new Node('f', e);
        Node g = new Node('g', e);
        System.out.println("Should be 'b' - " + getLCA(d,f));
        System.out.println("Should be 'e' - " + getLCA(f,g));
        System.out.println("Should be 'a' - " + getLCA(g, c));
        System.out.println("Should be '0' - " + getLCA(a, b));

    }

    public static char getLCA(Node one, Node two) {
        if (one.hasParent() && two.hasParent()) {
            if (one.getParentKey() == two.getParentKey()) {
                return one.getParentKey();
            } else if (one.getTeir() < two.getTeir()) {
                return getLCA(one, two.getParent());
            } else {
                return getLCA(two, one.getParent());
            }
        }
        return '0';
    }
}