class Dead extends State {
  
  boolean inState;
  
  Dead () {
    inState = false;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(boolean hungry, boolean ill, int energy, int hunger, int affection) {
    if (hungry && ill && energy < 10 && hunger > 90 && affection < 10)
      inState = true;
    else
      inState = false;
  }
  
  void showStatus(String catName) {
    if (inState) {
      textAlign(LEFT);
      fill(255, 0, 0);
      text(catName + " has died and you are at fault.", 100, height/2);
    }
  }
  
}
