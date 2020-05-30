class Story { 

  ArrayList<Integer> kids;
  int descendants; 
  String url;
  String title;
  String by;
  int score;
  int time; 
  int id;

  Story (ArrayList<Integer> kids, int descendants, String url, String title, String by, int score, int time, int id) {
    this.kids = kids;
    this.descendants = descendants; 
    this.score = score;
    this.id = id;  
    this.time = time;
    this.url = url;
    this.title = title;
    this.by = by;
  }

  void printStory() {
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
    println("Type: Story, Kids: " + kidString + ", Descendants: " + descendants + ", Url: " + url + ", Title: " + title + ", by: " + by + ", Score: " + score + ", Time: " + time + ", id: " + id + "\n");
  }
}
