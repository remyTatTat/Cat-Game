class FileTab {
  
  float x, y;
  float w = 200, h = 200;
  float weight = 1;
  
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
      // System.out.println("display else");
      usedTab();
    }
  }
  
  void emptyTab() {
    push();
    fill(0);
    strokeWeight(weight);
    rectMode(CENTER);
    rect(x, y, w, h);
    
    fill(255);
    textAlign(CENTER);
    textSize(16);
    text(tabText, x, y);
    pop();
  }
  
  void usedTab() {
    // System.out.println("usedTab");
    push();
    fill(0);
    strokeWeight(weight);
    rectMode(CENTER);
    rect(x, y, w, h);
    pop();
    deleteButton();
  }
  
  void setCat() {
    // System.out.println("pot");
    cat.x = x;
    cat.y = y;
    cat.still = true;
  }
  
  boolean checkIfClicked() {
    if (checkIfTabHovered()) {
      weight = 2.5;
    } else {
      weight = 1;
    }
    
    if (mousePressed == true && empty && checkIfTabHovered()) {
      empty = false;
      return true;
    } return false;
  }
  
  boolean setEmpty(boolean tempEmpty) {
    empty = tempEmpty;
    return empty;
  }
  
  boolean checkIfTabHovered() {
    if (mouseX >= (x - w/2) && mouseX <= (x + w/2)
     && mouseY >= (y - h/2) && mouseY <= (y + h/2)) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean checkIfButtonHovered() {
    if (mouseX >= (x - 50) && mouseX <= (x + 50)
     && mouseY >= (y+125 - 12.5) && mouseY <= (y+125 + 12.5)) {
      return true;
    } else {
      return false;
    }
  }
  
  void deleteButton() {
    if (checkIfButtonHovered())
      fill(178, 34, 34);
    else
      fill(220, 20, 60);
    stroke(255);
    rectMode(CENTER);
    rect(x, y+125, 100, 25);
    
    if (checkIfButtonHovered())
      strokeWeight(2);
    else
      strokeWeight(1);
    fill(255);
    textSize(14);
    textMode(CENTER);
    text("Delete Cat", x, y+130);
  }
  
  boolean deleteButtonClicked() {
    if (checkIfButtonHovered() && mousePressed)
      return true;
    else
      return false;
  }
  
}
