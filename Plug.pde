class Plug {
  int connectionLine1;
  int connectionLine2;
  PlugPoint point1;
  PlugPoint point2;
  boolean move1 = false;
  boolean move2 = false;
  
  Plug(int c1, int c2, PlugPoint p1, PlugPoint p2) {
   connectionLine1 = c1; 
   connectionLine2 = c2;
   point1 = p1; 
   point2 = p2;
  }
  
  void showLines() {
   stroke(100, 100, 200, 150);
   strokeWeight(4);
   
   if (move1) {
    line(mouseX, mouseY, point2.pos.x, point2.pos.y +15); 
   } else if (move2) {
    line(point1.pos.x, point1.pos.y+15, mouseX, mouseY);
   } else {
    line(point1.pos.x, point1.pos.y+15, point2.pos.x, point2.pos.y+15); 
   }
  }
  
  void showPlugs() {
   stroke(200);
   fill(40);
   rectMode(CENTER);
   if (move1) {
    rect(mouseX, mouseY, 30, 70);
    rect(point2.pos.x, point2.pos.y+15, 30, 70);
   } else if (move2) {
    rect(point1.pos.x, point1.pos.y+15, 30, 70);
    rect(mouseX, mouseY, 30, 70);
   } else {
    rect(point1.pos.x, point1.pos.y+15, 30, 70);
    rect(point2.pos.x, point2.pos.y+15, 30, 70);
    fill(255);
    textSize(26);
    text(point2.letter, point1.pos.x, point1.pos.y+15);
    text(point1.letter, point2.pos.x, point2.pos.y+15);
   }
  }
  
  boolean click(int x, int y) {
   if (x < point1.pos.x+15 && x > point1.pos.x-15 && y < point1.pos.y+50 && y > point1.pos.y-20) {
    move1 = true;
    point1.occupied = false;
    wiringSet.play();
    return true;
   } else if (x < point2.pos.x+15 && x > point2.pos.x-15 && y < point2.pos.y+50 && y > point2.pos.y-20) {
    move2 = true;
    point2.occupied = false;
    wiringSet.play();
    return true;
   }
   return false;
  }
  
  void setPlugPoint(int plugPointNumber, PlugPoint newPointConnect, int connectionNumber) {
   newPointConnect.occupied = true; 
   switch (connectionNumber) {
    case(1):
      point1 = newPointConnect;
      connectionLine1 = plugPointNumber;
      println(connectionLine1);
      break;
    case(2):
      point2 = newPointConnect;
      connectionLine2 = plugPointNumber;
      println(connectionLine2);
      break;
   }
  }
}
