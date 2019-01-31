class Food
{
  PImage image;
  float x;
  float vy;
  float y;
  int pointValue;
  
  
  Food(PImage imageIn, int pointIn)
  {
    image = imageIn;
    pointValue = pointIn;
    x=random(0, width);
    vy=random(3, 10);
    y=random(-5*height, -100);
  }
  
  void display()
  {
    image(image, x, y);
    y+=vy;
    if (y>height+100){reset();}
  }
  
  void reset()
  {
    y=random(-5*height, -100);
    vy=random(3, 10);
    x=random(0, width);
  }
  
  PVector spot(){return new PVector(x, y);}
  float w(){return image.width;}
  int p(){return pointValue;}
}
