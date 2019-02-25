class Door {
  float x;
  PImage inside;
  String name;
  boolean playerOn = false;
  boolean isDisplayed = false;
  
  float floorVal;
  int doorHeight = int(height*yScaleMult);
  int doorWidth = int(width*xScaleMult);
  
  Door(float xIn, String display) {
    x = xIn;
    name = display;                   
  }
  
  void display() {
    
    floorVal = ((height*scaleMult)-doorHeight);
    
    fill(66, 38, 8);
    rect(x, floorVal, doorWidth, doorHeight);
    isDisplayed = true;
  }
  
  void open() {
    if (isDisplayed == true && player.position.x > x && player.position.x < (x+100)) {
      fill(0);
      text(name,x-50, 420);
      playerOn = true;
    }
    else {
       playerOn = false; 
    }
  }
}
