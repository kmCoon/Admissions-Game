//
// robot_game
//


int robotstate = 0; 
Robot robot1;  

ArrayList <Block> blocks; 

int yellow = color(255, 210, 0);
int purple = color(38, 8, 89); 
int blockwidth;
int blockheight;

PVector robotStartPos;



void robotsetup()
{
  robotstate = 0;
  initialize_game();
  
  robotStartPos = new PVector(width/10, height/6);
  
  robot1 = new Robot(robotStartPos, new PVector(0, 0), yellow); 
  
  blocks = new ArrayList<Block>();
  blockwidth=width/9;
  blockheight = height/13;
  
  
  //top m left
  blocks.add(new Block(new PVector(width/4 + blockwidth, height/5 - (0.25*blockheight)), blockwidth, (int)(blockheight*1.5), purple)); 
  
  // top m right
  blocks.add(new Block(new PVector(3 * width/4 - (2*blockwidth), height/5 - (0.25*blockheight)), blockwidth, (int)(blockheight*1.5), purple)); 
   
  //center
  blocks.add(new Block(new PVector(width/2 - (0.5*blockwidth), height/2 - blockheight), blockwidth, (int)(blockheight*1.5), purple)); 
  blocks.add(new Block(new PVector(width/2 - (0.5*blockwidth), height/2 + blockheight), blockwidth, blockheight*2, purple));
  
  //side m left
  blocks.add(new Block(new PVector(width/4 - blockwidth, height/58), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(width/4 - blockwidth, height/2 - (2*blockheight)), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(width/4 - blockwidth, height/2), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(width/4 - blockwidth, height/2 + (2*blockheight)), blockwidth, blockheight, purple));
  
  //side m right
  blocks.add(new Block(new PVector(3 * width/4  , height/58), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2 - (2*blockheight)), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2), blockwidth, blockheight, purple));
  blocks.add(new Block(new PVector(3 * width/4 , height/2 + (2*blockheight)), blockwidth, blockheight, purple));
 
  //bottom yellow line
  blocks.add(new Block(new PVector(width/4 - blockwidth, height - (0.6*blockheight)), 
        width/2 + 2*blockwidth, (int)(blockheight*0.5), yellow)); 

}



void robotdraw()
{
  rectMode(CORNER);
  textAlign(LEFT, TOP);
  strokeWeight(1);
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
  textSize(30); 
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  text("Use the arrow keys to move your robot\n" + 
       "to the end block\n\n" +
       "Press space to begin.", width/2, height/2);
}

void robotdraw_end()
{
  background(yellow); 
  fill(purple); 
  textSize(40);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  text("Congratulations, you WIN!\n\nPress space to leave the SPARC.", 
        width/2, height/2); 
}


void robotkeyPressed()
{
  if(key == ' ' && robotstate==0)
  {
    robot1.position.x=robotStartPos.x;
    robot1.position.y=robotStartPos.y;
    robot1.heading = 0;
    robotstate = 1; 
  }
    
  if(key == ' ' && robotstate==2)
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
