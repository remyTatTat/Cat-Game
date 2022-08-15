class State {
  
  boolean inState;
  int x, y;
  
  State() {};
  
  boolean updateStatus() {
    return inState;
  };
  void tick() {};
  void showStatus() {};
}
