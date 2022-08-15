import processing.sound.*;
import java.io.*;
import java.util.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;

Cat cat1, cat2, cat3, catCurr;

FileTab tab1, tab2, tab3, tabCurr;
String currentTab;
String fileName;
String[][] catData;

boolean onMainMenu = true, onDesignMenu = false, gameStarted = false, onCatCheck = false;
boolean cat1Exists = false, cat2Exists = false, cat3Exists = false;

SoundFile theme;
Random rand;

DesignMenu designMenu;
Window window;

RainDrop[] rainDrops = new RainDrop[50];
int[] furColors, eyeColors;

int timeHunger, timeEnergy, timeRage;
int buttonSelected = 1, counter = 0;
Button button1, button2, button3, button4;

StateMeter meterHunger, meterEnergy, meterAffection;

DateTimeFormatter dtf;
LocalDateTime now;
Clock clock;

/******************************************************************************/

void setup() {
  size(900, 500);
  //theme = new SoundFile(this, "music/newHorizons3AM.mp3");
  //theme.loop();
  
  dtf = DateTimeFormatter.ofPattern("HH:mm:ss   MM/dd/YY");
  clock = new Clock(dtf, now);
  rand = new Random();
  
  loadAssets();
  
  for (int i = 0; i < rainDrops.length; i++) {
    rainDrops[i] = new RainDrop(random(window.x-window.w/2, window.x+window.w/2), random((window.y - window.h/2) - 200, window.y - window.h/2), 3, (window.y + window.h/2-5), window.y-window.h/2+2);
  }
}

void draw() {
  background(0);
  stroke(255);
  
  if (onMainMenu || onDesignMenu) {
    textAlign(CENTER);
    textSize(24);
    fill(255);
    text("Cat Game", width/2, height/4);
  }
  
  if (onMainMenu) {
    
    tabFunctions("tab1", tab1, cat1);
    tabFunctions("tab2", tab2, cat2);
    tabFunctions("tab3", tab3, cat3);
    
  } else if (onDesignMenu) {
    
    designMenu.display();
    furColors = designMenu.getFurColors();
    eyeColors = designMenu.getEyeColors();
    catCurr.furR = furColors[0]; catCurr.furG = furColors[1]; catCurr.furB = furColors[2];
    catCurr.eyeR = eyeColors[0]; catCurr.eyeG = eyeColors[1]; catCurr.eyeB = eyeColors[2];
    catCurr.name = designMenu.name;
    saveStrings("save_files/" + currentTab + "/name.txt", new String[] {catCurr.name});
    
  } else if (gameStarted) {
    frameRate(60);
    while (counter == 0) {
      catCurr.x = 300;
      catCurr.y = 375;
      counter++;
    }
    
    for (String[] arr : catCurr.saveCatData()) {
      saveStrings("save_files/" + currentTab + "/" + arr[0] + ".txt", arr);
    }
    
    updateButtons();
    displayAssets();
  }
}

/********KEYS********/
/********KEYS********/
/********KEYS********/

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
  
  if (gameStarted && keyCode == ENTER) {
    switch (buttonSelected) {
      case 1:
        catCurr.feed();
        break;
      case 2:
        catCurr.play();
        break;
      case 3:
        catCurr.ill = false;
        if (catCurr.energy <= 100)
          catCurr.energy += 15;
        if (catCurr.affection <= 100)
          catCurr.affection += 10;
        break;
      case 4:
        catCurr.Dead.inState = true;
        break;
    }
  }
  
  if (onDesignMenu && keyCode == ENTER) {
    onDesignMenu = false;
    gameStarted = true;
    fileName = "save_files/" + currentTab + "/used.txt";
    saveStrings(fileName, new String[] {"true"});
  }
}

/********FUNCTIONS********/
/********FUNCTIONS********/
/********FUNCTIONS********/

void loadCat(String tabName, FileTab tabTemp, Cat catTemp) {
  if (Boolean.valueOf(loadStrings("save_files/" + tabName + "/used.txt")[0])) {
      catData = new String[][] {loadStrings("save_files/" + tabName + "/furColors.txt"),
                                loadStrings("save_files/" + tabName + "/eyeColors.txt"),
                                loadStrings("save_files/" + tabName + "/posData.txt"),
                                loadStrings("save_files/" + tabName + "/stateBools.txt"),
                                loadStrings("save_files/" + tabName + "/stateVals.txt"),
                                loadStrings("save_files/" + tabName + "/otherData.txt")};
      // System.out.println(catData[0][1]);
      catTemp.loadCatData(catData);
      catTemp.setCatData();
      catTemp.exists = true;
      tabTemp.cat = catTemp;
      tabTemp.setCat();
  }
}

