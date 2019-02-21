PImage normaldance;
PImage rightdance;
PImage leftdance;
PImage downdance;
PImage updance;
PImage dancestudio;

int dance=0;
int danceGameState=0;
int timer=0;
float starttimer=0;
int dancemoves=0;


void dancesetup()
{
  normaldance = loadImage("default dance.png");
  rightdance = loadImage("right dance.png");
  leftdance = loadImage("left dance.png");
  updance = loadImage("up dance.png");
  downdance = loadImage("down dance.png");
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
        + "You have 10 seconds. Press space to begin.", width/2, height/2, 600, 400);
}

void danceEnd()
{
  fill(0, 80);
  noStroke();
  rect(width/2, height/2, 800, 500);
  fill(255);
  textSize(30);
  text("Great job! You did " + dancemoves + " dance moves in 10 seconds."
        + "To play again, press space. To exit this game, press E.", width/2, height/2, 600, 400);
}

void danceGame()
{
  if (dance==0){showDance(normaldance);}
  else if (dance==1){showDance(rightdance);}
  else if (dance==2){showDance(leftdance);}
  else if (dance==3){showDance(updance);}
  else if (dance==4){showDance(downdance);}
  timer = (int)(millis()-starttimer)/1000;
  if (timer>=10) {danceGameState=2;}
  textAlign(LEFT);
  text("Time Left: " + (10-timer), 10, 30);
  textAlign(RIGHT);
  text("Dance Moves: " + dancemoves, width-10, 30);
}

void dancekeyPressed()
{
  if (danceGameState==0 && key==' ')
  {
    danceGameState=1;
    starttimer=millis();
    dancemoves=0;
  }
  if (danceGameState==1)
  {
    if (keyCode == RIGHT) {dance=1;}
    if (keyCode == LEFT) {dance=2;}
    if (keyCode == UP) {dance=3;}
    if (keyCode == DOWN) {dance=4;}
  }
  if (danceGameState==2)
  {
    if (key == ' ') {danceGameState=0;}
    if (key == 'e') {gameState=10;}
  }
}

void dancekeyReleased()
{
  dance=0;
  if (danceGameState==1 && (keyCode==RIGHT || keyCode==LEFT || keyCode==UP || keyCode==DOWN))
    {dancemoves++;}
}


void showDance(PImage img)
{
  image(img, width/2, height/2);
}
