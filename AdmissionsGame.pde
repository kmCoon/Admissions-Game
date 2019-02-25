 
 // Sports, STEAM section, cafe M, science, match the marlborough slang to the meaning
 // MARLBORO SLANG --> The ARC is the CEI, the cafe for Cafe M, the DUE DATE? more like the DO DATE

/* @pjs preload="data/LeftScreen.png"; */
/* @pjs preload="data/CenterScreen.png"; */
/* @pjs preload="data/RightScreen.png"; */
/* @pjs preload="data/Marlborough.jpg"; */
/* @pjs preload="data/sandsLunch.jpeg"; */
/* @pjs preload="data/default dance.png"; */


// x and door width


PFont benton;

int gameState = 0;
int screenState = 0;
Player player;
Door englishDoor;
Door roboDoor; 
Door scienceDoor;
Door ceiDoor;
Door caswellDoor;

Door galleryDoor;
Door galleryExit;

Door trackDoor;

Escape escButton;

PImage lunch;
PImage marlboro;

PImage buildingOne;
PImage buildingTwo;
PImage buildingThree;

int midlineOffset = 200;
float scaleMult = .79;

float xScaleMult = .069;
float yScaleMult = .22;

float gateScale = .959;

float englishScale = .171; 
float caswellScale = .76; 
float sparcScale = .46;
float gallMult = .555;
float sciMult = .675;
float ceiMult = .167;

void resizeImages()
{
  lunch.resize(width,height);
  marlboro.resize(width,height);
  buildingOne.resize(width,height);
  buildingTwo.resize(width,height);
  buildingThree.resize(width,height);
  sally.resize(200, 300);
}


void setup() {
  benton = createFont("Benton Sans Bold.otf", 20);
  textFont(benton);
  soundSetup();
  
  //fullScreen();
  size(1200, 800);
  background(150);

  lunch = loadImage("data/sandsLunch.jpeg");
  marlboro = loadImage("data/Marlborough.jpg");
  buildingOne = loadImage("data/LeftScreen.png");
  buildingTwo = loadImage("data/CenterScreen.png"); 
  buildingThree = loadImage("data/RightScreen.png");
  
  sally = loadImage("data/default dance.png");
 
  PVector startPos = new PVector(width/2,((height*scaleMult)-25)); //900
  player = new Player(startPos); //100 so 50
  
  
  roboDoor = new Door((width/2)-50, "Press space to enter the SPARC");
  englishDoor = new Door((width*englishScale), "Press space to enter the english class"); 
  caswellDoor = new Door((width*caswellScale), "Press space to enter caswell"); 
  galleryDoor = new Door((width*gallMult), "Press space to enter the gallery");
  galleryExit = new Door(500, "Press space to exit the gallery");
  scienceDoor = new Door((width*sciMult), "Press space to enter the science class");
  ceiDoor = new Door((width*ceiMult), "Press space to enter the CEI");
  trackDoor = new Door(100, "Press space to begin track practice");
  
  escButton = new Escape("Click to return to campus!");
  
  setupScience();
  ceisetup();
  dancesetup();
  setupGallery();
  englishsetup();
  trackSetup();
  robotsetup();

  resizeImages();
}

void draw() {
  if (sally.width != 200)
    resizeImages();
  
  rectMode(CORNER);
  textAlign(LEFT, TOP);
  imageMode(CORNER);
  //println(gameState);
    if (gameState == 0) 
      mainMenu();
    else if (gameState == 10)
      playSectionII();
    else if (gameState == 20)
      robotdraw();
    else if (gameState == 30)
      playSectionIII();
    else if (gameState == 40)
      playSectionI();
    else if (gameState == 50)
      englishdraw(); 
    else if (gameState == 60)
      playGallery();
    else if (gameState == 70)
      drawScience();
    else if (gameState == 80)
      ceidraw();
    else if (gameState == 90)
      dancedraw();
    else if (gameState == 100) 
      trackDraw();
} 


void keyPressed() {

  if (gameState==0 && key==' ')
  {
    gameState=10;
  }
  
  if (gameState==50){
    englishkeyPressed(); } 
  
  else if (gameState==20){
    robotkeyPressed();}
    
  else if (gameState==90){
    dancekeyPressed();}
    
  else if (gameState==80){
    ceikeyPressed();}
    
  
    
  else if (gameState > 0 && gameState != 70 && gameState != 100) {
    if (keyCode == RIGHT)
    {
      player.changeVelocity(1);
      player.applyAcc(1);
    }
    else if (keyCode == LEFT) {
      player.applyAcc(-1);
      player.changeVelocity(-1);
    }
    else if (englishDoor.playerOn() == true && keyCode == ' ' && gameState==10) {
        englishgameState=0;
        gameState = 50; 
        println("going to english");
    }
    else if (roboDoor.playerOn() == true && keyCode == ' ' && gameState==10) {
       gameState = 20;
       robotstate=0;
    }
    else if (galleryDoor.playerOn() == true && keyCode == ' ' && gameState==30) {
      gameState = 60;
      player.position.x = 500;
    }
    else if (ceiDoor.playerOn() == true && keyCode == ' ' && gameState==30) {
       gameState = 80;
       println("entering cei");
     } 
    else if (scienceDoor.playerOn() == true && keyCode == ' ' && gameState==40) { // mamaaaaaaa, uuuuwuuu
      gameState = 70;
    }
    else if (caswellDoor.playerOn() == true && keyCode == ' ' && gameState==10)
    {
      gameState=90;
      dance=0;
      danceGameState=0;
    }
    else if (trackDoor.playerOn() == true && keyCode == ' ' && gameState==40) {
      player.position.x = 300; 
      gameState = 100;
      trackState = 0;
      trackScore=0;
      trackClock=0;
    } 
  }
  
  
    
  
  
  

}

void keyReleased() {
   if (gameState > 0 && gameState != 70) {
     player.changeVelocity(0);
     player.applyAcc(0);      
   }
     
   if (gameState == 70) {
      scienceKeys();
   }
   if (gameState == 100)
     trackKeys();
   if (gameState == 80)
     ceikeyReleased();
   if (gameState==90)
     dancekeyReleased();
   if (gameState==100){
     trackKeys();}
   if (gameState==20){
     robotkeyReleased();} 
}

void mouseClicked() 
{
  if (escButton.mouseOn == true && escButton.isDisplayed == true && (gameState==50 || gameState==90 || gameState==20)) {
    gameState = 10;
  }
  if (escButton.mouseOn == true && escButton.isDisplayed == true && (gameState==60 || gameState==80)){
    gameState=30;
  }
  if (escButton.mouseOn == true && escButton.isDisplayed == true && (gameState==70 || gameState==100)){
    gameState=40;
  }
  if (gameState==0)
  {
    gameState=10;
  }
  else if (gameState == 70) 
  {
    scienceClicking();
  }
  else if (gameState == 50) 
  { 
    englishmouseClicked();
  }
}
