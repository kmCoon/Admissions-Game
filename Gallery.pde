//
// Gallery
//

//
// preload directives for processing.js
//

/* @pjs preload="data/Kyrapipe.jpg"; */
/* @pjs preload="data/kyraponytail.jpg"; */
/* @pjs preload="data/gabi.png"; */
/* @pjs preload="data/sidney.png"; */
/* @pjs preload="data/Gallery.png"; */


PImage pipe;
PImage ponytail;
PImage landscape;
PImage patterns;
PImage galBack;


void setupGallery() {
   pipe = loadImage("data/Kyrapipe.jpg");
   ponytail = loadImage("data/kyraponytail.jpg");
   landscape = loadImage("data/gabi.png");
   patterns = loadImage("data/sidney.png");
   galBack = loadImage("data/Gallery.png");

   resizeGalleryImages();
}

void resizeGalleryImages() {
   pipe.resize(200,140);
   ponytail.resize(120,200);
   landscape.resize(300,140);
   patterns.resize(200,200);
   galBack.resize(width,height);
}

void playGallery() {
  if (galBack.width != width)
    resizeGalleryImages();

  stroke(0);
  strokeWeight(1);
  image(galBack,0,0);
  
  image(pipe, width/20,height/2);
  image(ponytail, 5*width/20,height/2);
  image(landscape,width/2,height/2);
  image(patterns,4*width/5,height/2);
  
  fill(0);
  
  //galleryExit.display();
  //galleryExit.open();
  
  player.display();
  if (player.position.x <= 0)
    player.position.x = 0;
  else if (player.position.x >= width) {
     player.position.x = 1;
  }
  escButton.display();
}
