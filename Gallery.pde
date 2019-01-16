
void playGallery() {
  background(255);
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
