class PlugBoard {
Plug[] plugCount = new Plug[10];
PlugPoint[] plugPoints = new PlugPoint[26];
boolean showing = false;
boolean plugMoving = false;
int movingPlugNumber = 0;

PlugBoard() {
 for (int i = 0; i < plugPoints.length; i++) {
  plugPoints[i] = new PlugPoint(i); 
 }
 randomisePlugs();
}

void randomisePlugs() {
 ArrayList<Integer> chosen = new ArrayList<Integer>();
 for (int i = 0; i < 10; i++) {
  int rand1 = floor(random(26));
  while (chosen.contains(rand1)) {
   rand1 = floor(random(26)); 
  }
  chosen.add(rand1);
  int rand2 = floor(random(26));
  while (chosen.contains(rand2)) {
   rand2 = floor(random(26)); 
  }
  chosen.add(rand2);
  plugCount[i] = new Plug(rand1, rand2, plugPoints[rand1], plugPoints[rand2]);
  plugPoints[rand1].occupied = true;
  plugPoints[rand2].occupied = true;
 }
}

void show() {
 for (int i = 0; i < 26; i++) {
  plugPoints[i].show(); 
 }
 for (int i = 0; i < plugCount.length; i++) {
  plugCount[i].showPlugs(); 
 }
 for (int i = 0; i < plugCount.length; i++) {
  plugCount[i].showLines(); 
 }
 
}

int runThrough(int input) {
 for (int i = 0; i < plugCount.length; i++) {
  if (plugCount[i].connectionLine1 == input) {
    println(plugCount[i].connectionLine2);
    return plugCount[i].connectionLine2;
  } else if (plugCount[i].connectionLine2 == input) {
    println(plugCount[i].connectionLine1);
   return plugCount[i].connectionLine1; 
  }
 }
 return input;
}

 void click(int x, int y) {
  if(!plugMoving) {
   for (int i = 0; i < plugCount.length; i++) {
    if (plugCount[i].click(x, y)) {
     plugMoving = true;
     movingPlugNumber = i;
     return;
    }
   }
  } else {
    for (int i = 0; i < plugPoints.length; i++) {
      if(plugPoints[i].click(x,y)) {
       if(!plugPoints[i].occupied) {
        plugMoving = false;
        if (plugCount[movingPlugNumber].move1) {
         plugCount[movingPlugNumber].setPlugPoint(i, plugPoints[i], 1);
         plugCount[movingPlugNumber].move1 = false;
        } 
        else {
         plugCount[movingPlugNumber].setPlugPoint(i, plugPoints[i], 2);
         plugCount[movingPlugNumber].move2 = false;
        }
       }
       return;
      }
    }
   }
 }
}
