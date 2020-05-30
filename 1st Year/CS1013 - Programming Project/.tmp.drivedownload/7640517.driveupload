class BarGraph {

  ArrayList <Integer> results = new ArrayList();
  int noOfGraphs;
  int nextX, nextY;
  int tallestGraph = 100;
  int multiplier, big;
  ArrayList widgetList;

  final int FIRSTX = 10, FIRSTY = 45, SPACING = 30;

  BarGraph(ArrayList<Integer> results) {
    this.results = results;
    this.noOfGraphs = results.size();
    widgetList = new ArrayList();
  }

  void addWidget(Widget widget) {
    widgetList.add(widget);
  }

  void draw() {
    int temp = biggestValue();
    if (temp > 0) {
      big = results.get(temp);
      multiplier = (width - 90) / big;
    }
    graph();
    for (int i = 0; i<widgetList.size(); i++)
    { 
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.draw();
    }
  }

  void graph () {
    nextX = FIRSTX;
    nextY = FIRSTY;
    for (int i = 0; i < results.size(); i++) {
      display(results.get(i));
    }
  }


  void display(int currentResult) {
    fill(0);
    text(currentResult, nextX, nextY);
    bar(currentResult);
    nextY += 45;
  }

  // creates bar display
  void bar(int currentResult) {
    int x, y, w, h;
    x = nextX + 60;
    y = nextY - SPACING;
    w = currentResult * multiplier;
    h = SPACING-2;
    fill(255, 0, 0);
    rectMode( CORNER );
    rect( x, y, w, h );
  }

  int mousePressed() {
    int event;
    for (int i = 0; i<widgetList.size(); i++) { 
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL) {
        return event;
      }
    }
    return EVENT_NULL;
  }

  // returns index of largest valye in results ArrayList
  int biggestValue() {
    int temp = 0;
    for (int i = 0; i < results.size(); i ++) {
      if (results.get(i) > results.get(temp)) {
        temp = i;
      }
    }
    return temp;
  }
}
