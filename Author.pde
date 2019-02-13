
class Author
{
  String name;
  int num;
  int y;
  
  Author(String nameIn, int numIn)
  {
    name = nameIn;
    num = numIn;
  }
  
  void display(int yIn)
  {
    y = yIn;
    fill(255, 230, 230);
    if (mouseOn()) {strokeWeight(3);}
    else {strokeWeight(1);}
    rect(170, y, 320, 50);
    fill(0);
    text(name, 170, y);
  }
  
  void isClicked()
  {
    if (num==books.get(currentBook).getNum() && currentBook==9)
    {
      score++;
      englishgameState=2;
    }
    else if (num==books.get(currentBook).getNum() && currentBook<books.size())
    {
      score++;
      currentBook++;
    }
    else
      score--;
  }
  
  boolean mouseOn()
  {
    if (mouseX>10 && mouseX<330 && mouseY>y-25 && mouseY<y+25)
      return true;
    else
      return false;
  }
  
  
  
  
}
