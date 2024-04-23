class Light {
  char letter;
  int number;
  PVector posit;
  boolean lightIsOn = false;
  
  Light (char let, int numberOfLights) {
   letter = let;
   number = numberOfLights;
   int level;
   int rowPos;
   float x;
   float y;
   
   if (numberOfLights < 10) { //<>//
    level = 1;
    rowPos = numberOfLights;
    x = (rowPos + 1.5)*width/11;
   } else if (numberOfLights < 19) {
    level = 2;
    rowPos = numberOfLights - 10;
    x = (rowPos+1.5)*width/11;
   } else {
    level = 3;
    rowPos = numberOfLights - 19;
    x = (rowPos+2.0)*width/11;
   }
   y = height/3 + level * (height*2/3) / 4;
   posit = new PVector (x, y);
  }
  
  void show() {
    if (lightIsOn) {
     imageMode(CENTER);
     image(lightSprite, posit.x, posit.y);
     fill(50, 100, 0);
    }
    else {
     strokeWeight(5);
     fill(150);
     ellipse(posit.x, posit.y, 80, 80);
     fill(50);
    }
    textAlign(CENTER, CENTER);
    textSize(20);
    text(letter, posit.x, posit.y);
  }
}
