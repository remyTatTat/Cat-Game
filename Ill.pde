class Ill extends State {
  
  boolean inState;
  
  Ill () {
    inState = false;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(boolean hungry, int energy) {
    if (hungry && energy <= 30)
      inState = true;
  }
  
  void showStatus(String catName) {
    if (inState) {
      fill(200, 0, 0);
      text(catName + " is ill!", 100, 125);
    }
    else {
      fill(0, 200, 0);
      text(catName + " is healthy.", 100, 125);
    }
  }
  
}
