class StateMeter {
  
  float c1, c2, c3, c4;
  int stateVal = 0;
  String stateName;
  
  int inc = 1;
  
  float r, g, b;
  
  StateMeter(String tempStateName, float tempC1, float tempC2, float tempC3, float tempC4) {
    stateName = tempStateName;
    c1 = tempC1;
    c2 = tempC2;
    c3 = tempC3;
    c4 = tempC4;
    r = 50; g = 100; b = 200;
  }
  
  void display() {
    stateVal += inc;
    
    if (stateVal == 0 || stateVal == 100) {
      inc *= -1;
    }
    
    fill(255);
    textAlign(CENTER);
    text(stateName, c1-35, c2+9);
    
    rectMode(CORNERS);
    fillMeter();
    displayMeter();
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
