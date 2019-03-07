//
// Science Game
//


/* @pjs preload="data/capillary.png"; */
/* @pjs preload="data/Explosion.png"; */
/* @pjs preload="data/p1keys.png"; */
/* @pjs preload="data/p2keys.png"; */
/* @pjs preload="data/Germ.png"; */
/* @pjs preload="data/Macropage.png"; */

int r = 50;
int minigameState = 0;

int time;
int waitTime = 1000;

PVector p1pos;
PVector p2pos; 
PVector coinpos; 
int coinRad = 55; 

PVector p1posHolder;

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

boolean p2shootLeft = false;
PVector p2ShotSpot;
PVector p2shotPos; 

boolean p1isShooting = false;
boolean p2isShooting = false;

PImage capillary;
PImage explosion;
PImage keys;
PImage germ;
PImage sciPlayer;

boolean timeRunning = false;

ArrayList<Bullet> bullets;

int offset = 20;

void setupScience() {
  
  p1pos = new PVector(300,height/2); 
  p2pos = new PVector(width-300,height/2);
  coinpos = new PVector(random(50,width-50),random(50,height-80));
  capillary = loadImage("data/capillary.png");
  
  explosion = loadImage("data/Explosion.png");
  keys = loadImage("data/p1keys.png");
  germ = loadImage("data/Germ.png");
  germ.resize(coinRad,coinRad);
  sciPlayer = loadImage("data/Macrophage.png");
  sciPlayer.resize(r,r);
  explosion.resize(95, 95);
  keys.resize(320,190);
  
  bullets = new ArrayList<Bullet>();
  
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
      textSize(40);
      
      fill(60,0,0);
      text("BIOLOGY - CELL DEFENSE", width/2, 100); 
      
      fill(0);
      textSize(15);
      text("Welcome to bio defense! As a white blood cell, it's your job to shoot the viral particle that", width/2, 150);
      text("has infected the host body. Make sure to keep your distance; it'll hurt you if you touch it! Click to start.",width/2,182);
      
      imageMode(CENTER);
      image(keys,width/2,height/2+50);  
      imageMode(CORNER);
   }
   
   if (minigameState > 0 && minigameState < 10) {
      playGame(); 
   }
   escButton.display();
} 

void playGame() {
  
  stopQuicksand();
  
  if (timeRunning && (millis()-time)>2500) {
     gameState = 10;
     minigameState = 0;
     timeRunning = false;
     p1life = 3;
     p2life = 3;
  }
  
  else if (p1life <= 0) {
      image(capillary,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(40);
      
      fill(60,0,0);
      text("THE BACTERIA CONQUER!", width/2, height/2); 
      
      textSize(22);
      fill(0);
      text("Returning to the homescreen...",width/2,height/2+75);
      if (timeRunning == false)
        time = millis();
      timeRunning = true;
  }
  
  else if (p2life <= 0) {
      image(capillary,0,0);
      fill(200,0,0);
      textAlign(CENTER, BOTTOM);
      textSize(40);
      
      fill(60,0,0);
      text("IMMUNE SYSTEM PREVAILS", width/2, height/2);
      
      textSize(22);
      fill(0);
      text("Returning to the homescreen...",width/2,height/2+75);
      if (timeRunning == false)
        time = millis();
      timeRunning = true;
  }
  
  else { 
    p1posHolder = p1pos;
    image(capillary, 0, 0);
    
    textSize(26);
    fill(219, 208, 208);
    text("Macrophage: " + p1life, 120, height-100);
    fill(38, 117, 61);
    text("E. Coli: " + p2life, width-100, height-100); 

    image(germ,coinpos.x,coinpos.y); // Displays germ
    
    noStroke(); 
    fill(89, 7, 7);
    rect(0, height-70, width, 70); // Displays floor
    
    imageMode(CENTER);
    image(sciPlayer,p1pos.x,p1pos.y); // Displays player
    imageMode(CORNER);
    
     if (p1pos.y >= height-90) { // Bounce for player 1
        p1velocity.y *= -1;
        p1velocity.mult(.90);
     }
      if(p1pos.y <= r-10) { // Ceiling for player 1
       p1velocity.y = 0;
       p1velocity.add(acceleration);
     }
      
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
      
     if (p2pos.x < 0) {
       p2pos.x = p2pos.x+width;
    }
    
    // Coin collision detection
    
    if (p1pos.x >= coinpos.x - coinRad && p1pos.x <= coinpos.x + coinRad && p1pos.y >= coinpos.y - coinRad && p1pos.y <= coinpos.y + coinRad) {   
        p1pos.x -= 20;
        p1pos.y -= 20; 
        p1life -= 1;
     }
     
     if (bullets.size() > 0) {
       for (int i = 0; i < bullets.size(); i++) { // conCurrent mod exception when I try to canDestroy
         Bullet b = bullets.get(i);
         b.display();
         if (b.canDestroy) {
           bullets.remove(i);
         } 
       }
     }
  }
}

void scienceKeys() {
  if (minigameState > 0) {
      if (keyCode == UP) {
        if (p1velocity.y < 15)
         p1velocity.add(flap);
         //swoosh.rewind();
         //swoosh.play();
      }
      if (keyCode == LEFT) {
        if (p1velocity.x > -6)
         p1velocity.add(left);
      }
      if (keyCode == RIGHT) {
        if (p1velocity.x < 6)
         p1velocity.add(right);
      }
      
      if (keyCode == ',') {
        p1ShotSpot = new PVector(p1pos.x,p1pos.y);
        Bullet bullet = createBullet(p1ShotSpot);
        bullets.add(bullet);
        bullet.setDirection("Left");
      }
      if (keyCode == '.') {
        p1ShotSpot = new PVector(p1pos.x,p1pos.y);
        Bullet bullet = createBullet(p1ShotSpot);
        bullets.add(bullet);
        bullet.setDirection("Right");
      }
    }
}

Bullet createBullet(PVector shotFrom) {
   Bullet b = new Bullet();
   b.setStartingPos(shotFrom);
   b.isDisplayed = true;
   return b;
}

void stopQuicksand() {
  if (p1pos.y > (height-90)) { // height - 90
    p1pos.y = height-89;
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
