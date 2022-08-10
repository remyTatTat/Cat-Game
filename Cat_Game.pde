import processing.sound.*;
import java.io.*;
import java.util.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;

Cat cat;

FileTab tab1, tab2, tab3, tabCurr;
String currentTab;
String fileName;

boolean onMainMenu = true, onDesignMenu = false, gameStarted = false, onCatCheck = false;
boolean cat1Exists = false, cat2Exists = false, cat3Exists = false;

SoundFile theme;
Random rand;

DesignMenu designMenu;
Window window;

RainDrop[] rainDrops = new RainDrop[50];
int[] furColors, eyeColors;

int buttonSelected = 1, counter = 0;
Button button1, button2, button3, button4;

StateMeter meter1, meter2, meter3, meter4;

DateTimeFormatter dtf;
LocalDateTime now;
Clock clock;

/******************************************************************************/

void setup() {
  size(900, 500);
  theme = new SoundFile(this, "music/newHorizons3AM.mp3");
  theme.loop();
  
  dtf = DateTimeFormatter.ofPattern("HH:mm:ss   MM/dd/YY");
  clock = new Clock(dtf, now);
  
  rand = new Random();
  window = new Window(width * .6, height * .4, 130, 170);
  for (int i = 0; i < rainDrops.length; i++) {
    rainDrops[i] = new RainDrop(random(window.x-window.w/2, window.x+window.w/2), random((window.y - window.h/2) - 200, window.y - window.h/2), 3, (window.y + window.h/2-5), window.y-window.h/2+2);
  }
  
  designMenu = new DesignMenu();
  tab1 = new FileTab(150, height/2);
  tab2 = new FileTab(450, height/2);
  tab3 = new FileTab(750, height/2);
  
  cat = new Cat(300, 375, 50, 1);
  
  button1 = new Button(900 * .875, height * .11111, 16, "Feed");
  button2 = new Button(900 * .875, height * .22222, 16, "Play");
  button3 = new Button(900 * .875, height * .33333, 16, "Heal");
  button4 = new Button(900 * .875, height * .44444, 16, "Kill");
  meter1 = new StateMeter("Hunger", width * .75 + 85, height * .55555 + 10, width * .75 + 85, height * .55555 + 20);
  meter2 = new StateMeter("Energy", width * .75 + 85, height * .66666 + 10, width * .75 + 85, height * .66666 + 20);
  meter3 = new StateMeter("meter 3", width * .75 + 85, height * .77777 + 10, width * .75 + 85, height * .77777 + 20);
  meter4 = new StateMeter("Rage", width * .75 + 85, height * .88888 + 10, width * .75 + 85, height * .88888 + 20);
}

void draw() {
  background(0);
  stroke(255);
  
  if (onMainMenu || onDesignMenu) {
    push();
    textAlign(CENTER);
    textSize(24);
    text("Cat Game", width/2, height/4);
    pop();
  }
  
  if (onMainMenu) {
    
    tab1.tabText = loadStrings("save_files/tab1/tabText.txt")[0];
    tab1.display();
    tab2.tabText = loadStrings("save_files/tab2/tabText.txt")[0];
    tab2.display();
    tab3.tabText = loadStrings("save_files/tab3/tabText.txt")[0];
    tab3.display();
    
    if (tab1.clicked) {
      onMainMenu = false;
      onCatCheck = true;
      currentTab = "tab1";
      tabCurr = tab1;
    } else if (tab2.clicked) {
      onMainMenu = false;
      onCatCheck = true;
      currentTab = "tab2";
      tabCurr = tab2;
    } else if (tab3.clicked) {
      onMainMenu = false;
      onCatCheck = true;
      currentTab = "tab3";
      tabCurr = tab3;
    }
    
  } else if (onCatCheck) {
    
    fileName = "save_files/" + currentTab + "/used.txt";
    if (Boolean.valueOf(loadStrings(fileName)[0])) {
      String[][] catData = new String[][] {loadStrings("save_files/" + currentTab + "/furColors.txt"),
                                           loadStrings("save_files/" + currentTab + "/eyeColors.txt"),
                                           loadStrings("save_files/" + currentTab + "/posData.txt"),
                                           loadStrings("save_files/" + currentTab + "/stateBools.txt"),
                                           loadStrings("save_files/" + currentTab + "/stateVals.txt"),
                                           loadStrings("save_files/" + currentTab + "/otherData.txt")};
      cat.loadCatData(catData);
      cat.setCatData();
      onCatCheck = false;
      gameStarted = true;
    } else {
      onCatCheck = false;
      onDesignMenu = true;
    }
    
  } else if (onDesignMenu) {
    
    designMenu.display();
    furColors = designMenu.getFurColors();
    eyeColors = designMenu.getEyeColors();
    cat.furR = furColors[0]; cat.furG = furColors[1]; cat.furB = furColors[2];
    cat.eyeR = eyeColors[0]; cat.eyeG = eyeColors[1]; cat.eyeB = eyeColors[2];
    
    fileName = "save_files/" + currentTab + "/used.txt";
    saveStrings(fileName, new String[] {"true"});
    
  } else if (gameStarted) {
    
    // file saving
    for (String[] arr : cat.saveCatData()) {
      saveStrings("save_files/" + currentTab + "/" + arr[0] + ".txt", arr);
    }
    // file saving
    
    // menu border
    line(width * .75, 0, width * .75, 500);
    line(width * .75, height/2, width, height/2);
    // floor
    line(0, 400, width * .75, 400);
    
    // BUTTONS
    button1.display(); button2.display(); button3.display(); button4.display();
    meter1.display(); meter2.display(); meter3.display(); meter4.display();
    
    switch(buttonSelected) {
      case 1:
        button1.selected = true;
        button2.selected = false; button3.selected = false; button4.selected = false;
        break;
      
      case 2:
        button2.selected = true;
        button1.selected = false; button3.selected = false; button4.selected = false;
        break;
      
      case 3:
        button3.selected = true; 
        button1.selected = false; button2.selected = false; button4.selected = false;
        break;
      
      case 4:
        button4.selected = true;
        button1.selected = false; button2.selected = false; button3.selected = false;
        break;
    }
    
    for (int i = 0; i < rainDrops.length; i++) {
      rainDrops[i].display();
      rainDrops[i].fall();
    }
    
    window.display();
    now = LocalDateTime.now();
    clock.now = now;
    clock.display();
    cat.display();
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
  
  if (onDesignMenu && keyCode == ENTER) {
    onDesignMenu = false;
    gameStarted = true;
  }
}
