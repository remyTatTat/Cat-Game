class StateMeter {
  
  float c1, c2, c3, c4;
  String stateName;
  
  int stateVal;
  
  float r, g, b;
  
  StateMeter(int tempStateVal, String tempStateName, int tempR, int tempG, int tempB, float tempC1, float tempC2, float tempC3, float tempC4) {
    stateVal = tempStateVal;
    stateName = tempStateName;
    c1 = tempC1;
    c2 = tempC2;
    c3 = tempC3;
    c4 = tempC4;
    r = tempR; g = tempG; b = tempB;
  }
  
  void display() {
    fill(255);
    textAlign(CENTER);
    text(stateName, c1-35, c2+9);
    
    rectMode(CORNERS);
    fillMeter();
    displayMeter();
  }
   
  void updateStateVal(int tempStateVal) {
    stateVal = tempStateVal;
  }
  
  void displayMeter() {
    stroke(255);
    noFill();
    rect(c1, c2, c3+100, c4);
  }
  
  void fillMeter() {
    noStroke();
    fill(r, g, b);
    rect(c1, c2, c3+stateVal, c4);
  }
  
}
