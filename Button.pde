 class Button {
  
  boolean selected = false;
  float x, y;
  int textSize;
  String name;
  
  Button (float tempX, float tempY, int tempTextSize, String tempName) {
    x = tempX;
    y = tempY;
    textSize = tempTextSize;
    name = tempName;
  }
  
  void display() {
    fill(255);
    textAlign(CENTER);
    textSize(textSize);
    text(name, x, y);
    
    stroke(255);
    if (selected) {
      fill(255);
    } else {
      noFill();
    }
    ellipse(x-35, y-4, 7.5, 7.5);
  }
  
}
