 
 // Sports, STEAM section, cafe M, science, match the marlborough slang to the meaning
 // MARLBORO SLANG --> The ARC is the CEI, the cafe for Cafe M, the DUE DATE? more like the DO DATE

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

import ddf.minim.*;
Minim minim;
AudioPlayer bells;

PImage lunch;
PImage marlboro;

PImage buildingOne;
PImage buildingTwo;
PImage buildingThree;

int midlineOffset = 200;

void setup() {
  minim = new Minim(this);
  bells = minim.loadFile("bells.wav");
  
  fullScreen();
  background(150);
  lunch = loadImage("sandsLunch.jpeg");
  lunch.resize(width,height);
  marlboro = loadImage("Marlborough.jpg");
  marlboro.resize(width,height);

  buildingOne = loadImage("LeftBuilding.png");
  buildingOne.resize(width,height);
  buildingTwo = loadImage("CenterBuilding.png");
  buildingTwo.resize(width,height);
  buildingThree = loadImage("RightBuilding.png");
  buildingThree.resize(width,height);
 
  PVector startPos = new PVector(width/2,height/2+160);
  player = new Player(startPos); //100 so 50
  historyDoor = new Door((width/2)-50, "Press Q to enter the history class");
  englishDoor = new Door((width/2)-475, "Press Q to enter the english class");
  caswellDoor = new Door((width/2)+375, "Press Q to enter caswell");
  galleryDoor = new Door(800, "Press Q to enter the gallery");
  galleryExit = new Door(500, "Press Q to exit the gallery");
  scienceDoor = new Door(width-350, "Press Q to enter the science class");
  ceiDoor = new Door(200, "Press Q to enter the CEI");
  
  setupScience();
}

void draw() {
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
    else if (galleryExit.playerOn == true && keyCode == 'Q') {
      println("You have exited the gallery");
      gameState = 10;
      player.position.x = 50;
    }
    else if (scienceDoor.playerOn == true && keyCode == 'Q') {
      gameState = 70;
    }
  }
}

void keyReleased() {
   if (gameState > 0 && gameState != 70)
     player.changeVelocity(0);
     
   if (gameState == 70) {
      scienceKeys();
   }
}

void mouseClicked() {
  if (gameState == 70) {
    scienceClicking();
  }
}
