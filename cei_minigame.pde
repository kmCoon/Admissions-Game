//game state is 30 for this minigame

/* @pjs preload="data/CEI.JPG"; */
/* @pjs preload="data/backpack.png"; */
/* @pjs preload="data/backpackfront.png"; */

int ceigameState;

ArrayList<Food> foods;
Backpack backpack;
PImage cei;

int ceisec;
float ceistart;
float ceiendtime;

void ceisetup()
{
  //fullScreen();
  background(255);
  foods = new ArrayList<Food>();
  ibackpack = loadImage("data/backpack.png");
  ibackpack.resize(0, 200);
  backpackfront = loadImage("data/backpackfront.png");
  backpackfront.resize(0, 200);
  backpack = new Backpack();
  cei = loadImage("data/CEI.JPG");
  cei.resize(width, height);
  ceigameState=0;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  initializefood();
  
  
}


void drawceiGame()
{
  
  image(cei, 0, 0);
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
       "Press space to start.", width/2, height/2, 800, 600);
}

void drawceiEnd()
{
  image(cei, 0, -(cei.height-height));
  fill(0, 80);
  noStroke();
  rect(width/2, height/2, 820, 580);
  fill(255);
  textSize(45);
  text("Time's up. You earned " + backpack.getPoints() + " points. Good job! Press space to play again, or press E to leave."
        , width/2, height/2, 800, 600);
  
}

void ceidraw()
{
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  if (ceigameState==0) {drawceiStart();}
  if (ceigameState==1) {drawceiGame();}
  if (ceigameState==2) {drawceiEnd();}
  escButton.display();
 
}

void ceikeyPressed()
{
  if (ceigameState==0 && gameState==80 && key==' ')
  {
    ceigameState=1;
    ceistart=millis();
    backpack.resetbackpack();
    for (Food a : foods) {a.reset();}
  }
  if (ceigameState==2 && gameState==80 && key==' ')
  {
    ceigameState=0;
  }
  if (ceigameState==2 && gameState==80 && key=='e')
  {
    gameState=30;
    ceigameState=0;
  }
  else if (keyCode == RIGHT && ceigameState==1){backpack.moveR();}
  else if (keyCode == LEFT && ceigameState==1){backpack.moveL();}
}

void ceikeyReleased()
{
  if (keyCode==RIGHT || keyCode==LEFT){backpack.stopMove();}
}
