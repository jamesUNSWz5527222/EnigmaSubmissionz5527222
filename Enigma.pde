class Enigma {
 Rotor rotor1;
 Rotor rotor2;
 Rotor rotor3;
 Reflector Reflect;
 PlugBoard plugBoard;
 boolean plugsVisible = false;
 String sceneText = " Click bottom of the screen to show the Plugboard ";
 
   Enigma() {
      Reflect = new Reflector();
    plugBoard = new PlugBoard();
   }
   
   void setRotors(int first, int second, int third) {
    if (first!= second && first != third && second != third) {
     rotor1 = new Rotor(first, 1);
     rotor2 = new Rotor(second, 2);
     rotor3 = new Rotor(third, 3);
    }
   }
   
   void setRotorsPosition(int first, int second, int third) {
    rotor1.position = first;
    rotor2.position = second;
    rotor3.position = third;
   }
   
   char runEnigmaMachine(char inputCharacter) {
    if (rotor1.rotorNumb == rotor2.rotorNumb || rotor3.rotorNumb == rotor2.rotorNumb || rotor1.rotorNumb == rotor3.rotorNumb) {
     println ("You cannot use the same rotor twice.");
     return '1';
    }
    int inputNumber = letterOrderLower.indexOf(inputCharacter);
    int currentNumber = inputNumber;
    currentNumber = plugBoard.runThrough(currentNumber);
    currentNumber = rotor1.runThrough(currentNumber, true);
    currentNumber = rotor2.runThrough(currentNumber, true);
    currentNumber = rotor3.runThrough(currentNumber, true);
    currentNumber = Reflect.runThrough(currentNumber, true);
    currentNumber = rotor3.runThrough(currentNumber, false);
    currentNumber = rotor2.runThrough(currentNumber, false);
    currentNumber = rotor1.runThrough(currentNumber, false);
    currentNumber = plugBoard.runThrough(currentNumber);
    if (currentNumber == -1) {
       println(rotor1.position, rotor2.position, rotor3.position); 
    }
    if (currentNumber == inputNumber) {
       println(inputNumber, rotor1.position, rotor2.position, rotor3.position); 
       
    }
    moveRotors();
    println(rotor1.position, rotor2.position, rotor3.position);
     return letterOrderLower.charAt(currentNumber);
   }
   
void moveRotors() {
 rotor1.position += 1;
   if (rotor1.position == 26) {
    rotor1.position = 0;
    rotor2.position+=1;
      if (rotor2.position == 26) {
         rotor2.position = 0;
         rotor3.position+=1;
          if(rotor3.position == 26) {
           rotor3.position = 0; 
          }
      }
   }
}
 
void show() {
  if (!plugsVisible) {
     for (int i = 0; i < lettersBoard.length; i++) {
      lettersBoard[i].show();
   }
     rotor1.show();
     rotor2.show();
     rotor3.show();
     
  if (rotor1.rotorNumb == rotor2.rotorNumb || rotor3.rotorNumb == rotor2.rotorNumb || rotor1.rotorNumb == rotor3.rotorNumb) {
       fill(255, 0, 0);
       text("Error - You cannot use the same rotor twice. Please adjust", width/2, 50);
      }
    } else {
     plugBoard.show(); 
     sceneText = "Click bottom of the screen to return to Lightboard";
    }
  }
  
  void randomRotors() {
   int random1 = floor(random(5));
   int random2 = floor(random(5));
   while (random1 == random2) {
    random2 = floor(random(5)); 
   }
   int random3 = floor(random(5));
   while (random1 == random3 || random2 == random3) {
     random3 = floor(random(5));
     }
     setRotors(random1, random2, random3);
      
  }
  void randomiseRotorPosition() {
   setRotorsPosition(floor(random(26)), floor(random(26)), floor(random(26))); 
  }
  
  void click(int x, int y) {
    if (y > height * (9.0/10.0) && !enigma.plugBoard.plugMoving) {
     enigma.plugsVisible = !enigma.plugsVisible;
       boxSceneChange.play();
    }
    else {
     enigma.rotor1.click(x, y);
     enigma.rotor2.click(x, y);
     enigma.rotor3.click(x, y);
     enigma.plugBoard.click(x, y);
    }
  }
  
  char[] processedWord(char[]input) {
   char[] output = new char[input.length];
   for (int i = 0; i < input.length; i++) {
    output[i] = runEnigmaMachine(input[i]); 
   }
   return output;
  } 
}
