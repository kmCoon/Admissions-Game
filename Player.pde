
class Player {
  PVector position;
  PVector velocity = new PVector(0,0);
  int r = 50;
  int velMult = 4;
  PVector acceleration = new PVector(1,0);
  
  Player(PVector positionIn) {
    position = positionIn;
  }
  
  void display() {
    fill(255,255,0);
    ellipse(position.x,position.y,r,r);
    position.add(velocity);
  }
  
  void changeVelocity(int direction) {
     velocity.x = velMult*direction;
  }
  
  void applyAcc(int direction) {
    //println("Apply acceleration called");
    if (direction == 0) {
      velMult = 4;
      //println("regular mult called");
    }
    if (velMult <= 9) {
      velMult += acceleration.x;
    }
  }
}
