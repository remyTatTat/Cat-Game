 class Button {
  
  boolean selected = false;
  float x, y;
  int textSize;
  String name;
<<<<<<< HEAD
=======
  PFont cour;
>>>>>>> 9c2b66cbaa4099496c32d4323c0178aa893d8ccb
  
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
    
<<<<<<< HEAD
=======
    push();
>>>>>>> 9c2b66cbaa4099496c32d4323c0178aa893d8ccb
    stroke(255);
    if (selected) {
      fill(255);
    } else {
      noFill();
    }
    ellipse(x-35, y-4, 7.5, 7.5);
<<<<<<< HEAD
=======
    pop();
>>>>>>> 9c2b66cbaa4099496c32d4323c0178aa893d8ccb
  }
  
}
