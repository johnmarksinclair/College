// written by John
//seaches both comments and stories for those matching a username and updates the number of matching stories/ comments  
void searchUsername(String username) {
  matchingStories = searchUserStory(username);
  numberOfMatchingStories = matchingStories.size();
  matchingComments = searchUserComment(username);
  numberOfMatchingComments = matchingComments.size();
}

// written by John
//searches stories for a specific username
//parameters:
//  username (String)
//returns:
//  a list of relevant stories
ArrayList<Story> searchUserStory(String username) {
  ArrayList<Story> relevantStories = new ArrayList<Story>();
  for (int i = 0; i < storyList.size(); i++) {
    if (storyList.get(i).by.equals(username)) {
      relevantStories.add(storyList.get(i));
    }
  }
  return relevantStories;
}

// written by John
//searches comments for a specific username
//parameters:
//  username (String)
//returns:
//  an list of relevant stories
ArrayList<Comment> searchUserComment(String username) {
  ArrayList<Comment> relevantComments = new ArrayList<Comment>();
  for (int i = 0; i < commentList.size(); i++) {
    if (commentList.get(i).by.equals(username)) {
      relevantComments.add(commentList.get(i));
    }
  }
  return relevantComments;
}

// written by John
//searches stories for titles matching an inputted string
//parameters:
//  title (String)
//returns:
//  a list of relevant stories
ArrayList<Story> searchStoryTitles(String title) {
  ArrayList<Story> relevantStories = new ArrayList<Story>();
  for (int i = 0; i < storyList.size(); i++) {
    boolean firstIndex = storyList.get(i).title.toLowerCase().contains(title.toLowerCase());
    if (firstIndex) {
      relevantStories.add(storyList.get(i));
    }
  }
  return relevantStories;
}

// written by John
//searches comments for text matching an inputted string
//parameters:
//  text (String)
//returns:
//  a list of relevant comments
ArrayList<Comment> searchComments(String input) {
  ArrayList<Comment> relevantComments = new ArrayList<Comment>();
  for (int index = 0; index < 100/*commentList.size()*/; index++) {
    boolean firstIndex = commentList.get(index).text.toLowerCase().contains(input.toLowerCase());
    if (firstIndex) {
      relevantComments.add(commentList.get(index));
    }
  }
  return relevantComments;
}

// written by John
ArrayList<Story> searchByTime(String time) {
  ArrayList<Story> relevantStories = new ArrayList<Story>();
  for (int i = 0; i < storyList.size(); i++) {
    if (time.equals(Integer.toString(storyList.get(i).time))) {
    }
  }
  return relevantStories;
}
