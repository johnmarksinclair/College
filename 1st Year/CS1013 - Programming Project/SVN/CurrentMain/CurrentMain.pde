import java.util.*;
ArrayList<Story> storyList;
ArrayList<Comment> commentList;
ArrayList<Story> matchingStories = new ArrayList<Story>();
ArrayList<Comment> matchingComments = new ArrayList<Comment>();
ArrayList<Story> popularStories;
ArrayList<Story> latestStories;
BarGraph currentGraph;
int numberOfMatchingStories, numberOfMatchingComments;
String text, msg, username;
PImage logo;
PFont stdFont, widgetFont, titleFont;
int currentScreen = 0;
Textbox textbox;
Screen mainScreen, userScreen, screenBarGraph, storyScreen;
int currentQuery;
boolean widgetClicked = false;
boolean searchWidgetsOut = false;
boolean sortWidgetsOut = false;
boolean homepage = true;
boolean recent = true;
boolean popular = false;
boolean oldest = false;
color widgetColor = color(255);
color selectedColor = color(180);
VScrollbar vs2;
String searchBy = "SEARCH BY";

PImage left, right;         // Two image to load
int leftWidth, rightWidth;  // The width of the left and right images

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  loadStrings();
  fill(0);
  textbox = new Textbox(SCREENX-SEARCHBARX, MAIN_BANNER_Y-SEARCHBARY+SUB_HEADING_SIZE+9, SEARCHBARX, SEARCHBARY);
  latestStories = new ArrayList<Story>(storyList);
  Collections.reverse(latestStories); // reversing storyList (which starts from old getting newer)
  popularStories = new ArrayList<Story>(storyList);
  bubbleSort(popularStories);
  logo = loadImage("logo1.jpg");
  //screens by Paul L
  mainScreen = new Screen();
  userScreen = new Screen();
  storyScreen = new Screen();
  screenBarGraph = new Screen();
  //fonts by Paul L
  widgetFont = loadFont("HiraginoSans-W4-16.vlw"); 
  titleFont = loadFont("HelveticaNeue-Bold-50.vlw");
  //widgets by Paul L
  widgetHomepage = new Widget(250, 0, 360, MAIN_BANNER_Y, "", color(0), selectedColor, widgetFont, HOME_BUTTON);
  widgetStats = new Widget(0, MAIN_BANNER_Y, WIDGETX, WIDGETY, "STATS", widgetColor, selectedColor, widgetFont, QUERY_BUTTON);
  widgetSearchBy = new Widget(SCREENX - SEARCHBARX - WIDGETX, MAIN_BANNER_Y - WIDGETY+SUB_HEADING_SIZE+9, WIDGETX, WIDGETY, searchBy, widgetColor, selectedColor, widgetFont, SEARCH_BY_BUTTON);
  widgetStory = new Widget(SCREENX - SEARCHBARX - WIDGETX, MAIN_BANNER_Y +SUB_HEADING_SIZE+9, WIDGETX, WIDGETY, "STORY", widgetColor, selectedColor, widgetFont, STORY_BUTTON);
  widgetComment = new Widget(SCREENX - SEARCHBARX - WIDGETX, MAIN_BANNER_Y + 1*WIDGETY+SUB_HEADING_SIZE+9, WIDGETX, WIDGETY, "COMMENT", widgetColor, selectedColor, widgetFont, COMMENT_BUTTON);
  widgetAuthor = new Widget(SCREENX - SEARCHBARX - WIDGETX, MAIN_BANNER_Y + 2*WIDGETY+SUB_HEADING_SIZE+9, WIDGETX, WIDGETY, "AUTHOR", widgetColor, selectedColor, widgetFont, AUTHOR_BUTTON);
  widgetSortBy = new Widget(WIDGETX, MAIN_BANNER_Y, WIDGETX, WIDGETY, "SORT BY", widgetColor, selectedColor, widgetFont, SORT_BY_BUTTON);
  widgetLatest = new Widget(WIDGETX*2, MAIN_BANNER_Y, WIDGETX, WIDGETY, "LATEST", widgetColor, selectedColor, widgetFont, LATEST_BUTTON);
  widgetOldest = new Widget(WIDGETX*3, MAIN_BANNER_Y, WIDGETX, WIDGETY, "OLDEST", widgetColor, selectedColor, widgetFont, OLDEST_BUTTON);
  widgetMostPopular = new Widget(WIDGETX*4, MAIN_BANNER_Y, WIDGETX, WIDGETY, "POPULAR", widgetColor, selectedColor, widgetFont, MOST_POPULAR_BUTTON);
  widgetBack = new Widget(20, 500, 100, 40, "Back", widgetColor, selectedColor, widgetFont, BACK_BUTTON);
  //adding widgets to screen
  mainScreen.addWidget(widgetStats);
  mainScreen.addWidget(widgetSearchBy);
  mainScreen.addWidget(widgetSortBy);
  mainScreen.addWidget(widgetHomepage);
  screenBarGraph.addWidget(widgetBack);
  noStroke();
  vs2 = new VScrollbar(width-10, 0, 20, height, 3*5+1);
}

