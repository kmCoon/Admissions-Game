
void mainMenu() {
  
   
   //ArrayList<Confetti> confettiList = new ArrayList<Confetti>();
   
   //for (int i = 0; i< 100; i ++){
   // confettiList.add(createConfetti());
   // confettiList.get(i).display();
   //}
   
   background(88, 23, 145);
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
 
Confetti createConfetti(){
  int r = (int)random(5, 10);
  PVector position = new PVector(random(r, width-r), random(r, height-r));
  PVector velocity = PVector.random2D();
  velocity.setMag(1);
  int c = color(255);
  noStroke();
  Confetti con = new Confetti(r, position, velocity, c, position.x, position.y);
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
  
  public Confetti(float r, PVector position, PVector velocity, int c, float startX, float startY){
    r = random(5, 10);
    this.position = position;
    this.velocity = velocity;
    this.c = c;
    this.startX = startX;
    this.startY = startY;
    acceleration = new PVector (0, .1);
    
  }
  
  void display(){
    fill(c);
    rect(position.x, position.y, r, r);
    //position.add(velocity);
  }
  
}