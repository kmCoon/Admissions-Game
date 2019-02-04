PImage normaldance;
PImage rightdance;
PImage leftdance;
PImage downdance;
PImage updance;
PImage dancestudio;

int dance=0;
int danceGameState=0;


void dancesetup()
{
  normaldance = loadImage("defaultdance.png");
  rightdance = loadImage("rightdance.png");
  leftdance = loadImage("leftdance.png");
  updance = loadImage("updance.png");
  downdance = loadImage("downdance.png");
  dancestudio = loadImage("dancestudio.jpg");
  normaldance.resize(0, height);
  rightdance.resize(0, height);
  leftdance.resize(0, height);
  updance.resize(0, height);
  downdance.resize(0, height);
  dancestudio.resize(width, height);
  
}

void dancedraw()
{
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  image(dancestudio, width/2, height/2, width, height);
  if (danceGameState==0) {danceStart();}
  else if (danceGameState==1) {danceGame();}
  else if (danceGameState==2) {danceEnd();}
  
}

void danceStart()
{
  fill(0, 80);
  noStroke();
  rect(width/2, height/2, 800, 500);
  fill(255);
  textSize(30);
  text("Press the arrow keys to perform different dance moves. "
        + "You have 30 seconds. Press D to begin.", width/2, height/2, 600, 400);
}

void danceEnd()
{
  
}

void danceGame()
{
  if (dance==0){dance(normaldance);}
  else if (dance==1){dance(rightdance);}
  else if (dance==2){dance(leftdance);}
  else if (dance==3){dance(updance);}
  else if (dance==4){dance(downdance);}
}

void dancekeyPressed()
{
  if (danceGameState==0 && key=='d'){danceGameState=1;}
  if (danceGameState==1)
  {
    if (keyCode == RIGHT) {dance=1;}
    if (keyCode == LEFT) {dance=2;}
    if (keyCode == UP) {dance=3;}
    if (keyCode == DOWN) {dance=4;}
  }
}

void dancekeyReleased()
{
  dance=0;
}


void dance(PImage image)
{
  image(image, width/2, height/2);
}