void draw() {
  if (currentScreen == 0) {
    background(255);
    fill(0);
    rect(WIDGETX*2, MAIN_BANNER_Y, 1000, WIDGETY);
    rect(0, 0, SCREENX, MAIN_BANNER_Y);
    stroke(125);
    line(0, MAIN_BANNER_Y + SUB_BANNER_Y, SCREENX, MAIN_BANNER_Y + SUB_BANNER_Y);
    image(logo, 6, 6);
    widgetSearchBy = new Widget(SCREENX - SEARCHBARX - WIDGETX, MAIN_BANNER_Y - WIDGETY+SUB_HEADING_SIZE+9, WIDGETX, WIDGETY, searchBy, widgetColor, selectedColor, widgetFont, SEARCH_BY_BUTTON);
    mainScreen.addWidget(widgetSearchBy);
    textFont(widgetFont);
    if (homepage) {
      printHomepageStories();
    } else {
      switch(currentQuery) {
      case USER_QUERY:
        printMatchingStories();
        //printMatchingComments();
        break;
      case STORY_QUERY:
        printMatchingStories();
        break;
      case COMMENT_QUERY:
        printMatchingComments();
        break;
      case TIME_QUERY:
        break;
      }
    }
    textbox.draw();
    mainScreen.draw();
    textFont(titleFont);
    textSize(HEADING_SIZE);
    fill(255);
    text("Hacker News", 300, MAIN_BANNER_Y-20);
    fill(255);
  } else if (currentScreen == 1) {
    background(100);
    screenBarGraph.draw();
  }
  // Get the position of the right scrollbar
  // and convert to a value to display the right image
  float rightPos = vs2.getPos()-width/2;
  fill(255);
  //image(right, leftWidth, height/2-rightWidth/2 + rightPos*2);
  vs2.update();
  vs2.display();
}

void mouseMoved() {
}

void mouseWheel(MouseEvent event) { // written by John
  float e = event.getCount();
  if (e == -1) {
    vs2.newspos = vs2.spos - 35;
  } else  if (e == 1) {
    vs2.newspos = vs2.spos + 35;
  }
}

