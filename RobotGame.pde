//
// RobotGame
//


void robotdraw_game()
{
  background(255);
  rectMode(CENTER);

  float startX = width * .07;
  float startY = height * .05;

  fill(yellow); 
  rect(startX, startY, blockwidth, blockheight);

  fill(purple);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Start", startX, startY, blockwidth, blockheight); 
  
  robot1.display(); 
  for(Block b : blocks)
  {
    b.display(); 
  }

  float winX = width * .93;
  float winY = height * .05; 
 
  rectMode(CENTER); 
  rect(winX, winY, blockwidth, blockheight); 
 
  robot1.winCheck(winX, winY); 
 
  fill(purple);
  text("End", winX, winY);
}
