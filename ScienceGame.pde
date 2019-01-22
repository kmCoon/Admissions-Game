
void playScience() {
  
}

/*
int r = 45;
int minigameState = 0;

PVector p1pos;
PVector p2pos; 
PVector coinpos; 
int coinRad = 28; 

int p1score = 0; 
int p2score = 0;

PVector p1velocity = new PVector(0,.1);
PVector p2velocity = new PVector(0,.1); 
PVector acceleration = new PVector (0,.1);
PVector airResistance = new PVector(.01,0);
PVector flap = new PVector(0,-3); 
PVector left = new PVector(-.8,0);
PVector right = new PVector(.8,0);

boolean p1shootLeft = false;
PVector p1ShotSpot;
PVector p1shotPos;

boolean p2shootLeft = false;
PVector p2ShotSpot;
PVector p2shotPos; 

boolean p1isShooting = false;
boolean p2isShooting = false;

PImage sky;
PImage explosion;
PImage p1keys;
PImage p2keys;
PImage marlb;
PImage die; // haha this is the collegeboard one

int offset = 20;

// I SAW U hangin out with caiTLYN YESTERDAY!
// RE- REBECCA IT'S NOT WHAT U THINK
// i won't hESITATE, *****
// pew pew

void playScience() {
  p1pos = new PVector(300,height/2); 
  p2pos = new PVector(width-300,height/2);
  coinpos = new PVector(random(50,width-50),random(50,height-80));
  sky = loadImage("CloudySky.jpg");
  explosion = loadImage("Explosion.png");
  p1keys = loadImage("p1keys.png");
  p2keys = loadImage("p2keys.png");
  explosion.resize(95, 95);
  p1keys.resize(500,500);
  p2keys.resize(500,500);
  
  
   if (minigameState == 0) {
      image(sky,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(60);
      
      text("WAR BIRDS", width/2, 100); 
      
      fill(0);
      textSize(20);
      text("Collect coins and shoot your opponent. Use the mouse during gameplay to select different themes.", width/2, 125);
      text("Left = original version, right = Marlborough theme, center = surprise! Click anywhere to start.",width/2,150);
      
      fill(0);
      textSize(28);
      text ("PLAYER ONE", width/2,210);
      image(p1keys,width/2-250,100);
      
      textSize(28);
      text ("PLAYER TWO", width/2,520);
      image(p2keys,width/2-250,400);
     
      textSize(18);
      text("Kendall Cooney, 2018. Music and SFX found online.",width/2,height-20);
                
   }
   if (minigameState > 0 && minigameState < 10) {
      playGame(); 
   }
} 

void playGame() {
  image(sky, 0, 0);
  
  textSize(26);
  fill(0);
  text("Player 1: " + p1score, 90, height-100);
  text("Player 2: " + p2score, width-125, height-100); 
  
  strokeWeight(3);
  stroke(255, 187, 0);
  fill(255, 216, 0);
  ellipse(coinpos.x,coinpos.y,coinRad,coinRad);
  
  noStroke(); 
  fill(121, 193, 5);
  rect(0, height-70, width, 70);
  fill(255,0,0);
  ellipse(p1pos.x,p1pos.y,r,r); // Displays player 1
  fill(0,0,255);
  ellipse(p2pos.x,p2pos.y,r,r); // Displays player 2
  
  if (p1pos.y >= height-90) { // Bounce for player 1
      p1velocity.y *= -1;
      p1velocity.mult(.90);
   }
    if(p1pos.y <= r-10) { // Ceiling for player 1
     p1velocity.y = 0;
     p1velocity.add(acceleration);
   }
   
    if (p2pos.y >= height-90) { // Bounce for player 2
      p2velocity.y *= -1;
      p2velocity.mult(.90);
    }
     if(p2pos.y <= r-10) { // Ceiling for player 2
     p2velocity.y = 0;
     p2velocity.add(acceleration);
   }
     
    //textSize(20);
    //text("P1 Velocity: " + p1velocity, 800, 800);
    
    p1pos.add(p1velocity); 
    if(p1velocity.y < 9.5) {
      p1velocity.add(acceleration); 
    }
    
    // Velocity & acceleration for both players
    p2pos.add(p2velocity);
    if(p2velocity.y < 9.5) {
      p2velocity.add(acceleration); 
    }
  
    //p1 stuff
    
  if (p1pos.x < 0) {
     p1pos.x = p1pos.x+width; 
  }
  
  if (p1pos.x > width) {
      p1pos.x = p1pos.x-width;
  }
  
  if (p1velocity.x < 0) 
    p1velocity.add(airResistance);
    
  if(p1velocity.x > 0)
    p1velocity.sub(airResistance);
    
    //p2 stuff
    
   if (p2pos.x < 0) {
     p2pos.x = p2pos.x+width;
  }
  
  if (p2pos.x > width) {
      p2pos.x = p2pos.x-width;
  }
  
  // Coin collission detection
  if (p1pos.x >= coinpos.x - coinRad && p1pos.x <= coinpos.x + coinRad && p1pos.y >= coinpos.y - coinRad && p1pos.y <= coinpos.y + coinRad) {
    p1score += 1;  
    coinpos = new PVector(random(50,width-100),random(50,height-100));
  }
  if (p2pos.x >= coinpos.x - coinRad && p2pos.x <= coinpos.x + coinRad && p2pos.y >= coinpos.y - coinRad && p2pos.y <= coinpos.y + coinRad) {
    p2score += 1;  
    coinpos = new PVector(random(50,width-100),random(50,height-100));
  }
   
   if(p1isShooting)
     p1shoot();
     
   if(p2isShooting)
     p2shoot(); 
}

void p1shoot() {
    if(p1isShooting) {
      fill(0);
      ellipse(p1ShotSpot.x+p1shotPos.x,p1ShotSpot.y, 10, 10);
      if (p1shootLeft)
        p1shotPos.x -= 5;
      if (!p1shootLeft)
        p1shotPos.x += 5; 
      if (p1isShooting && p1ShotSpot.x+p1shotPos.x >= p2pos.x-r && p1ShotSpot.x+p1shotPos.x <= p2pos.x+r && p1ShotSpot.y >= p2pos.y-r && p1ShotSpot.y <= p2pos.y+r) {
        p1isShooting = false;
        if (p2score > 0)
          p2score -= 1;
        image(explosion, p2pos.x-30, p2pos.y-30);
      }
      if (p1ShotSpot.x+p1shotPos.x < 0 || p1ShotSpot.x+p1shotPos.x > width) {
        p1isShooting = false;
        p1shotPos = new PVector(0,0);
    }  
  }
}

void p2shoot() {
  if(p2isShooting) {
      fill(0);
      ellipse(p2ShotSpot.x+p2shotPos.x,p2ShotSpot.y, 10, 10);
      if (p2shootLeft)
        p2shotPos.x -= 5;
      if (!p2shootLeft)
        p2shotPos.x += 5; 
      if (p2isShooting && p2ShotSpot.x+p2shotPos.x >= p1pos.x-r && p2ShotSpot.x+p2shotPos.x <= p1pos.x+r && p2ShotSpot.y >= p1pos.y-r && p2ShotSpot.y <= p1pos.y+r) {
        p2isShooting = false;
        if (p1score > 0)
          p1score -= 1;
        image(explosion, p1pos.x-30, p1pos.y-30);
      }
      if (p2ShotSpot.x+p2shotPos.x < 0 || p2ShotSpot.x+p2shotPos.x > width) {
        p2isShooting = false;
        p2shotPos = new PVector(0,0);
    }  
  }
}

void mouseClicked() {
  if(mouseButton == LEFT) {
    minigameState = 1;
  }
}*/
