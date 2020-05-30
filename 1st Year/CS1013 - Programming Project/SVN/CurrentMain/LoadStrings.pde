void loadStrings() { // written by John 
  storyList = new ArrayList<Story>();
  commentList = new ArrayList<Comment>();
  String[] lines = loadStrings("news.json");
  for (int index = 0; index < lines.length; index++) {
    JSONObject temp = parseJSONObject(lines[index]);
    if (temp.hasKey("type")) {
      String type = temp.getString("type");
      if (type.equals("story")) {
        ArrayList<Integer> kids = new ArrayList<Integer>();
        if (temp.hasKey("kids")) {
          JSONArray kidValues = temp.getJSONArray("kids");
          for (int i = 0; i < kidValues.size(); i++) {
            int tempKid = kidValues.getInt(i);
            kids.add(tempKid);
          }
        }
        int descendants = -1;
        if (temp.hasKey("descendants")) {
          descendants = temp.getInt("descendants");
        }
        String url = "";
        if (temp.hasKey("url")) {
          url = temp.getString("url");
        } 
        String title = "";
        if (temp.hasKey("title")) {
          title = temp.getString("title");
        }
        String by = "";
        if (temp.hasKey("by")) {
          by = temp.getString("by");
        }
        int score = -1;
        if (temp.hasKey("score")) {
          score = temp.getInt("score");
        }
        int time = -1;
        if (temp.hasKey("time")) {
          time = temp.getInt("time");
        }
        int id = -1;
        if (temp.hasKey("id")) {
          id = temp.getInt("id");
        }
        Story story = new Story(kids, descendants, url, title, by, score, time, id);
        storyList.add(story);
      } else if (type.equals("comment")) {
        ArrayList<Integer> kids = new ArrayList<Integer>();
        if (temp.hasKey("kids")) {
          JSONArray kidValues = temp.getJSONArray("kids");
          for (int i = 0; i < kidValues.size(); i++) {
            int tempKid = kidValues.getInt(i);
            kids.add(tempKid);
          }
        }
        int parent = -1;
        if (temp.hasKey("parent")) {
          parent = temp.getInt("parent");
        }
        String text = "";
        if (temp.hasKey("text")) {
          text = temp.getString("text");
        }
        int id = -1;
        if (temp.hasKey("id"))  {
          id = temp.getInt("id");
        }
        int time = -1;
        if (temp.hasKey("time")) {
          time = temp.getInt("time");
        }
        String by = "";
        if (temp.hasKey("by")) {
          by = temp.getString("by");
        }
        Comment comment = new Comment(kids, parent, text, id, time, by);
        commentList.add(comment);
      }
    }
  }
}
