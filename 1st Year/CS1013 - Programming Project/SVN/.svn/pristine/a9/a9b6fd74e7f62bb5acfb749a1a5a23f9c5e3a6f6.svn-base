//prints out a list of Story objects
void printStoryList(ArrayList<Story> list) {
  for (int index = 0; index < list.size(); index++) {
    list.get(index).printStory();
  }
}

//prints out a list of Comment objects
void printCommentList(ArrayList<Comment> list) {
  for (int index = 0; index < list.size(); index++) {
    list.get(index).printComment();
  }
}

//prints out story titles to screen
void printHomepageStories() {
  textFont(titleFont);
  textSize(SUB_HEADING_SIZE);
  text("Most Recent Stories:", WIDGETX + 10, BANNERY + 30);
  textFont(widgetFont);
  textSize(STORY_SIZE);
  for (int i = 0; i < storyList.size(); i++) {
    text(storyList.get(i).title, WIDGETX + 10, BANNERY + 60 +(i*30));
  }
}

//prints out matching stories
void printMatchingStories() {
  for (int i = 0; i < 15; i++) {
    text(matchingStories.get(i).title, WIDGETX + 10, BANNERY + 30 +(i*50));
  }
}
