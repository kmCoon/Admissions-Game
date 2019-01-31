//game state is 30 for this minigame

int ceigameState;

ArrayList<Food> foods;
Backpack backpack;
PImage cei;

int ceisec;
float ceistart;
float ceiendtime;

void ceisetup()
{
  fullScreen();
  background(255);
  foods = new ArrayList<Food>();
  ibackpack = loadImage("backpack.png");
  ibackpack.resize(0, 200);
  backpackfront = loadImage("backpackfront.png");
  backpackfront.resize(0, 200);
  backpack = new Backpack();
  cei = loadImage("CEI.JPG");
  cei.resize(width, 0);
  ceigameState=0;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  initializefood();
  
  
}


void drawceiGame()
{
  
  image(cei, 0, -(cei.height-height));
  backpack.display();
  for (Food a : foods)
  {
    a.display();
    backpack.collision(a);
  }
  backpack.front();
  
  ceisec = (int)(millis()-ceistart)/1000;
  fill(0);
  textSize(30);
  text("Points: " + backpack.getPoints(), 100, 50);
  text("Time: " + ceisec, width-200, 50);
  if (ceisec >30)
  {
    ceigameState=2;
    ceiendtime=millis();
  }
}

void drawceiStart()
{
  image(cei, 0, height-cei.height);
  fill(0, 80);
  noStroke();
  rect(width/2, height/2, 820, 580);
  fill(255);
  textSize(45);
  text("Catch as many snacks and drinks as you can " +
       "in the next thirty seconds to see how many points you can earn! " + 
       "Use the arrow keys to move your backpack back and forth. " + 
       "Press any key to start.", width/2, height/2, 800, 600);
}

void drawceiEnd()
{
  image(cei, 0, -(cei.height-height));
  fill(0, 80);
  noStroke();
  rect(width/2, height/2, 820, 580);
  fill(255);
  textSize(45);
  text("Time's up. You earned " + backpack.getPoints() + " points. Good job!"
        , width/2, height/2, 800, 600);
  if (millis()>ceiendtime+5000)
  {
    gameState=30;
    isCEI = false;
  }
}

void ceidraw()
{
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  if (ceigameState==0) {drawceiStart();}
  if (ceigameState==1) {drawceiGame();}
  if (ceigameState==2) {drawceiEnd();}
 
}

void ceikeyPressed()
{
  if (ceigameState==0 && isCEI)
  {
    ceigameState=1;
    ceistart=millis();
  }
  else if (keyCode == RIGHT && ceigameState==1){backpack.moveR();}
  else if (keyCode == LEFT && ceigameState==1){backpack.moveL();}
}

void ceikeyReleased()
{
  if (keyCode==RIGHT || keyCode==LEFT){backpack.stopMove();}
}
