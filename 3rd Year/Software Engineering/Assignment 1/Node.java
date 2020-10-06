public class Node {
    private char key;
    private Node parent;

    Node(char key, Node parent) {
        this.key = key;
        this.parent = parent;
    }

    public char getParentKey() {
        return parent.key;
    }

    
}
