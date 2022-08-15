class DesignMenu {
  
  String name = "";
  
  float barX1 = 340;
  float barY1 = 175;
  
  float barX2 = 340;
  float barY2 = 200;
  
  float barX3 = 340;
  float barY3 = 225;
  
  float barX4 = 340;
  float barY4 = 275;
  
  float barX5 = 340;
  float barY5 = 300;
  
  float barX6 = 340;
  float barY6 = 325;
  
  int furR, furG, furB;
  int eyeR, eyeG, eyeB;
  
  DesignMenu() {};
  
  void display() {
    stroke(255); noFill(); strokeWeight(1);
    
    moveFurMeters();
    moveEyeMeters();
    
    textAlign(CENTER); textSize(16);
    text("Fur Color", 245, 205);
    text("Eye Color", 245, 305);
    
    push();
    fill(furR, furG, furB);
    ellipse(300, 200, 25, 25);
    pop();
    
    push();
    fill(eyeR, eyeG, eyeB);
    ellipse(300, 300, 25, 25);
    pop();
    
    displayMeters(340, 200, 595, 200);
    displayMeters(340, 300, 595, 300);
    displayUserBars();
    nameInput();
    displayNameBox();
    
  }
  
  void displayUserBars() {
    push();
    fill(255);
    rectMode(CENTER);
    rect(barX1, barY1, 5, 15);
    rect(barX2, barY2, 5, 15);
    rect(barX3, barY3, 5, 15);
    
    rect(barX4, barY4, 5, 15);
    rect(barX5, barY5, 5, 15);
    rect(barX6, barY6, 5, 15);
    pop();
  }
  
  void displayMeters(float meterX1, float meterY1, float meterX2, float meterY2) {
    line(meterX1, meterY1 - 25, meterX2, meterY2 - 25);
    line(meterX1, meterY1, meterX2, meterY2);
    line(meterX1, meterY1 + 25, meterX2, meterY2 + 25);
  }
  
  void moveFurMeters() {
    if (mousePressed == true && mouseX >= 340 - 5 && mouseX <= 595 + 5) {
      if (mousePressed == true && mouseY >= barY1 - 7.5 && mouseY <= barY1 + 7.5) {
        // red bar
        barX1 = constrain(mouseX, 340, 595);
        furR = Math.round(constrain(mouseX-340, 0, 255));
      }
    
      // blue bar
      if (mousePressed == true && mouseY >= barY2 - 7.5 && mouseY <= barY2 + 7.5) {
        barX2 = Math.round(constrain(mouseX, 340, 595));
        furG = Math.round(constrain(mouseX-340, 0, 255));
      }
    
      // green bar
      if (mousePressed == true && mouseY >= barY3 - 7.5 && mouseY <= barY3 + 7.5) {
        barX3 = constrain(mouseX, 340, 595);
        furB = Math.round(constrain(mouseX-340, 0, 255));
      }
    }
  }
  
  void moveEyeMeters() {
    if (mousePressed == true && mouseX >= 340 - 5 && mouseX <= 595 + 5) {
      if (mousePressed == true && mouseY >= barY4 - 7.5 && mouseY <= barY4 + 7.5) {
        // red bar
        barX4 = constrain(mouseX, 340, 595);
        eyeR = Math.round(constrain(mouseX-340, 0, 255));
      }
      
      // blue bar
      if (mousePressed == true && mouseY >= barY5 - 7.5 && mouseY <= barY5 + 7.5) {
        barX5 = constrain(mouseX, 340, 595);
        eyeG = Math.round(constrain(mouseX-340, 0, 255));
      }
      
      // green bar
      if (mousePressed == true && mouseY >= barY6 - 7.5 && mouseY <= barY6 + 7.5) {
        barX6 = constrain(mouseX, 340, 595);
        eyeB = Math.round(constrain(mouseX-340, 0, 255));
      }
    }
  }
  
  int[] getFurColors() {
    /*if (furR == 0) furR = 255;
    if (furG == 0) furG = 255;
    if (furB == 0) furB = 255;*/
    return new int[] {furR, furG, furB};
  }
  
  int[] getEyeColors() {
    /*if (eyeR == 0) eyeR = 255;
    if (eyeG == 0) eyeG = 255;
    if (eyeB == 0) eyeB = 255;*/
    return new int[] {eyeR, eyeG, eyeB};
  }
  
  void displayNameBox() {
    textAlign(CENTER);
    text(name, width/2, 405);
    
    if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100
     && mouseY >= 375 && mouseY <= 425) {
      strokeWeight(2.5);
    } else {
      strokeWeight(1);
    }
    stroke(255);
    noFill();
    rectMode(CENTER);
    rect(width/2, 400, 200, 50);
  }
  
  void nameInput() {
    frameRate(15);
    if (keyPressed && Character.isLetter(key)) {
      name += key;
    }
  }
  
}
