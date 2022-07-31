class RainDrop {
  
  float x, y;
  float r;
  float top;
  float speed = 1.0175;
  float cutOff;
  boolean visible = true;
  
  RainDrop(float tempX, float tempY, float tempR, float tempCutOff, float tempTop) {
    x = tempX;
    y = tempY;
    r = tempR;
    cutOff = tempCutOff;
    top = tempTop;
  }
  
  void display() {
    checkIfVisible();
    push();
    if (visible) {
      stroke(100, 149, 237);
      line(x, y, x, y+r);
    }
    pop();
  }
  
  void fall() {
    y *= speed;
    
    if (y >= cutOff + r) {
      y = top - r;
    }
  }
  
  void checkIfVisible() {
    if (y <= top) {
      visible = false;
    } else {
      visible = true;
    }
  }
  
}
