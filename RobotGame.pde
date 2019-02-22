//
// RobotGame
//


float winX;
float winY;


void initialize_game()
{
  winX = width - 100;
  winY = height/100 + 25; 
}
 

void robotdraw_game()
{
  background(255);
  rectMode(CORNER);
  fill(yellow); 
  rect(width/100 + 50, height/20 - 15, 130, 50);
  fill(purple);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Start", width/100 + 50, height/20 - 15, 130, 50); 
  
  robot1.display(); 
  for(Block b : blocks)
  {
    b.display(); 
  }
 
  rectMode(CENTER); 
  rect(winX, winY, 100, 50); 
 
  robot1.winCheck(winX, winY); 
 
  fill(purple);
  text("End", winX, winY, 100, 50);
}
