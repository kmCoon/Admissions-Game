
void playSectionII() {
   stroke(0);
   strokeWeight(1);
   image(buildingTwo,0,0);
   fill(0,0,255);
        
   englishDoor.display();
   englishDoor.open();
   roboDoor.display();
   roboDoor.open();
   caswellDoor.display();
   caswellDoor.open();
   
   println("Englishdoor: " + englishDoor.x + " " + englishDoor.doorWidth);
   println("Robodoor: " + roboDoor.x + " " + roboDoor.doorWidth);        
   println("Caswell: " + caswellDoor.x + " " + caswellDoor.doorWidth);
   
   player.display(); 
   textSize(25);
   fill(#FF0D82);

   if (player.position.x >= width) {
     gameState = 30; 
     player.position.x = 1;
   }
   if (player.position.x <= 0) { 
     gameState = 40;
     player.position.x = width-1;
   }
}
