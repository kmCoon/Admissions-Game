

class Book
{
  PImage cover;
  int num;
  String title;
  
  Book(String coverIn, int numIn, String titleIn)
  {
    cover = loadImage("data/" + coverIn + ".png");
    num = numIn;
    title = titleIn;
    this.resize();
  }
  
  void display()
  {
    image(cover, width/2, height/2);
  }
  
  int getNum() {return num;}
  
  
  void resize() 
  {
    cover.resize((int)(1.7*width/5), (int)(1.7*height/2));
  }
}
