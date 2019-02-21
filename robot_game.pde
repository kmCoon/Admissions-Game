
int robotstate = 0; 
Robot robot1;  

ArrayList <Block> blocks; 

int yellow = color(255, 255, 50);
int purple = color(115, 0, 175); 



void robotsetup()
{
  initialize_game();
  
  robot1 = new Robot(new PVector(width/10, height/10), new PVector(0, 0), yellow); 
  
  blocks = new ArrayList<Block>(); 
  
  
  //top m left
  blocks.add(new Block(new PVector(width/4 + 100, height/5 - 25), 100 , 150 , purple)); 
  
  // top m right
  blocks.add(new Block(new PVector(3 * width/4 - 200, height/5 - 25), 100, 150, purple)); 
   
  //center
  blocks.add(new Block(new PVector(width/2 - 50, height/2 - 100), 100, 150, purple)); 
  blocks.add(new Block(new PVector(width/2 - 50, height/2 + 100), 100, 200, purple));
  
  //side m left
  blocks.add(new Block(new PVector(width/4 - 100, height/58), 100, 100, purple));
  blocks.add(new Block(new PVector(width/4 - 100, height/2 - 200), 100, 100, purple));
  blocks.add(new Block(new PVector(width/4 - 100, height/2), 100, 100, purple));
  blocks.add(new Block(new PVector(width/4 - 100, height/2 + 200), 100, 100, purple));
  
  //side m right
  blocks.add(new Block(new PVector(3 * width/4  , height/58), 100, 100, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2 - 200), 100, 100, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2), 100, 100, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2 + 200), 100, 100, purple));
 
  //bottom yellow line
  blocks.add(new Block(new PVector(width/4 - 100, height - 50), 900, 50, yellow)); 

}



void robotdraw()
{
  rectMode(CORNER);
  if(robotstate == 0)
  robotdraw_start();
  if(robotstate == 1)
  robotdraw_game(); 
  if(robotstate ==2)
  robotdraw_end(); 
  
  escButton.display();
} 

void robotdraw_start()
{
  background(purple);
  fill(255);
  textSize(40); 
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  text("Use up and down arrow keys to move your robot forward and backward, " + 
       "and use the left and right arrow keys to rotate. Try to get to the end block. " +
       "Press space to begin.", width/2, height/2, 2*width/3, 2*height/3);
}

void robotdraw_end()
{
  background(yellow); 
  fill(purple); 
  textSize(40);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  text("Congratulations, you WIN! Press space to leave the SPARC.", width/2, height/2, 2*width/3, 2*height/3); 
  
  
}


void robotkeyPressed()
{
  if(keyCode == ' ' && robotstate==0)
    robotstate = 1; 
    
  if(keyCode==' ' && robotstate==2)
    {
      gameState=10;
      robotstate=0;
    }
  
  else if(keyCode == LEFT)
  {
    robot1.moveLeft(); 
  }
  
  else if(keyCode == RIGHT)
  {
    robot1.moveRight(); 
  }
  
   else if(keyCode == UP)
  {
    robot1.moveForward();
  }
  
  else if(keyCode == DOWN) 
  {
    robot1.moveBackward(); 
  }

}


void robotkeyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT)
  {
    robot1.stopTurn(); 
  }
  else if (keyCode == UP || keyCode == DOWN)
  {
    robot1.stopMove();
  }
  
  
}
