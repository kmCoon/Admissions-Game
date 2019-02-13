

class Book
{
  PImage cover;
  int num;
  String title;
  
  Book(String coverIn, int numIn, String titleIn)
  {
    cover = loadImage(coverIn + ".jpg");
    cover.resize(width/5, height/2);
    num = numIn;
    title = titleIn;
  }
  
  void display()
  {
    image(cover, width/2, height/2);
  }
  
  int getNum() {return num;}
  
  
  
}
