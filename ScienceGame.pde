//
// Science Game
//


/* @pjs preload="data/capillary.png"; */
/* @pjs preload="data/Explosion.png"; */
/* @pjs preload="data/p1keys.png"; */
/* @pjs preload="data/p2keys.png"; */


int r = 45;
int minigameState = 0;

float timing;

PVector p1pos;
PVector p2pos; 
PVector coinpos; 
int coinRad = 35; 

int p1life = 3; 
int p2life = 3;

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

boolean timeStart;

boolean p2shootLeft = false;
PVector p2ShotSpot;
PVector p2shotPos; 

boolean p1isShooting = false;
boolean p2isShooting = false;

PImage capillary;
PImage explosion;
PImage p1keys;
PImage p2keys;

int offset = 20;

//AudioPlayer punch;
//AudioPlayer shot;

void setupScience() {
  
  //fullScreen();
  
  //minim = new Minim(this);
  //punch = minim.loadFile("Punch.mp3"); 
  //shot = minim.loadFile("Shot.mp3");

  //shot.setVolume(0.05);
  //punch.setVolume(0.4);
  
  p1pos = new PVector(300,height/2); 
  p2pos = new PVector(width-300,height/2);
  coinpos = new PVector(random(50,width-50),random(50,height-80));
  capillary = loadImage("data/capillary.png");
  
  explosion = loadImage("data/Explosion.png");
  p1keys = loadImage("data/p1keys.png");
  p2keys = loadImage("data/p2keys.png");
  explosion.resize(95, 95);
  p1keys.resize(500,500);
  p2keys.resize(500,500);
}

// I SAW U hangin out with caiTLYN YESTERDAY!
// RE- REBECCA IT'S NOT WHAT U THINK

void drawScience() {
    escButton.display();
    escButton.checkforHover();
  
   if (minigameState == 0) {
      image(capillary,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(60);
      
      fill(60,0,0);
      text("BIOLOGY - CELL DEFENSE", width/2, 100); 
      
      fill(0);
      textSize(22);
      text("Welcome to bio defense! As a white blood cell, it's your job to shoot the viral particle that", width/2, 150);
      text("has infected the host body. Make sure to keep your distance; it'll hurt you if you touch it!",width/2,182);
      
      fill(219, 208, 208);
      textSize(34);
      text ("IMMUNE CELL", width/2,300);
      image(p1keys,width/2-250,280);          
   }
   
   if (minigameState > 0 && minigameState < 10) {
      playGame(); 
   }
   escButton.display();
} 

void playGame() {
  
  if (p1life <= 0) {
      if (timeStart == false) {
        timing = millis();
        timeStart = true;
      }
      image(capillary,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(60);
      
      fill(60,0,0);
      text("THE BACTERIA CONQUER!", width/2, height/2); 
      
      textSize(22);
      fill(0);
      text("Returning to the homescreen...",width/2,height/2+75);
      
      println(millis() - timing); 
      if (millis() - timing >= 2500) {
         gameState = 40;
         p1life = 3; 
         p2life = 3;
         minigameState = 0;
      }
  }
  
  else if (p2life <= 0) {
      if (timeStart == false) {
        timing = millis();
        timeStart = true;
      }
      image(capillary,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(60);
      
      fill(60,0,0);
      text("IMMUNE SYSTEM PREVAILS", width/2, height/2);
      
      textSize(22);
      fill(0);
      text("Returning to the homescreen...",width/2,height/2+75);
      
      if (millis() - timing >= 2500) {
         gameState = 40;
         p1life = 3; 
         p2life = 3;
         minigameState = 0;
      }
  }
  
  else { 
    image(capillary, 0, 0);
    
    textSize(26);
    fill(219, 208, 208);
    text("Macrophage: " + p1life, 120, height-100);
    fill(38, 117, 61);
    text("E. Coli: " + p2life, width-100, height-100); 
    
    strokeWeight(3);
    stroke(8, 87, 31);
    fill(38, 117, 61);
    ellipse(coinpos.x,coinpos.y,coinRad,coinRad);
    
    noStroke(); 
    fill(89, 7, 7);
    rect(0, height-70, width, 70);
    fill(219, 208, 208);
    ellipse(p1pos.x,p1pos.y,r,r); // Displays player 1
    
     if (p1pos.y >= height-90) { // Bounce for player 1
        p1velocity.y *= -1;
        p1velocity.mult(.90);
     }
      if(p1pos.y <= r-10) { // Ceiling for player 1
       p1velocity.y = 0;
       p1velocity.add(acceleration);
     }
       
      //textSize(20);
      //text("P1 Velocity: " + p1velocity, 800, 800);
      
      p1pos.add(p1velocity); 
      if(p1velocity.y < 9.5) {
        p1velocity.add(acceleration); 
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
    
    // Coin collision detection
    
    if (p1pos.x >= coinpos.x - coinRad && p1pos.x <= coinpos.x + coinRad && p1pos.y >= coinpos.y - coinRad && p1pos.y <= coinpos.y + coinRad) {   
        p1pos.x -= 20;
        p1pos.y -= 20; 
        p1life -= 1;
     }
     
     if (p1isShooting && p1ShotSpot.x+p1shotPos.x >= coinpos.x-coinRad && p1ShotSpot.x+p1shotPos.x <= coinpos.x+coinRad && p1ShotSpot.y >= coinpos.y-coinRad && p1ShotSpot.y <= coinpos.y+coinRad) { 
       coinpos = new PVector(random(50,width-100),random(50,height-100));
       p1isShooting = false;
       if (p2life > 0) 
         p2life -= 1;
     }
     
     if(p1isShooting)
       p1shoot();
  }
}

void scienceKeys() {
  if (minigameState > 0) {
      if (keyCode == 'W') {
        if (p2velocity.y < 15)
         p1velocity.add(flap);
      }
      if (keyCode == 'A') {
        if (p1velocity.x > -6)
         p1velocity.add(left);
      }
      if (keyCode == 'D') {
        if (p1velocity.x < 6)
         p1velocity.add(right);
      }
      
      if (keyCode == 'Q') {
       if (p1isShooting == false) {
         //shot.rewind();
         //shot.play();
         p1shootLeft = true;
         p1isShooting = true;
         p1ShotSpot = new PVector (p1pos.x,p1pos.y);
         p1shotPos = new PVector(0,0);
       } 
      }
      if (keyCode == 'E') {
       if (p1isShooting == false) {
         //shot.rewind();
         //shot.play();
         p1shootLeft = false;
         p1isShooting = true;
         p1ShotSpot = new PVector (p1pos.x,p1pos.y);
         p1shotPos = new PVector(0,0);
       }
      }
     }
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
        if (p2life > 0)
          p2life -= 1;
        image(explosion, p2pos.x-30, p2pos.y-30);
        //punch.rewind(); 
        //punch.play();
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
        if (p1life > 0)
          p1life -= 1;
        image(explosion, p1pos.x-30, p1pos.y-30);
        //punch.rewind();
        //punch.play();
      }
      if (p2ShotSpot.x+p2shotPos.x < 0 || p2ShotSpot.x+p2shotPos.x > width) {
        p2isShooting = false;
        p2shotPos = new PVector(0,0);
    }  
  }
}

void scienceClicking() {
  if(mouseButton == LEFT) {
    minigameState = 1;
  }
  if (mouseButton == RIGHT) {
    minigameState = 10;
  }
  if (mouseButton == CENTER) {
    minigameState = 20;
  }
}
