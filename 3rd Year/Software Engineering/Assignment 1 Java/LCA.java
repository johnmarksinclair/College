/*
    a
   / \
  b   c
 / \   \
d   e   h
   / \
  f   g
*/

public class LCA {

    public static char getLCA(Node one, Node two) {
        if (one.hasParent() && two.hasParent()) {
            if (one.getParentKey() == two.getParentKey()) {
                return one.getParentKey();
            } else if (one.getTier() < two.getTier()) {
                return getLCA(one, two.getParent());
            } else {
                return getLCA(two, one.getParent());
            }
        }
        return '0';
    }
}