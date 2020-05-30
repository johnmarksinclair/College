class Comment {

  ArrayList<Integer> kids;
  int parent;
  String text;
  int id;
  int time;
  String by;
  String formattedTime;

  Comment (ArrayList<Integer> kids, int parent, String text, int id, int time, String by) {
    this.kids = kids;
    this.parent = parent;
    this.text = text;
    this.by = by;
    this.time = time;
    this.id = id;
    formattedTime = formatUnixTime(time);
  }

  void printComment() {
    String kidString = "None";
    if (kids.size() == 1) {
      kidString = "[" + kids.get(0) + "]";
    } else {
      for (int index = 0; index < kids.size(); index++) {
        if (index == 0) {
          kidString = "[" + kids.get(index);
        } else if (index == kids.size()-1) {
          kidString += kids.get(index) + "]";
        } else {
          kidString += kids.get(index) + ", ";
        }
      }
    }
    println("Type: Comment, Kids: " + kidString + ", Parent: " + parent + ", text: " + text + ", by: " + by + ", Time: " + time + ", id: " + id + "\n");
  }
}
