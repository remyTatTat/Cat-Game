class Hungry extends State {
  
  boolean inState;
  
  Hungry() {
    inState = false;
    x = 100; y = 100;
  }
  
  boolean updateStatus() {
    return inState;
  }
  
  void tick(int hunger) {
    if (hunger > 50)
      inState = true;
    else
      inState = false;
  }
  
  void showStatus(String catName, int hunger) {
    if (hunger <= 50) {
      fill (100, 200, 0);
      text(catName + " has no appetite.", x, y);
    }
    else if (hunger >= 51 && hunger <= 99) {
      fill(200, 200, 0);
      text(catName + " is very hungry!!", x, y);
    }
    else if (hunger == 100) {
      fill (200, 0, 0);
      text(catName + " is starving!!!", x, y);
    }
  }
  
}
