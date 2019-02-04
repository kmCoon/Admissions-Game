PImage normaldance;
PImage rightdance;
PImage leftdance;
PImage downdance;
PImage updance;

int dance=0;
int danceGameState=0;


void dancesetup()
{
  normaldance = loadImage("defaultdance.png");
  rightdance = loadImage("rightdance.png");
  leftdance = loadImage("leftdance.png");
  updance = loadImage("updance.png");
  downdance = loadImage("downdance.png");
  normaldance.resize(0, height);
  rightdance.resize(0, height);
  leftdance.resize(0, height);
  updance.resize(0, height);
  downdance.resize(0, height);
  
}

void dancedraw()
{
  imageMode(CENTER);
  if (danceGameState==0) {danceStart();}
  if (danceGameState==1) {danceGame();}
  if (danceGameState==2) {danceEnd();}
  
}

void danceStart()
{
  
}

void danceEnd()
{
  
}

void danceGame()
{
  background(255);
  if (dance==0){dance(normaldance);}
  else if (dance==1){dance(rightdance);}
  else if (dance==2){dance(leftdance);}
  else if (dance==3){dance(updance);}
  else if (dance==4){dance(downdance);}
}

void dancekeyPressed()
{
  if (danceGameState==0){danceGameState=1;}
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
