class PlugPoint {
  PVector pos = new PVector();
  char letter;
  int letterNumber;
  boolean occupied = false;
  
  PlugPoint(int numberOfPoint) {
   letterNumber = numberOfPoint;
   letter = letterOrderCapital.charAt(numberOfPoint);
   int level;
   int rowPositPlug;
   float x;
   float y;
   if (numberOfPoint < 10) {
    level = 1;
    rowPositPlug = numberOfPoint;
    x = (rowPositPlug + 1.5)*width/11;
   } else if (numberOfPoint < 19) {
    level = 2;
    rowPositPlug = numberOfPoint - 10;
    x = (rowPositPlug+1.5)*width/11;
   } else {
    level = 3;
    rowPositPlug = numberOfPoint - 19;
    x = (rowPositPlug+2.0)*width/11;
   }
   y = height/3 + level * (height*2/3) / 4;
      if (numberOfPoint % 3 == 0) {
       y+=15; 
      }
      pos = new PVector(x, y);
  }
   
  void show() {
   textAlign(CENTER, CENTER);
   textSize(30);
   fill(255);
   text (letter, pos.x, pos.y-40);
   fill(20);
   stroke(255);
   ellipse(pos.x, pos.y, 20, 20);
   ellipse(pos.x, pos.y+30, 20, 20);
  }
  boolean click(int x, int y) {
   if (x < pos.x + 15 && x  > pos.x - 15 && y < pos.y + 35 && y > pos.y - 35) {
    return true; 
   }
   return false;
  }
}
