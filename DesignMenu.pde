class DesignMenu {
  
  // String debugText = "broth";
  
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
    stroke(255);
    noFill();
    
    moveFurMeters();
    moveEyeMeters();
    
    textAlign(CENTER);
    textSize(16);
    /*text(debugText, 50, 50);
    text(furR, 50, 75);*/
    
    // fur spectrum
    text("Fur Color", 245, 205);
    push();
    fill(furR, furG, furB);
    ellipse(300, 200, 25, 25);
    pop();
    
    // user bar
    push();
    fill(255);
    rectMode(CENTER);
    rect(barX1, barY1, 5, 15);
    rect(barX2, barY2, 5, 15);
    rect(barX3, barY3, 5, 15);
    pop();
    
    // meters
    line(340, 175, 595, 175);
    line(340, 200, 595, 200);
    line(340, 225, 595, 225);
    
    //
    text("Eye Color", 245, 305);
    push();
    fill(eyeR, eyeG, eyeB);
    ellipse(300, 300, 25, 25);
    pop();
    
    // user bar
    push();
    fill(255);
    rectMode(CENTER);
    rect(barX4, barY4, 5, 15);
    rect(barX5, barY5, 5, 15);
    rect(barX6, barY6, 5, 15);
    pop();
    
    // meters
    line(340, 275, 595, 275);
    line(340, 300, 595, 300);
    line(340, 325, 595, 325);
  }
  
  void moveFurMeters() {
    if (mousePressed == true &&
        mouseX >= barX1 - 5 && mouseX <= barX1 + 5 &&
        mouseY >= barY1 - 15 && mouseY <= barY1 + 15) {
      // red bar
      barX1 = constrain(mouseX, 340, 595);
      furR = Math.round(constrain(mouseX-340, 0, 255));
    }
    
    // blue bar
    if (mousePressed == true &&
        mouseX >= barX2 - 5 && mouseX <= barX2 + 5 &&
        mouseY >= barY2 - 15 && mouseY <= barY2 + 15) {
      barX2 = Math.round(constrain(mouseX, 340, 595));
      furG = Math.round(constrain(mouseX-340, 0, 255));
    }
    
    // green bar
    if (mousePressed == true &&
        mouseX >= barX3 - 5 && mouseX <= barX3 + 5 &&
        mouseY >= barY3 - 15 && mouseY <= barY3 + 15) {
      barX3 = constrain(mouseX, 340, 595);
      furB = Math.round(constrain(mouseX-340, 0, 255));
    }
  }
  
  void moveEyeMeters() {
    if (mousePressed == true &&
        mouseX >= barX4 - 5 && mouseX <= barX4 + 5 &&
        mouseY >= barY4 - 15 && mouseY <= barY4 + 15) {
      // red bar
      barX4 = constrain(mouseX, 340, 595);
      eyeR = Math.round(constrain(mouseX-340, 0, 255));
    }
    
    // blue bar
    if (mousePressed == true &&
        mouseX >= barX5 - 5 && mouseX <= barX5 + 5 &&
        mouseY >= barY5 - 15 && mouseY <= barY5 + 15) {
      barX5 = constrain(mouseX, 340, 595);
      eyeG = Math.round(constrain(mouseX-340, 0, 255));
    }
    
    // green bar
    if (mousePressed == true &&
        mouseX >= barX6 - 5 && mouseX <= barX6 + 5 &&
        mouseY >= barY6 - 15 && mouseY <= barY6 + 15) {
      barX6 = constrain(mouseX, 340, 595);
      eyeB = Math.round(constrain(mouseX-340, 0, 255));
    }
  }
  
  int[] getFurColors() {
    if (furR == 0) furR = 255;
    if (furG == 0) furG = 255;
    if (furB == 0) furB = 255;
    return new int[] {furR, furG, furB};
  }
  
  int[] getEyeColors() {
    if (eyeR == 0) eyeR = 255;
    if (eyeG == 0) eyeG = 255;
    if (eyeB == 0) eyeB = 255;
    return new int[] {eyeR, eyeG, eyeB};
  }
  
}
