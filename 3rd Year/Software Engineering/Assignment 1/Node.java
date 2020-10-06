public class Node {
    private char key;
    private Node parent;
    private int tier;

    Node(char key, Node parent) {
        this.key = key;
        this.parent = parent;
        if (this.parent!=null) {
            this.tier = parent.getTeir()+1;
        } else {
            this.tier = 0;
        }
    }

    public char getKey() {
        return this.key;
    }

    public char getParentKey() {
        return parent.key;
    }

    public Node getParent() {
        return this.parent;
    }

    public boolean hasParent() {
        if(parent!=null) {
            return true;
        } else {
            return false;
        }
    }

    public int getTeir() {
        return this.tier;
    }
}
