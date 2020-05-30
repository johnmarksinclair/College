class Screen {   //Screen class by Paul L
                 // BarGraph methods added by Dom M
  ArrayList widgetList;
  ArrayList barGraphList;

  Screen() {
    widgetList = new ArrayList();
    barGraphList = new ArrayList();
  }

  void addWidget(Widget widget) {
    widgetList.add(widget);
  }

  void removeWidget(Widget widget) {
    widgetList.remove(widget);
  }

  void addBarGraph(BarGraph graph) {
    barGraphList.add(graph);
  }

  void removeBarGraph(BarGraph graph) {
    barGraphList.remove(graph);
  }

  void draw() {
    for (int i = 0; i<widgetList.size(); i++) { 
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.draw();
    }
    for (int i = 0; i < barGraphList.size(); i++) {
      BarGraph aBarGraph = (BarGraph) barGraphList.get(i);
      aBarGraph.draw();
    }
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
}
