class Cat {
  
  float x, y;
  float r;
  float speed;
  float headX;
  float tailX1, tailX2;
  
  String name;
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
  
  
  boolean facingLeft = false;
  
  Cat(float tempX, float tempY, float tempR, float tempSpeed) {
    x = tempX;
    y = tempY;
    r = tempR;
    speed = tempSpeed;
    headX = x;
    tailX1 = x-100;
    tailX2 = x-125;
  }
  
  void display() {
    stroke(255);
    noFill();
    
    // tail
    push();
    stroke(furR, furG, furB);
    fill(0);
    line(tailX1, y+25, tailX2, y);
    
    // legs
    line(x-90, y+40, x-100, y+60);
    line(x-70, y+45, x-75, y+65);
    line(x-30, y+45, x-30, y+65);
    line(x-10, y+40, x, y+60);
    
    // body
    ellipse(x-50, y+25, r*2, r);
    
    // ear 1
    triangle(headX, y, headX-r/2, y, headX-r/2, y-r+5);
    // ear 2
    triangle(headX, y, headX-r/2*-1, y, headX-r/2*-1, y-r+5);
    
    // head
    ellipse(headX, y, r, r);
    pop();
    
    // eyes
    push();
    stroke(eyeR, eyeG, eyeB);
    fill(eyeR, eyeG, eyeB);
    ellipse(headX-10, y-5, 5, 5);
    ellipse(headX+10, y-5, 5, 5);
    pop();
    
    // mouth
    line(headX, y, headX, y+6);
    line(headX, y+6, headX-3, y+8);
    line(headX, y+6, headX+3, y+8);
    
    // nose
    push();
    stroke(255, 182, 193);
    fill(255, 182, 193);
    triangle(headX-2, y, headX+2, y, headX, y+3);
    pop();
    
    move();
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
  
}
