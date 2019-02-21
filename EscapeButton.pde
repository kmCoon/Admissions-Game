class Escape {
  float x;
  float y;
  String text;
  boolean mouseOn = false;
  boolean isDisplayed = false;
  int l = 120;
  int w = 60;
  
  Escape(String display) {
    x = width-20-l;
    y = height-20-w;
    text = display;
  }
  
  void display() {
    rectMode(CORNER);
    checkforHover();
    fill(255);
    rect(x,y,l,w);
    isDisplayed = true;
    textSize(15);
    fill(0);
    textAlign(CENTER, CENTER);
    rectMode(CORNERS);
    text(text, x+2, y+2, x+l-2, y+w-2);
  }
  
  void checkforHover() {
     if (mouseX >= x && mouseX <= (x+l) && mouseY >= y && mouseY <= y+w) {
        mouseOn = true;
        strokeWeight(3);
     }
     else 
     {
       mouseOn = false;
       strokeWeight(1);
     }
  }
  
  
}
