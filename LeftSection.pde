
void playSectionI() {
  image(buildingOne,0,0);
  scienceDoor.display();
  scienceDoor.open();
  player.display();
  if (player.position.x <= 0)
    player.position.x = 0;
  if (player.position.x >= width) {
     gameState = 10;
     player.position.x = 1;
  }
}