void mousePressed() {
  textbox.clickedOn(mouseX, mouseY);
  int event;
  if (currentScreen == 0) {
    event = mainScreen.mousePressed();
  } else {
    event = screenBarGraph.mousePressed();
  }
  if (event != SEARCH_BY_BUTTON) {
    mainScreen.removeWidget(widgetStory);
    mainScreen.removeWidget(widgetComment);
    mainScreen.removeWidget(widgetAuthor);
    searchWidgetsOut = false;
  }
  if (event != SORT_BY_BUTTON) {
    mainScreen.removeWidget(widgetMostPopular);
    mainScreen.removeWidget(widgetLatest);
    mainScreen.removeWidget(widgetOldest);
    sortWidgetsOut = false;
  }
  switch(event) {
  case QUERY_BUTTON: 
    currentScreen = 1;
    break;
  case BACK_BUTTON:
    background(100);
    currentScreen = 0;
    break;
  case SEARCH_BY_BUTTON:
    if (!searchWidgetsOut) {
      mainScreen.addWidget(widgetStory);
      mainScreen.addWidget(widgetComment);
      mainScreen.addWidget(widgetAuthor);
      searchWidgetsOut = true;
    } else {
      mainScreen.removeWidget(widgetStory);
      mainScreen.removeWidget(widgetComment);
      mainScreen.removeWidget(widgetAuthor);
      searchWidgetsOut = false;
    }
    break;
  case STORY_BUTTON:
    setQuery(STORY_QUERY);
    mainScreen.removeWidget(widgetStory);
    mainScreen.removeWidget(widgetComment);
    mainScreen.removeWidget(widgetAuthor);
    searchBy = "STORY";
    searchWidgetsOut = false;
    break;
  case COMMENT_BUTTON:
    removeLinks();
    setQuery(COMMENT_QUERY);
    mainScreen.removeWidget(widgetStory);
    mainScreen.removeWidget(widgetComment);
    mainScreen.removeWidget(widgetAuthor);
    searchBy = "COMMENT";
    searchWidgetsOut = false;
    break;
  case AUTHOR_BUTTON:
    setQuery(USER_QUERY);
    mainScreen.removeWidget(widgetAuthor);
    screenBarGraph.removeBarGraph(currentGraph);
    searchBy = "AUTHOR";
    break;
  case SORT_BY_BUTTON:
    removeLinks();
    if (!sortWidgetsOut) {
      mainScreen.addWidget(widgetMostPopular);
      mainScreen.addWidget(widgetLatest);
      mainScreen.addWidget(widgetOldest);
      sortWidgetsOut = true;
    } else {
      mainScreen.removeWidget(widgetMostPopular);
      mainScreen.removeWidget(widgetLatest);
      mainScreen.removeWidget(widgetOldest);
      sortWidgetsOut = false;
    }
    break;
  case MOST_POPULAR_BUTTON:
    removeLinks();
    recent = false;
    popular = true;
    oldest = false;
    mainScreen.removeWidget(widgetMostPopular);
    mainScreen.removeWidget(widgetLatest);
    mainScreen.removeWidget(widgetOldest);
    sortWidgetsOut = false;
    break;
  case LATEST_BUTTON:
    removeLinks();
    recent = true;
    popular = false;
    oldest = false;
    mainScreen.removeWidget(widgetMostPopular);
    mainScreen.removeWidget(widgetLatest);
    mainScreen.removeWidget(widgetOldest);
    sortWidgetsOut = false;
    break;
  case OLDEST_BUTTON:
    removeLinks();
    recent = false;
    popular = false;
    oldest = true;
    mainScreen.removeWidget(widgetMostPopular);
    mainScreen.removeWidget(widgetLatest);
    mainScreen.removeWidget(widgetOldest);
    sortWidgetsOut = false;
    break;
  case HOME_BUTTON:
    removeLinks();
    homepage = true;
    break;
  case URL_LINK:
    float xPos = mouseX;
    float yPos = mouseY;
    String url = getUrl(xPos, yPos);
    println(url);
    link(url);
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

void query() { // written by John
  switch (currentQuery) {
  case USER_QUERY:
    ArrayList<Integer> listOfResults = new ArrayList<Integer>();
    String username = textbox.text;
    searchUsername(username);
    listOfResults.add(numberOfMatchingStories);
    listOfResults.add(numberOfMatchingComments);
    ArrayList<Story> listOfStories = searchUserStory(username);
    bubbleSort(listOfStories);
    String stories = "Stories";
    String comments = "Comments";
    BarGraph barGraph1 = new BarGraph(listOfResults, listOfStories, username, stories, comments);
    screenBarGraph.addBarGraph(barGraph1);
    currentGraph = barGraph1;
    break;
  case STORY_QUERY:
    ArrayList<Integer> listOfMatchingStories = new ArrayList<Integer>();
    String text = textbox.text;
    matchingStories = searchStoryTitles(text);
    listOfMatchingStories.add(matchingStories.size());
    BarGraph barGraph2 = new BarGraph(listOfMatchingStories);
    screenBarGraph.addBarGraph(barGraph2);
    currentGraph = barGraph2;
    break;
  case COMMENT_QUERY:
    ArrayList<Integer> listOfMatchingComments = new ArrayList<Integer>();
    String input = textbox.text;
    matchingComments = searchComments(input);
    listOfMatchingComments.add(matchingComments.size());
    BarGraph barGraph3 = new BarGraph(listOfMatchingComments);
    screenBarGraph.addBarGraph(barGraph3);
    currentGraph = barGraph3;
    break;
  case TIME_QUERY:
    String time = textbox.text;
    searchByTime(time);
    break;
  }
}