void tabFunctions(String tabName, FileTab tabTemp, Cat catTemp) {
  tabTemp.tabText = loadStrings("save_files/" + tabName + "/tabText.txt")[0];
  tabTemp.display();
  
  if (tabTemp.deleteButtonClicked()) {
    saveStrings("save_files/" + tabName + "/used.txt", new String[] {"false"});
    saveStrings("save_files/" + tabName + "/tabText.txt", new String[] {"Create Cat"});
    catTemp.exists = false;
  }
  
  if (catTemp.exists) {
    tabTemp.cat.displayEntireHead();
    tabTemp.deleteButton();
  } else {
    saveStrings("save_files/" + tabName + "/used.txt", new String[] {"false"});
    saveStrings("save_files/" + tabName + "/tabText.txt", new String[] {"Create Cat"});
  }
  
  if (tabTemp.clicked && !tabTemp.deleteButtonClicked() && !tabTemp.checkIfButtonHovered()) {
    saveStrings("save_files/" + tabName + "/tabText.txt", new String[] {""});
    onMainMenu = false;
    if (catTemp.exists) {
      gameStarted = true;
    } else {
      onDesignMenu = true;
    }
    currentTab = tabName;
    tabCurr = tabTemp;
    catCurr = catTemp;
  }
}

void updateButtons() {
  switch(buttonSelected) {
      case 1:
        setButtonBools(true, false, false, false);
        break;
      case 2:
        setButtonBools(false, true, false, false);
        break;
      case 3:
        setButtonBools(false, false, true, false);
        break;
      case 4:
        setButtonBools(false, false, false, true);
        break;
    }
}

void displayAssets() {
    // menu border
    line(width * .75, 0, width * .75, 500);
    line(width * .75, height/2, width, height/2);
    // floor
    line(0, 400, width * .75, 400);
    
    for (int i = 0; i < rainDrops.length; i++) {
      rainDrops[i].display();
      rainDrops[i].fall();
    }
  
    window.display();
    now = LocalDateTime.now();
    clock.now = now;
    clock.display();
    catCurr.display();
    button1.display(); button2.display(); button3.display(); button4.display();
    meterHunger.display(); meterEnergy.display(); meterAffection.display();
    meterHunger.updateStateVal(catCurr.hunger);
    meterEnergy.updateStateVal(catCurr.energy);
    meterAffection.updateStateVal(catCurr.affection);
}

void setButtonBools(Boolean bool1, Boolean bool2, Boolean bool3, Boolean bool4) {
  button1.selected = bool1;
  button2.selected = bool2;
  button3.selected = bool3;
  button4.selected = bool4;
}

void loadAssets() {
  designMenu = new DesignMenu();
  window = new Window(width * .6, height * .4, 130, 170);
  
  tab1 = new FileTab(150, height/2);
  tab2 = new FileTab(450, height/2);
  tab3 = new FileTab(750, height/2);
  
  cat1 = new Cat(300, 375, 50, 1);
  cat2 = new Cat(300, 375, 50, 1);
  cat3 = new Cat(300, 375, 50, 1);
  
  loadCat("tab1", tab1, cat1);
  loadCat("tab2", tab2, cat2);
  loadCat("tab3", tab3, cat3);
  
  button1 = new Button(900 * .875, height * .11111, 16, "Feed");
  button2 = new Button(900 * .875, height * .22222, 16, "Play");
  button3 = new Button(900 * .875, height * .33333, 16, "Heal");
  button4 = new Button(900 * .875, height * .44444, 16, "Kill");
  meterHunger = new StateMeter(20, "Hunger", 255, 99, 71, width * .75 + 85, height * .55555 + 10, width * .75 + 85, height * .55555 + 20);
  meterEnergy = new StateMeter(40, "Energy", 72, 209, 204, width * .75 + 85, height * .66666 + 10, width * .75 + 85, height * .66666 + 20);
  meterAffection = new StateMeter(50, "Affection", 219, 112, 147, width * .75 + 85, height * .77777 + 10, width * .75 + 85, height * .77777 + 20);
}
