class Cat {
  String name;
  
  Hungry Hungry;
  Ill Ill;
  Sleeping Sleeping;
  Playful Playful;
  Digesting Digesting;
  Dead Dead;
  
  int blackStroke = 0;
  int flip = -1;
  
  float x, y;
  float r;
  float speed;
  float headX;
  float tailX1, tailX2;
  
  int furR, furG, furB;
  int eyeR, eyeG, eyeB;
  int age;
  
  boolean fed = false;
  boolean played = false;
  boolean hungry, ill, sleeping, playful, digesting, dead;
  boolean exists = false;
  
  
  int hunger = 0, energy = 20, affection = 70;
  
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
    
    Hungry = new Hungry();
    Digesting = new Digesting();
    Ill = new Ill();
    Playful = new Playful();
    Sleeping = new Sleeping();
    Dead = new Dead();
  }
  
  void display() {
    if (hunger <= 0)
      hunger = 0;
    else if (hunger >= 100)
      hunger = 100;
    
    if (energy <= 0)
      energy = 0;
    else if (energy >= 100)
      energy = 100;
    if (affection <= 0)
      affection = 0;
    else if (affection >= 100)
      affection = 100;
    
    if (furR == 0 && furG == 0 && furB == 0) {
      blackStroke = 255;
    }
    drawCat();
    move();
    if (!dead) {
      if (!still) {
        move();
      }
      
      if (!sleeping) {
        tickHunger();
        tickAffection();
      }
      tickEnergy();
      
      updateStates();
      Hungry.tick(hunger);
      Hungry.showStatus(name, hunger);
      Ill.tick(Hungry.inState, energy);
      Ill.showStatus(name);
      Sleeping.tick(hungry, energy);
      Sleeping.showStatus(name);
      Playful.tick(affection, energy, hungry);
      Playful.showStatus(name);
      Digesting.tick(fed, hunger);
      Digesting.showStatus(name);
      Dead.tick(hungry, ill, energy, hunger, affection);
      Dead.showStatus(name);
    } else {
      eyeR = 0; eyeG = 0; eyeB = 0;
      Dead.showStatus(name);
      speed *= .99;
    }
  }
  
  void updateStates() {
    hungry = Hungry.updateStatus();
    ill = Ill.updateStatus();
    sleeping = Sleeping.updateStatus();
    playful = Playful.updateStatus();
    digesting = Digesting.updateStatus();
    dead = Dead.updateStatus();
  }
  
  void tickHunger() {
    if (!digesting && frameCount % 15 == 0 && hunger < 100)
      hunger++;
    if (digesting && frameCount % 15 == 0 && hunger >= 25)
      hunger--;
      if (hunger == 25)
        fed = false;
  }
  
  void tickEnergy() {
    if (sleeping && energy <= 100 && frameCount % 15 == 0 && hunger < 100)
      energy++;
    else if (!sleeping && energy >= 0 && frameCount % 15 == 0 && hunger < 100)
      energy--;
  }
  
  void tickAffection() {
    System.out.println("hmm");
    if (!hungry && frameCount % 15 == 0 && affection <= 100)
      affection += 2;
    if (ill && frameCount % 15 == 0 && affection >= 0)
      affection--;
    if (playful && frameCount % 15 == 0 && affection <= 100)
      affection++;
    if (hungry && frameCount % 15 == 0 && affection >= 0)
      affection--;
  }
  
  String[][] saveCatData() {
    furColors = new String[] {"furColors", String.valueOf(furR), String.valueOf(furG), String.valueOf(furB)};
    eyeColors = new String[] {"eyeColors", String.valueOf(eyeR), String.valueOf(eyeG), String.valueOf(eyeB)};
    posData = new String[] {"posData", String.valueOf(x), String.valueOf(y), String.valueOf(speed),
                            String.valueOf(headX), String.valueOf(tailX1), String.valueOf(tailX2)};
    stateBools = new String[] {"stateBools", String.valueOf(hungry), String.valueOf(sleeping),
                               String.valueOf(playful), String.valueOf(ill), String.valueOf(dead)};
    stateVals = new String[] {"stateVals", String.valueOf(hunger), String.valueOf(energy),
                              String.valueOf(affection)};
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
                              tempCatData[4][3]};
    otherData = new String[] {tempCatData[5][1], tempCatData[5][2], tempCatData[5][3]};
  }
  
  void setCatData() {
    furR = Integer.parseInt(furColors[0]);
    furG = Integer.parseInt(furColors[1]);
    furB = Integer.parseInt(furColors[2]);
    eyeR = Integer.parseInt(eyeColors[0]);
    eyeG = Integer.parseInt(eyeColors[1]);
    eyeB = Integer.parseInt(eyeColors[2]);
    name = otherData[0];
    hunger = Integer.parseInt(stateVals[0]);
    energy = Integer.parseInt(stateVals[1]);
    affection = Integer.parseInt(stateVals[2]);
  }
  
  void move() {
    turnHead();
    
    x += speed;
    headX += speed;
    tailX1 += speed;
    tailX2 += speed;
    
    if (x <= 150 || x >= 600) {
      speed *= flip;
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
    fed = true;
  }
  
  boolean play() {
    energy -= 10;
    if (energy <= 0) energy = 0;
    constrain(energy, 0, 100);
    return true;
  }
  
  void drawCat() {
    push();
    strokeWeight(2);
    displayTail();
    displayLegs();
    displayBody();
    displayEars();
    displayHead();
    displayEyes();
    displayMouth();
    displayNose();
    pop();
  }
  
  void displayEntireHead() {
    push();
    strokeWeight(2);
    if (furR == 0 && furG == 0 && furB == 0) {
      blackStroke = 255;
    }
    
    displayEars();
    displayHead();
    displayEyes();
    displayMouth();
    displayNose();
    turnHead();
    
    if (!still) {
      move();
    }
    pop();
  }
  
  void displayTail() {
    fill(255);
    line(tailX1, y+25, tailX2, y);
  }
  
  void displayLegs() {
    fill(255);
    line(x-90, y+40, x-100, y+60);
    line(x-70, y+45, x-75, y+65);
    line(x-30, y+45, x-30, y+65);
    line(x-10, y+40, x, y+60);
  }
  
  void displayBody() {
    stroke(blackStroke);
    fill(furR, furG, furB);
    ellipse(x-50, y+25, r*2, r);
  }
  
  void displayEars() {
    stroke(blackStroke);
    fill(furR, furG, furB);
    // ear 1
    triangle(headX, y, headX-r/2, y, headX-r/2, y-r+5);
    // ear 2
    triangle(headX, y, headX-r/2*-1, y, headX-r/2*-1, y-r+5);
  }
  
  void displayHead() {
    stroke(blackStroke);
    fill(furR, furG, furB);
    ellipse(headX, y, r, r);
  }
  
  void displayEyes() {
    stroke(blackStroke);
    fill(eyeR, eyeG, eyeB);
    ellipse(headX-10, y-5, 7, 6);
    ellipse(headX+10, y-5, 7, 6);
  }
  
  void displayMouth() {
    fill(blackStroke);
    line(headX, y, headX, y+6);
    line(headX, y+6, headX-3, y+8);
    line(headX, y+6, headX+3, y+8);
  }
  
  void displayNose() {
    stroke(255, 182, 193);
    fill(255, 182, 193);
    triangle(headX-2, y, headX+2, y, headX, y+3);
  }
  
}
