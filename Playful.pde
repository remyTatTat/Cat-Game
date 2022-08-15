class Playful extends State {
  
  boolean inState;
  
  Playful() {
    inState = true;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(int affection, int energy, boolean hungry) {
    if (affection >= 40 && energy >= 60 && !hungry)
      inState = true;
    else
      inState = false;
  }
  
  void showStatus(String catName) {
    if (inState) {
      fill(200, 200, 0);
      text(catName + " is playful!", 100, 175);
    }
    else {
      fill(0, 200, 200);
      text(catName + " is calm.", 100, 175);
    }
  }
  
}
