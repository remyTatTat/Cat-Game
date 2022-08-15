class Sleeping extends State {
  
  int timeRemaining = 10;
  boolean inState;
  
  Sleeping () {
    inState = false;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(boolean hungry, int energy) {
    if (!hungry && energy <= 30)
      inState = true; System.out.println(hungry + " " + energy);
    if (inState && frameRate % 60 == 0) {
      timeRemaining--; System.out.println(hungry + " " + energy);
    }
    else {
      timeRemaining = 10;
      inState = false;
      System.out.println(hungry + " " + energy);
    }
  }
  
  void showStatus(String catName) {
    if (inState) {
      fill(100, 0, 200);
      text(catName + " is sleeping...", 100, 150);
    }
    else {
      fill(200, 0, 100);
      text(catName + " is awake.", 100, 150);
    }
  }
  
}
