public class Node {
	
    private char key;
    private Node parent;
    private int tier;

    Node(char key, Node parent) {
        this.key = key;
        this.parent = parent;
        if (this.parent!=null) {
            this.tier = parent.getTier()+1;
        } else {
            this.tier = 0;
        }
    }

    public char getParentKey() {
        return parent.key;
    }

    public Node getParent() {
        return this.parent;
    }

    public boolean hasParent() {
        return (parent==null ? false : true);
    }

    public int getTier() {
        return this.tier;
    }
}
