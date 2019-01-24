class Door {
  float x;
  PImage inside;
  String text;
  boolean playerOn = false;
  boolean isDisplayed = false;
  
  Door(float xIn, String display)
  {
    x = xIn;
    text = display;
  }
  
  void display()
  {
    fill(66, 38, 8);
    rect(x, height/2-10, 100, 200);
    isDisplayed = true;
  }
  
  void open() {
    if (isDisplayed == true && player.position.x > x && player.position.x < (x+100)) {
      fill(0);
      text(text,x-50, 420);
      playerOn = true;
    }
    else {
       playerOn = false; 
    }
  }
}
