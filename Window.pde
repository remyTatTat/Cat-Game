class Window {
  
  float x, y;
  float w, h;
  
  Window(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }
  
  void display() {
    // build window
<<<<<<< HEAD
    noFill();
=======
>>>>>>> 9c2b66cbaa4099496c32d4323c0178aa893d8ccb
    rectMode(CENTER);
    rect(x, y, w, h);
    
    line(x, y-h/2, x, y+h/2);
    line(x-w/2, y, x+w/2, y);
  }
  
}
