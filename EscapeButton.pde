class Escape {
  float x;
  float y;
  String text;
  boolean mouseOn = false;
  boolean isDisplayed = false;
  int length = 80;
  int width = 40;
  
  Escape(String display) {
    x = 20;
    y = 20;
    text = display;
  }
  
  void display() {
    fill(255,0,0);
    rect(x,y,length,width);
    isDisplayed = true;
  }
  
  void checkforHover() {
     if (mouseX >= x && mouseX <= (x+length) && mouseY >= y && mouseY <= y+width) {
        mouseOn = true; 
        displayText();
     }
     else 
       mouseOn = false;
  }
  
  void displayText() {
    text(text, x+length+30,y);
  }
  
}
