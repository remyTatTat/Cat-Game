class FileTab {
  
  float x, y;
  float w = 200, h = 200;
  
  String tabText;
  
  boolean clicked = false;
  boolean empty = true;
  
  Cat cat;
  
  FileTab(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void display() {
    if (checkIfClicked()) {
      empty = false;
      clicked = true;
    }
    
    if (empty) {
      emptyTab();
    } else {
      usedTab();
    }
  }
  
  void emptyTab() {
    push();
    fill(0);
    rectMode(CENTER);
    rect(x, y, w, h);
    
    fill(255);
    textAlign(CENTER);
    textSize(16);
    text(tabText, x, y);
    pop();
  }
  
  void usedTab() {
    push();
    fill(0);
    rectMode(CENTER);
    rect(x, y, w, h);
    pop();
    // cat.x = x; cat.y = y;
    // cat.display();
  }
  
  void setCat(Cat tempCat) {
    cat = tempCat;
    cat.x = x;
    cat.y = y;
  }
  
  boolean checkIfClicked() {
    if (mousePressed == true && empty
    && mouseX >= (x - w/2) && mouseX <= (x + w/2)
    && mouseY >= (y - h/2) && mouseY <= (y + h/2)) {
      empty = false;
      return true;
    } return false;
  }
  
  boolean setEmpty(boolean tempEmpty) {
    empty = tempEmpty;
    return empty;
  }
  
}
