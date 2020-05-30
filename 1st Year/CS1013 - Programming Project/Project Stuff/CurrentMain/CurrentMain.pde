import java.util.*;

ArrayList<Story> storyList;
ArrayList<Comment> commentList;
ArrayList<Integer> listOfResults = new ArrayList<Integer>();
JSONObject temp;
int numberOfMatchingStories, numberOfMatchingComments;
ArrayList<Story> matchingStories = new ArrayList<Story>();
ArrayList<Comment> matchingComments = new ArrayList<Comment>();
String currentQueryType;
Textbox textbox;
String text, msg, username;
PImage logo;
PFont stdFont, widgetFont, titleFont;
int currentScreen = 0;
Screen screen1;
Screen screen2;
Screen screenBarGraph;
int currentQuery;
boolean widgetClicked = false;
boolean widgetsOut = false;
boolean homepage = true;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  fill(0);
  textbox = new Textbox(SCREENX-SEARCHBARX, BANNERY-SEARCHBARY, SEARCHBARX, SEARCHBARY);
  loadStrings();
  Collections.reverse(storyList);
  Collections.reverse(commentList);
  logo = loadImage("logo1.jpg");
  BarGraph barGraph1;
  screen1 = new Screen();
  screen2 = new Screen();
  screenBarGraph = new Screen();
  widgetFont=loadFont("HiraginoSans-W4-16.vlw"); 
  titleFont = loadFont("HelveticaNeue-Bold-50.vlw");
  textFont(widgetFont); 
  widgetQuery = new Widget(0, BANNERY, WIDGETX, WIDGETY, "BAR CHART", color(255), widgetFont, QUERY_BUTTON);
  widgetType = new Widget(0, BANNERY+WIDGETY, WIDGETX, WIDGETY, "TYPE", color (255), widgetFont, TYPE_BUTTON);
  widgetBack = new Widget(20, 500, 100, 40, "Back", color(0, 150, 255), widgetFont, BACK_BUTTON);
  widgetStory = new Widget(WIDGETX, BANNERY+WIDGETY, WIDGETX, WIDGETY, "STORY", color(255), stdFont, STORY_BUTTON);
  widgetComment = new Widget(WIDGETX, BANNERY+2*WIDGETY, WIDGETX, WIDGETY, "COMMENT", color(255), widgetFont, COMMENT_BUTTON);
  widgetAuthor = new Widget(0, BANNERY+2*WIDGETY, WIDGETX, WIDGETY, "AUTHOR", color(255), widgetFont, AUTHOR_BUTTON);
  barGraph1 = new BarGraph(listOfResults);
  screen1.addWidget(widgetQuery);
  screen1.addWidget(widgetType);
  screen1.addWidget(widgetAuthor);
  screenBarGraph.addBarGraph(barGraph1);
  screenBarGraph.addWidget(widgetBack);
}

void draw() {
  if (currentScreen == 0) {
    background(65, 108, 225);
    fill(0);
    rect(0, 0, SCREENX, BANNERY);
    fill(0);
    rect(30, 20, 70, 70);
    fill(255);
    image(logo, 5, 5);
    textFont(titleFont);
    textSize(HEADING_SIZE);
    text("Hacker News", 300, BANNERY-20);
    fill(255, 102, 153);
    textFont(widgetFont);
    if (homepage) {
      printHomepageStories();
    } else {
      switch(currentQuery) {
      case USER_QUERY:
        printMatchingStories();
        break;
      case STORY_QUERY:
        printMatchingStories();
        break;
      case COMMENT_QUERY:
        break;
      }
    }
    textbox.draw();
    screen1.draw();
  } else if (currentScreen == 1) {
    background(100);
    screenBarGraph.draw();
  }
}

void mousePressed() {
  textbox.clickedOn(mouseX, mouseY);
  int event;
  if (currentScreen == 0) {
    event = screen1.mousePressed();
  } else {
    event = screenBarGraph.mousePressed();
  }
  switch(event) {
  case QUERY_BUTTON: 
    currentScreen = 1;
    break;
  case BACK_BUTTON:
    currentScreen = 0;
    break;
  case TYPE_BUTTON:
    if (!widgetsOut) {
      screen1.addWidget(widgetStory);
      screen1.addWidget(widgetComment);
      widgetsOut = true;
    } else {
      screen1.removeWidget(widgetStory);
      screen1.removeWidget(widgetComment);
      widgetsOut = false;
    }
    break;
  case STORY_BUTTON:
    setQuery(STORY_QUERY);
    screen1.removeWidget(widgetStory);
    screen1.removeWidget(widgetComment);
    break;
  case COMMENT_BUTTON:
    setQuery(COMMENT_QUERY);
    screen1.removeWidget(widgetStory);
    screen1.removeWidget(widgetComment);
    break;
  case AUTHOR_BUTTON:
    setQuery(USER_QUERY);
    break;
  }
}

void keyPressed() {
  if (textbox.keypressed(key, keyCode)) {
    query();
    homepage = false;
  }
}

void setQuery(int current) {
  currentQuery = current;
}

void query() {
  switch (currentQuery) {
  case USER_QUERY:
    String username = textbox.text; //tests: ["pg": first json object author (72, 368)], ["BrandonM": last json object author (2, 62)]
    searchUsername(username);
    listOfResults.add(numberOfMatchingStories);
    listOfResults.add(numberOfMatchingComments);
    println("No. of matching stories: " + numberOfMatchingStories);
    println("No. of matching comments: " + numberOfMatchingComments);
    break;
  case STORY_QUERY:
    String text = textbox.text;
    matchingStories = searchStoryTitles(text);
    println("No. of matching stories: " + matchingStories.size());
    break;
  case COMMENT_QUERY:
    String input = textbox.text;
    matchingComments = searchComments(input);
    println("No. of mathcing comments: " + matchingComments.size());
    break;
  }
}
