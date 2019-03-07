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
  rect(width/100 + 5, height/20 - 0.15*blockheight, 1.3*blockwidth, 0.5*blockheight);
  fill(purple);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Start", width/100 + 5, height/20 - 0.15*blockheight, 1.3*blockwidth, 0.5*blockheight); 
  
  robot1.display(); 
  for(Block b : blocks)
  {
    b.display(); 
  }
 
  rectMode(CENTER); 
  rect(winX, winY, 100, 50); 
 
  robot1.winCheck(winX, winY); 
 
  fill(purple);
  text("End", winX, winY);
}
