public class Node {
    private char key;
    private Node parent;

    Node(char key, Node parent) {
        this.key = key;
        this.parent = parent;
    }

    public char getKey() {
        return this.key;
    }

    public char getParentKey() {
        return parent.key;
    }

    public Node getParent() {
        return parent;
    }

    public boolean hasParent() {
        if(parent!=null) {
            return true;
        } else {
            return false;
        }
    }
}
