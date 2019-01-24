
void playSectionIII() {
  stroke(0);
  strokeWeight(1);
  image(buildingThree,0,0);
  galleryDoor.display();
  galleryDoor.open();
  ceiDoor.display();
  ceiDoor.open();
  player.display();
  if (player.position.x >= width)
    player.position.x = width;
  if (player.position.x <= 0) {
    gameState = 10;
    player.position.x = width-1;
  }
}
