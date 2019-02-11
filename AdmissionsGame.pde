 
 // Sports, STEAM section, cafe M, science, match the marlborough slang to the meaning
 // MARLBORO SLANG --> The ARC is the CEI, the cafe for Cafe M, the DUE DATE? more like the DO DATE

/* @pjs preload="data/CenterScreen.png"; */
/* @pjs preload="data/Marlborough.jpg"; */


PFont benton;

int gameState = 0;
int screenState = 0;
Player player;
Door englishDoor;
Door historyDoor;
Door scienceDoor;
Door ceiDoor;
Door caswellDoor;

Door galleryDoor;
Door galleryExit;

Escape escButton;

PImage lunch;
PImage marlboro;

PImage buildingOne;
PImage buildingTwo;
PImage buildingThree;

int midlineOffset = 200;


void setup() {
  benton = createFont("Benton Sans Bold.otf", 20);
  textFont(benton);
  soundSetup();
  
  // put all of the sound stuff in a single tab with functions that play certain sounds and one setup function
  
  fullScreen();
  //size(1200, 800);
  background(150);
  lunch = loadImage("sandsLunch.jpeg");
  lunch.resize(width,height);
  marlboro = loadImage("Marlborough.jpg");
  marlboro.resize(width,height);

  buildingOne = loadImage("LeftScreen.png");
  buildingOne.resize(width,height);
  buildingTwo = loadImage("CenterScreen.png"); 
  buildingTwo.resize(width,height);
  buildingThree = loadImage("RightScreen.png");
  buildingThree.resize(width,height);
 
  PVector startPos = new PVector(width/2,height/2+230);
  player = new Player(startPos); //100 so 50
  historyDoor = new Door((width/2)-50, "Press Q to enter the history class");
  englishDoor = new Door((width/2)-475, "Press Q to enter the english class");
  caswellDoor = new Door((width/2)+360, "Press Q to enter caswell");
  galleryDoor = new Door(800, "Press Q to enter the gallery");
  galleryExit = new Door(500, "Press Q to exit the gallery");
  scienceDoor = new Door(width-390, "Press Q to enter the science class");
  ceiDoor = new Door(200, "Press Q to enter the CEI");
  
  escButton = new Escape("Click to return to campus!");
  
  setupScience();
  ceisetup();
  dancesetup();
  setupGallery();
}

void draw() {
  rectMode(CORNER);
  textAlign(LEFT, TOP);
  imageMode(CORNER);
  //println(gameState);
    if (gameState == 0) 
      mainMenu();
    else if (gameState == 10)
      playSectionII();
    else if (gameState == 20)
      playHistory();
    else if (gameState == 30)
      playSectionIII();
    else if (gameState == 40)
      playSectionI();
    else if (gameState == 50)
      playEnglish(); 
    else if (gameState == 60)
      playGallery();
    else if (gameState == 70)
      drawScience();
    else if (gameState == 80)
      ceidraw();
    else if (gameState == 90)
      dancedraw();
} 

void mousePressed() {
  if (gameState == 0)
    gameState = 10;
}

void keyPressed() {
  if (gameState > 0 && gameState != 70) {
    if (keyCode == RIGHT)
      player.changeVelocity(1);
    else if (keyCode == LEFT)
      player.changeVelocity(-1);
    else if (englishDoor.playerOn == true && keyCode == 'Q') {
       gameState = 50;
     } 
    else if (historyDoor.playerOn == true && keyCode == 'Q') {
       gameState = 20;
       player.position.x = width/2;
    }
    else if (galleryDoor.playerOn == true && keyCode == 'Q') {
      gameState = 60;
      player.position.x = 500;
    }
    else if (ceiDoor.playerOn == true && keyCode == 'Q') {
       gameState = 80;
     } 
    else if (galleryExit.playerOn == true && keyCode == 'Q') {
      println("You have exited the gallery");
      gameState = 10;
      player.position.x = 50;
    }
    else if (scienceDoor.playerOn == true && keyCode == 'Q') { // mamaaaaaaa, uuuuwuuu
      gameState = 70;
    }
    else if (caswellDoor.playerOn == true && keyCode == 'Q')
    {
      gameState=90;
      dance=0;
      danceGameState=0;
    }
  }

  if (gameState==80)
    ceikeyPressed();
  if (gameState==90)
    dancekeyPressed();
}

void keyReleased() {
   if (gameState > 0 && gameState != 70)
     player.changeVelocity(0);
     
   if (gameState == 70) {
      scienceKeys();
   }
   if (gameState == 80)
     ceikeyReleased();
   if (gameState==90)
     dancekeyReleased();
}

void mouseClicked() {
  if (gameState == 70) {
    scienceClicking();
  }
  if (escButton.mouseOn == true && escButton.isDisplayed == true) {
    gameState = 10;
  }
}
