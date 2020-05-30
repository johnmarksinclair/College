Widget widgetUrl;
ArrayList<Widget> widgetList = new ArrayList<Widget>();

//prints out homepage story titles to screen // written by John
void printHomepageStories() {
  if (recent) {
    textFont(titleFont);
    textSize(SUB_HEADING_SIZE);
    fill(0);
    text("Most Recent Stories:", WIDGETX + 10, MAIN_BANNER_Y + SUB_BANNER_Y + 30 - vs2.spos);
    textFont(widgetFont);
    for (int i = 0; i < latestStories.size(); i++) {
      textSize(STORY_SIZE);
      text(latestStories.get(i).score, WIDGETX + 15, MAIN_BANNER_Y + SUB_BANNER_Y + 65 +(i*40) - vs2.spos);
      text(latestStories.get(i).title, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 60 +(i*40) - vs2.spos);
      textSize(AUTHOR_SIZE);
      text(latestStories.get(i).formattedTime, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
      text("Author: " + latestStories.get(i).by, WIDGETX + 200, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
    }
  } else  if (popular) {
    textFont(titleFont);
    textSize(SUB_HEADING_SIZE);
    fill(0);
    text("Most Popular Stories:", WIDGETX + 10, MAIN_BANNER_Y + SUB_BANNER_Y + 30 - vs2.spos);
    textFont(widgetFont);
    for (int i = 0; i < popularStories.size(); i++) {
      textSize(STORY_SIZE);
      text(popularStories.get(i).score, WIDGETX + 15, MAIN_BANNER_Y + SUB_BANNER_Y + 65 +(i*40) - vs2.spos);
      text(popularStories.get(i).title, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 60 +(i*40) - vs2.spos);
      textSize(AUTHOR_SIZE);
      text(popularStories.get(i).formattedTime, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
      text("Author: " + popularStories.get(i).by, WIDGETX + 200, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
    }
  } else if (oldest) {
    textFont(titleFont);
    textSize(SUB_HEADING_SIZE);
    fill(0);
    text("Oldest Stories:", WIDGETX + 10, MAIN_BANNER_Y + SUB_BANNER_Y + 30 - vs2.spos);
    textFont(widgetFont);
    for (int i = 0; i < storyList.size(); i++) {
      textSize(STORY_SIZE);
      text(storyList.get(i).score, WIDGETX + 15, MAIN_BANNER_Y + SUB_BANNER_Y + 65 +(i*40) - vs2.spos);
      text(storyList.get(i).title, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 60 +(i*40) - vs2.spos);
      textSize(AUTHOR_SIZE);
      text(storyList.get(i).formattedTime, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
      text("Author: " + storyList.get(i).by, WIDGETX + 200, MAIN_BANNER_Y + SUB_BANNER_Y + 75 +(i*40) - vs2.spos);
    }
  }
}

//prints out matching stories // written by John + Dom
void printMatchingStories() {
  if (matchingStories.size() >= 1) {
    float yPos;
    for (int i = 0; i < widgetList.size(); i ++) {
      mainScreen.removeWidget(widgetList.get(i));
    }
    for (int i = 0; i < matchingStories.size(); i++) {
      textSize(STORY_SIZE);
      fill(0);
      yPos = MAIN_BANNER_Y + SUB_BANNER_Y + 30 +(i*40) - vs2.spos;
      //text(matchingStories.get(i).score, WIDGETX + 15, MAIN_BANNER_Y + SUB_BANNER_Y + 35 +(i*40) - vs2.spos);
      text(matchingStories.get(i).title, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 30 +(i*40) - vs2.spos);
      textSize(AUTHOR_SIZE);
      text(matchingStories.get(i).formattedTime, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 45 +(i*40) - vs2.spos);
      text("Author: " + matchingStories.get(i).by, WIDGETX + 200, MAIN_BANNER_Y + SUB_BANNER_Y + 45 +(i*40) - vs2.spos);
      widgetUrl = new Widget(WIDGETX + 15, yPos -10, STORY_SIZE, STORY_SIZE, str(matchingStories.get(i).score), BLANK, BLANK, widgetFont, URL_LINK, matchingStories.get(i).url);
      widgetList.add(i, widgetUrl);
      if (widgetUrl.getYpos() <= MAIN_BANNER_Y + SUB_BANNER_Y) {
        mainScreen.removeWidget(widgetUrl);
      } else {
        mainScreen.addWidget(widgetUrl);
      }
    }
  } else {
    fill(0);
    text("No Matches", WIDGETX + 10, MAIN_BANNER_Y + SUB_BANNER_Y + 30);
  }
}

void printMatchingComments() { // written by John
  if (matchingComments.size() >= 1) {
    for (int i = 0; i < matchingComments.size(); i++) {
      textSize(STORY_SIZE);
      fill(0);
      text(matchingComments.get(i).text, WIDGETX + 15, MAIN_BANNER_Y + SUB_BANNER_Y + 30 +(i*40) - vs2.spos);
      textSize(AUTHOR_SIZE);
      text(matchingComments.get(i).formattedTime, WIDGETX + 50, MAIN_BANNER_Y + SUB_BANNER_Y + 45 +(i*40) - vs2.spos);
      text("Author: " + matchingComments.get(i).by, WIDGETX + 200, MAIN_BANNER_Y + SUB_BANNER_Y + 45 +(i*40) - vs2.spos);
    }
  } else {
    fill(0);
    text("No Matches", WIDGETX + 10, MAIN_BANNER_Y + SUB_BANNER_Y + 30);
  }
}

// Following methods written by Dom
String getUrl(float xPos, float yPos) {
  String url = null;
  for (int i = 0; i < widgetList.size(); i ++) {
    Widget currentWidget = widgetList.get(i);
    String temp = currentWidget.getUrl((int)xPos, (int)yPos);
    if (temp != null) {
      url = temp;
    }
  }
  return url;
}

void removeLinks() {
  for (int i = 0; i < widgetList.size(); i ++) {
    mainScreen.removeWidget(widgetList.get(i));
  }
}
