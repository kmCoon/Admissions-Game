 
 // Sports, STEAM section, cafe M, science, match the marlborough slang to the meaning
 // MARLBORO SLANG --> The ARC is the CEI, the cafe for Cafe M, the DUE DATE? more like the DO DATE

/* @pjs preload="data/LeftScreen.png"; */
/* @pjs preload="data/CenterScreen.png"; */
/* @pjs preload="data/RightScreen.png"; */
/* @pjs preload="data/Marlborough.jpg"; */
/* @pjs preload="data/sandsLunch.jpeg"; */
/* @pjs preload="data/default dance.png"; */


// x and door width


PVector doorZero;
PVector doorOne;
PVector doorTwo;
PVector doorThree;

PFont benton;

int gameState = 0;
int screenState = 0;
Player player;
Door englishDoor;
Door roboDoor; 
Door scienceDoor;
Door ceiDoor;
Door caswellDoor;

int doorPos = 0;

Escape escButton;

PImage lunch;
PImage marlboro;

PImage centerBuilding;

int midlineOffset = 200;
float scaleMult = .79;

float xScaleMult = .069;
float yScaleMult = .22;

float gateScale = .959;

float englishScale = .171; 
float caswellScale = .76; 
float sparcScale = .46;
float gallMult = .555;
float sciMult = .583;
float ceiMult = .76; // used to be .167
float sparcMult = .354;

void resizeImages() {
  lunch.resize(width,height);
  marlboro.resize(width,height);
  centerBuilding.resize(width,height);
  sally.resize(200, 300);
}


void setup() {
   
  benton = createFont("Benton Sans Bold.otf", 20);
  textFont(benton);
  soundSetup();
  
  //fullScreen();
  size(800, 600);
  background(150);

  lunch = loadImage("data/sandsLunch.jpeg");
  marlboro = loadImage("data/Marlborough.jpg");
  centerBuilding = loadImage("data/CenterScreen.png"); 
  
  sally = loadImage("data/default dance.png");
 
  PVector startPos = new PVector(width/2,((height*scaleMult)-25)); //900
  player = new Player(startPos); //100 so 50
  
  roboDoor = new Door((width*sparcMult), "SPARC"); //width/2-175
  englishDoor = new Door((width*englishScale), "English"); 
  caswellDoor = new Door((width*caswellScale), "Caswell"); 
  scienceDoor = new Door((width*sciMult), "Science"); //width/2+100
  ceiDoor = new Door((width*ceiMult), "CEI");
  
  doorZero = new PVector((width*englishScale)+25,(height*scaleMult));
  doorOne = new PVector((width*sparcMult)+25,(height*scaleMult));
  doorTwo = new PVector((width*sciMult)+25,(height*scaleMult));
  doorThree = new PVector((width*ceiMult)+25,(height*scaleMult));
  
  escButton = new Escape("Click to return to campus!");
  
  setupScience();
  ceisetup();
  dancesetup();
  englishsetup(); 
  robotsetup();
  setupConfetti();

  resizeImages();
}

void draw() {
  
  if (sally.width != 200)
    resizeImages();
  
  rectMode(CORNER);
  textAlign(LEFT, TOP);
  imageMode(CORNER);
    if (gameState == 0) 
      mainMenu();
    else if (gameState == 10)
      playSectionII();
    else if (gameState == 20)
      robotdraw();
    else if (gameState == 50)
      englishdraw(); 
    else if (gameState == 70)
      drawScience();
    else if (gameState == 80)
      ceidraw();
    else if (gameState == 90)
      dancedraw();
} 


void keyPressed() {

  if (gameState==0 && key==' ') {
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
    if (keyCode == RIGHT) {
      player.changeVelocity(1);
      player.applyAcc(1);
    }
    else if (keyCode == LEFT) {
      player.applyAcc(-1);
      player.changeVelocity(-1);
    }
    else if (englishDoor.playerOn() == true && key == ' ' && gameState==10) {
        englishgameState=0;
        shuffle(books);
        shuffle(authors);
        currentBook=0;
        gameState = 50; 
    }
    else if (roboDoor.playerOn() == true && key == ' ' && gameState==10) {
       gameState = 20;
       robotstate=0;
    }

    else if (ceiDoor.playerOn() == true && key == ' ' && gameState==10) {
       gameState = 80;
     } 
     
    else if (/*scienceDoor.playerOn() == true &&*/ key == ' ' && gameState==10) { // mamaaaaaaa, uuuuwuuu
      gameState = 70;
    }
    /*else if (caswellDoor.playerOn() == true && keyCode == ' ' && gameState==10)
    {
      gameState=90;
      dance=0;
      danceGameState=0;
    } */
  }
  
}

void keyReleased() {
   if (gameState == 10) {
     if (keyCode == LEFT && doorPos > 0) {
       doorPos -= 1;
     } 
     if (keyCode == RIGHT && doorPos < 3) {
       doorPos += 1;
     }  
   }
     
   if (gameState == 70) {
      scienceKeys();
   }
   if (gameState == 80)
     ceikeyReleased();
   /*if (gameState==90)
     dancekeyReleased(); */
   if (gameState==20){
     robotkeyReleased();} 
}


void mousePressed() 
{
  if (escButton.mouseOn() && escButton.isActive()) {
    gameState = 10;
  }
  else if (gameState==0) {
    gameState=10;
  }
  else if (gameState == 70) {
    scienceClicking();
  }
  else if (gameState == 50) {
    englishmouseClicked();
  }
  else {
    translateMouseClickToKeyPress();
    keyPressed();
  }
}


void mouseReleased()
{
    translateMouseClickToKeyPress();
    keyReleased();
}

void translateMouseClickToKeyPress()
{
    if (mouseX < .2*width)
    {
        key = CODED;
        keyCode = LEFT;
    }
    else if (mouseX > .8*width)
    {
        key = CODED;
        keyCode = RIGHT;
    }
    else if (mouseY < .2*height)
    {
        key = CODED;
        keyCode = UP;
    }
    else if (mouseY > .8*height)
    {
        key = CODED;
        keyCode = RIGHT;
    }
    else
    {
        key = ' ';
        keyCode = 0;
    }
}
