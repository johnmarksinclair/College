// written by John
void bubbleSort(ArrayList<Story> list) {
  for (int index = 0; index < list.size(); index++) {
    for (int i = 0; i < list.size()-1; i++) {
      if (list.get(i).score < list.get(i+1).score) {
        swapPos(i, i+1, list);
      }
    }
  }
}

// written by John
void swapPos(int x, int y, ArrayList<Story> list) {
  Story temp = list.get(x);
  list.set(x, list.get(y));
  list.set(y, temp);
}

// written by John
String formatUnixTime(int time) { //1160418111 - 9/10/2006 18:21
  long timestamp = time;
  Date date = new Date(timestamp*1000);
  return date.toString();
}
