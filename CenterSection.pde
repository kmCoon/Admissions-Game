
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
   scienceDoor.display();
   scienceDoor.open();
   ceiDoor.display();
   ceiDoor.open();
   
   player.display(); 
   textSize(25);
   fill(#FF0D82);

   if (doorPos == 0)
     println("Player pos: " + player.position.x);
     println("Door: " + doorZero.x); // issue is here
     player.position.x = doorZero.x; // nullPointer here
   
   if (doorPos == 1)
     player.position.x = doorOne.x;
     
   if (doorPos == 2)
     player.position.x = doorTwo.x;
     
   if (doorPos == 3)
     player.position.x = doorThree.x;

   if (player.position.x >= width-r) {
     player.position.x = width-r;
   }
   if (player.position.x <= r) { 
     player.position.x = r;
   }
}
