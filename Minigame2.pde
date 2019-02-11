
void playHistory() {
    stroke(0);
    strokeWeight(1);
    background(180,160,20);
    player.display();
    
    escButton.display();
    escButton.checkforHover();
    
    text("Move to the left to complete the minigame!", 100, 200);
    
    if (player.position.x >= 0 && player.position.x <= 50) {
      gameState = 10;
      player.position.x = 800;
    }
}
