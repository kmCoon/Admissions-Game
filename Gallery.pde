
PImage pipe;
PImage ponytail;
PImage landscape;
PImage patterns;

PImage background;

void setupGallery() {
   
   pipe = loadImage("Kyrapipe.jpg");
   pipe.resize(200,140);
   
   ponytail = loadImage("kyraponytail.jpg");
   ponytail.resize(120,200);
   
   landscape = loadImage("GabrielaBecher.png");
   landscape.resize(300,140);
   
   patterns = loadImage("sidneybae.png");
   patterns.resize(200,200);
   
   background = loadImage("Gallery.png");
   background.resize(width,height);
}

void playGallery() {
  stroke(0);
  strokeWeight(1);
  image(background,0,0);
  
  image(pipe, width/20,height/2);
  image(ponytail, 5*width/20,height/2);
  image(landscape,width/2,height/2);
  image(patterns,4*width/5,height/2);
  
  fill(0);
  text("This is the art gallery!", width/2-100,500);
  
  galleryExit.display();
  galleryExit.open();
  
  player.display();
  if (player.position.x <= 0)
    player.position.x = 0;
  else if (player.position.x >= width) {
     player.position.x = 1;
  }
}
