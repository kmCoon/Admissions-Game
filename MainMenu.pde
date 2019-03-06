
void mainMenu() {
  
   
   //ArrayList<Confetti> confettiList = new ArrayList<Confetti>();
   
   //for (int i = 0; i< 100; i ++){
   // confettiList.add(createConfetti());
   // confettiList.get(i).display();
   //}
   
   //background(88, 23, 145);
   background(38, 8, 89);
   fill(255);
   textAlign(CENTER);
   
   for (Confetti c: confettiList){
    c.display();
  }
   

   textSize(50);
   fill(255);
   text("Welcome to", width/2, height*.4);
    fill(255, 210, 0);
   text("Marlborough!", width/2, height*.4+ 55);

   textSize(17);
   fill(255);
   text("Click to start", width/2, height-60);
} 

 ArrayList<Confetti> confettiList = new ArrayList<Confetti>();
 //int count = frameCount;
 
Confetti createConfetti(){
  
  int r = (int)random(5, 10);
  PVector position = new PVector(random(r, width+50), random(r, height+100));
  float theta = random(11*PI/8, 13*PI/8);
  PVector velocity = new PVector(cos(theta), sin(theta));
  velocity.setMag(random(3, 7));
 

  //int c = white;
  
  
  noStroke();
  Confetti con = new Confetti(r, position, velocity, position.x, position.y);
  return con;
}

class Confetti {
 
  float r;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float startX;
  float startY;
  int c;
  
  int white, yellow, purple;
    
  public Confetti(float r, PVector position, PVector velocity, float startX, float startY){
    this.r = random(5, 10);
    this.position = position;
    this.velocity = velocity;
    this.c = c;
    this.startX = startX;
    this.startY = startY;
    acceleration = new PVector (0, .08);
    white = color(255);
    yellow = color(255, random(210, 230), random(0, 20));
    purple = color(random(160, 170), random(136, 146), random(189, 199));
     randomizeColor();
  }
  
  void display(){
    fill(c);
    rect(position.x, position.y, r, r);
    position.add(velocity);
    velocity.add(acceleration);
    
    if (frameCount%20 ==0){
      randomizeColor();
    }
  }
  
  void randomizeColor()
  {
    int rand = (int)random(0, 3);
   if(rand == 0) c = white;
    else if(rand == 1) c = yellow;
    else if(rand == 2) c = purple;  
  }
  
}