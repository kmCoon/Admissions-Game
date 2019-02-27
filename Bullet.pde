
class Bullet {
  PVector currentPos;
  PVector startingPos;
  boolean isDisplayed = false;
  
  Bullet() {

  }
  
  void setStartingPos(PVector shotFrom) {
    startingPos = shotFrom;
    currentPos = shotFrom;
  }
  
  void isShot() {
    isDisplayed = true;  
  }
  
  void isOffscreen() {
    isDisplayed = false;
    currentPos.x = 0;
  }
  
  void shooting() {
    if(isDisplayed) {
      fill(0);
      ellipse(startingPos.x+currentPos.x,startingPos.y, 10, 10); //nullPointer here
      if (p1shootLeft)
        currentPos.x -= 5;
      if (!p1shootLeft)
        currentPos.x += 5; 
      if (p1isShooting && startingPos.x+currentPos.x >= p2pos.x-r && startingPos.x+currentPos.x <= p2pos.x+r && startingPos.y >= p2pos.y-r && startingPos.y <= p2pos.y+r) {
        p1isShooting = false;
        if (p2life > 0)
          p2life -= 1;
        image(explosion, p2pos.x-30, p2pos.y-30);
        //punch.rewind(); 
        //punch.play();
      }
      if (startingPos.x+currentPos.x < 0 || startingPos.x+currentPos.x > width) {
        p1isShooting = false;
        isDisplayed = false;
        //p1shotPos = new PVector(0,0);
      }  
    }
  }
}
