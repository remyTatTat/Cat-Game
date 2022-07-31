import processing.sound.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
import java.util.Random;

boolean onMainMenu = true;
boolean onDesignMenu = false;
boolean gameStarted = false;

boolean cat1Exists = false;
boolean cat2Exists = false;
boolean cat3Exists = false;

SoundFile theme;
Random rand;

DesignMenu designMenu;
Cat cat;
Window window;
Button button1;

RainDrop[] rainDrops = new RainDrop[50];
int[] furColors;
int[] eyeColors;

Button button2;
Button button3;
Button button4;
int buttonSelected = 1;

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss   MM/dd/YY");    

void setup() {
  size(900, 500);
  // theme = new SoundFile(this, "newHorizons3AM.mp3");
  // theme.loop();
  
  rand = new Random();
  designMenu = new DesignMenu();
  
  cat = new Cat(300, 375, 50, 1);
  window = new Window(width * .6, height * .4, 130, 170);
  
  for (int i = 0; i < rainDrops.length; i++) {
    rainDrops[i] = new RainDrop(random(window.x-window.w/2, window.x+window.w/2), random((window.y - window.h/2) - 200, window.y - window.h/2), 3, (window.y + window.h/2-5), window.y-window.h/2+2);
  }
  
  button1 = new Button(900 * .875, height*.11111, 16, "Feed");
  button2 = new Button(900 * .875, height*.22222, 16, "Play");
  button3 = new Button(900 * .875, height*.33333, 16, "Button");
  button4 = new Button(900 * .875, height*.44444, 16, "Button");
}

void draw() {
  background(0);
  stroke(255);
  
  LocalDateTime now = LocalDateTime.now();
  
  if (onMainMenu || onDesignMenu) {
    push();
    textAlign(CENTER);
    textSize(24);
    text("Cat Game",width/2, height/4);
    pop();
  }
  
  if (onMainMenu) {
    
    push();
    fill(0);
    rectMode(CENTER);
    rect(150, height/2, 200, 200);
    rect(450, height/2, 200, 200);
    rect(750, height/2, 200, 200);
    pop();
    
    push();
    textAlign(CENTER);
    textMode(CENTER);
    textSize(16);
    text("Create New \nCat", 150, height/2);
    text("Create New \nCat", 450, height/2);
    text("Create New \nCat", 750, height/2);
    pop();
    
  } else if (onDesignMenu) {
    
    designMenu.display();
    
  } else if (gameStarted) {
    furColors = designMenu.getFurColors();
    eyeColors = designMenu.getEyeColors();
    cat.furR = furColors[0];
    cat.furG = furColors[1];
    cat.furB = furColors[2];
    cat.eyeR = eyeColors[0];
    cat.eyeG = eyeColors[1];
    cat.eyeB = eyeColors[2];
    
    // menu border
    line(width * .75, 0, width * .75, 500);
    line(width * .75, height/2, width, height/2);
    
    // floor
    line(0, 400, width * .75, 400);
    
    // BUTTONS
    button1.display();
    button2.display();
    button3.display();
    button4.display();
    
    switch(buttonSelected) {
      case 1:
        button1.selected = true;
        button2.selected = false;
        button3.selected = false;
        button4.selected = false;
        break;
      
      case 2:
        button1.selected = false;
        button2.selected = true;
        button3.selected = false;
        button4.selected = false;
        break;
      
      case 3:
        button1.selected = false;
        button2.selected = false;
        button3.selected = true;
        button4.selected = false;
        break;
      
      case 4:
        button1.selected = false;
        button2.selected = false;
        button3.selected = false;
        button4.selected = true;
        break;
    }

    // BUTTONS
    
    // CAT
    cat.display();
    // CAT
    
    // RAIN
    for (int i = 0; i < rainDrops.length; i++) {
      rainDrops[i].display();
      rainDrops[i].fall();
    }
    // RAIN
    
    // WINDOW
    window.display();
    // WINDOW
    
    // CLOCK
    line(0, 40, 150, 40);
    line(150, 0, 150, 40);
    push();
    fill(255);
    textAlign(LEFT);
    textSize(14);
    text(dtf.format(now), 20, 25);
    pop();
    // CLOCK
  }
}

void keyPressed() {
  if (keyCode == UP || key == 'w' || key == 'W') {
    if (buttonSelected == 1) {
      buttonSelected = 4;
    } else {
      buttonSelected--;
    }
  }
  
  if (keyCode == DOWN || key == 's' || key == 'S') {
    if (buttonSelected == 4) {
      buttonSelected = 1;
    } else {
      buttonSelected++;
    }
  }
  
  if (onMainMenu && keyCode == ENTER) {
    onMainMenu = false;
    onDesignMenu = true;
  } else if (onDesignMenu && keyCode == ENTER) {
    onDesignMenu = false;
    gameStarted = true;
  }
}
