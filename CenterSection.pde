
void playSectionII() {
   stroke(0);
   strokeWeight(1);
   image(buildingTwo,0,0);
   fill(0,0,255);
        
   englishDoor.display();
   englishDoor.open();
   historyDoor.display();
   historyDoor.open();
   caswellDoor.display();
   caswellDoor.open();
   
   player.display(); 
   textSize(25);
   fill(#FF0D82);
   //text("Use the left and right arrow keys to move to the door", 80, 50);
   
   /*if (player.position.x >= 500 && player.position.x <= 600) {
     textSize(50);
     text("Press Q to enter the classroom", 450,height/2-60);  
   }  */
   if (player.position.x >= width) {
     gameState = 30; 
     player.position.x = 1;
   }
   if (player.position.x <= 0) { 
     gameState = 40;
     player.position.x = width-1;
   }
}
