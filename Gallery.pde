
PImage pipe;
PImage ponytail;
PImage landscape;
PImage patterns;

void setupGallery() {
   
   pipe = loadImage("Kyrapipe.jpg");
   pipe.resize(200,140);
   
   ponytail = loadImage("kyraponytail.jpg");
   ponytail.resize(120,200);
   
   landscape = loadImage("GabrielaBecher.png");
   landscape.resize(300,140);
   
   patterns = loadImage("sidneybae.png");
   patterns.resize(200,200);
}

void playGallery() {
  stroke(0);
  strokeWeight(1);
  background(255); 
  
  image(pipe, 20,20);
  image(ponytail, width/2,50);
  image(landscape,width/2-100,height-80);
  image(patterns,width-500,40);
  
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
