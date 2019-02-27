
void playSectionII() {
   stroke(0);
   strokeWeight(1);

   if (centerBuilding.width != width)
     centerBuilding.resize(width,height);

   image(centerBuilding,0,0);
   fill(0,0,255);  
    
   englishDoor.display();
   englishDoor.open();
   roboDoor.display();
   roboDoor.open();
   //caswellDoor.display();
   //caswellDoor.open();
   scienceDoor.display();
   scienceDoor.open();
   ceiDoor.display();
   ceiDoor.open();
   
   player.display(); 
   textSize(25);
   fill(#FF0D82);

   if (player.position.x >= width-r) {
     player.position.x = width-r;
   }
   if (player.position.x <= r) { 
     player.position.x = r;
   }
}
