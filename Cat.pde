class Cat {
  String name;
  
  float x, y;
  float r;
  float speed;
  float headX;
  float tailX1, tailX2;
  
  int furR, furG, furB;
  int eyeR, eyeG, eyeB;
  int age;
  
  boolean hungry = false;
  boolean sleeping = false;
  boolean playful = false;
  boolean ill = false;
  boolean dead = false;
  
  int hunger;
  int energy;
  int thirdVal;
  int rage;
  
  boolean facingLeft = false;
  boolean still = false;
  
  String[][] catData;
  String[] furColors, eyeColors, posData, stateBools, stateVals, otherData;
  
  Cat(float tempX, float tempY, float tempR, float tempSpeed) {
    x = tempX;
    y = tempY;
    r = tempR;
    speed = tempSpeed;
    headX = x;
    tailX1 = x-100;
    tailX2 = x-125;
  }
  
  String[][] saveCatData() {
    furColors = new String[] {"furColors", String.valueOf(furR), String.valueOf(furG), String.valueOf(furB)};
    eyeColors = new String[] {"eyeColors", String.valueOf(eyeR), String.valueOf(eyeG), String.valueOf(eyeB)};
    posData = new String[] {"posData", String.valueOf(x), String.valueOf(y), String.valueOf(speed),
                            String.valueOf(headX), String.valueOf(tailX1), String.valueOf(tailX2)};
    stateBools = new String[] {"stateBools", String.valueOf(hungry), String.valueOf(sleeping),
                               String.valueOf(playful), String.valueOf(ill), String.valueOf(dead)};
    stateVals = new String[] {"stateVals", String.valueOf(hunger), String.valueOf(energy),
                              String.valueOf(thirdVal), String.valueOf(rage)};
    otherData = new String[] {"otherData", name, String.valueOf(facingLeft), String.valueOf(still)};
    
    return catData = new String[][] {furColors, eyeColors, posData, stateBools, stateVals, otherData};
  }
  
  void loadCatData(String[][] tempCatData) {
    furColors = new String[] {tempCatData[0][1], tempCatData[0][2], tempCatData[0][3]};
    eyeColors = new String[] {tempCatData[1][1], tempCatData[1][2], tempCatData[1][3]};
    posData = new String[] {tempCatData[2][1], tempCatData[2][2], tempCatData[2][3], 
                            tempCatData[2][4], tempCatData[2][5], tempCatData[2][6]};
    stateBools = new String[] {tempCatData[3][1], tempCatData[3][2], tempCatData[3][3], 
                               tempCatData[3][4], tempCatData[3][5]};
    stateVals = new String[] {tempCatData[4][1], tempCatData[4][2], 
                              tempCatData[4][3], tempCatData[4][4]};
    otherData = new String[] {tempCatData[5][1], tempCatData[5][2], tempCatData[5][3]};
  }
  
  void setCatData() {
    furR = Integer.parseInt(furColors[0]);
    furG = Integer.parseInt(furColors[1]);
    furB = Integer.parseInt(furColors[2]);
    eyeR = Integer.parseInt(eyeColors[0]);
    eyeG = Integer.parseInt(eyeColors[1]);
    eyeB = Integer.parseInt(eyeColors[2]);
  }
  
  void display() {
    drawCat();
    
    if (!still) {
      move();
    }
  }
  
  void move() {
    /*textAlign(CENTER);
    textSize(18);
    text(Boolean.toString(facingLeft), 50, 50);*/
    
    turnHead();
    
    x += speed;
    headX += speed;
    tailX1 += speed;
    tailX2 += speed;
    
    if (x <= 150 || x >= 600) {
      speed *= -1;
      facingLeft = !facingLeft;
    }
  }
  
  void turnHead() {
    if (!facingLeft) {
      headX = x;
      tailX1 = x-100;
      tailX2 = x-125;
    } else {
      headX = x-100;
      tailX1 = x;
      tailX2 = x+25;
    }
  }
  
  void feed() {
    hungry = false;
  }
  
  void play() {
    playful = false;
  }
  
  void drawCat() {
    push();
    stroke(furR, furG, furB);
    fill(furR, furG, furB);
    
    // tail
    line(tailX1, y+25, tailX2, y);
    
    // legs
    line(x-90, y+40, x-100, y+60);
    line(x-70, y+45, x-75, y+65);
    line(x-30, y+45, x-30, y+65);
    line(x-10, y+40, x, y+60);
    
    // body
    stroke(0);
    ellipse(x-50, y+25, r*2, r);
    
    // ear 1
    triangle(headX, y, headX-r/2, y, headX-r/2, y-r+5);
    // ear 2
    triangle(headX, y, headX-r/2*-1, y, headX-r/2*-1, y-r+5);
    
    // head
    ellipse(headX, y, r, r);
    
    // eyes
    stroke(0);
    fill(eyeR, eyeG, eyeB);
    ellipse(headX-10, y-5, 7, 6);
    ellipse(headX+10, y-5, 7, 6);
    
    // mouth
    line(headX, y, headX, y+6);
    line(headX, y+6, headX-3, y+8);
    line(headX, y+6, headX+3, y+8);
    
    // nose
    stroke(255, 182, 193);
    fill(255, 182, 193);
    triangle(headX-2, y, headX+2, y, headX, y+3);
    
    pop();
  }
  
}
