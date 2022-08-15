class Digesting extends State {
  
  boolean inState;
  
  Digesting () {
    inState = false;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(boolean fed, int hunger) {
    if (fed && hunger >= 25)
      inState = true;
    else
      inState = false;
  }
  
  void showStatus (String catName) {
    if (inState) {
      fill(200, 200, 0);
      text(catName + " is digesting...", 100, 200);
    }
    else {
      fill(0, 200, 0);
      text(catName + " is full.", 100, 200);
    }
  }
  
}
