//Based on CodeBullet's video "Building an Enigma Machine" 
//https://www.youtube.com/watch?v=2D2bJWHvqJo
//
import processing.sound.*;
Light[] lettersBoard = new Light[26];
String letterOrderCapital = "QWERTYUIOPASDFGHJKLZXCVBNM";
String letterOrderLower = "qwertyuiopasdfghjklzxcvbnm";
String CipherToSolveUpper = "JWSQQXQWAKFRRYCWMMISKYSYC";
String CipherToSolveLower = "jwsqqxqwakfrrycwmmiskysyc";

String PlainText = "";
String CipherText = "";
boolean areCipherAndPlainVisible = true;
boolean isCipherSolved = false;
boolean isPlainSolved = false;

PImage lightSprite;
boolean isKeyPressed = false;

char keyDown;
char keyLight;
PImage backgroundAlternate;
SoundFile keyTypeNoise;
SoundFile rotorChange;
SoundFile wiringSet;
SoundFile boxSceneChange;
SoundFile cipherSolved;

Enigma enigma;

void setup() {
  frameRate(60);
  fullScreen();
  backgroundAlternate = loadImage("14865_Medium.jpg");
  for (int i = 0; i<lettersBoard.length; i++) {
   lettersBoard[i] = new Light(letterOrderCapital.charAt(i), i);
  }
  lightSprite = loadImage("light.png");
  enigma = new Enigma();  
  keyTypeNoise = new SoundFile(this,"380138__yottasounds__typewriter-single-key-type-1.wav");
  rotorChange = new SoundFile(this, "184438__capslok__cash-register-fake.wav");
  wiringSet = new SoundFile(this, "491079__extrafonia2__bad-contact-1.wav");
  boxSceneChange = new SoundFile(this, "364740__newagesoup__open-cardboard-box-compartment.wav");
  cipherSolved = new SoundFile(this, "413203__joepayne__clean-and-pompous-fanfare-trumpet.mp3");
  
  enigma = new Enigma();
  enigma.randomRotors();
  enigma.randomiseRotorPosition();
}

 void draw() {

  imageMode(CORNER);
  image(backgroundAlternate, 0, 0, width, height);
  enigma.show();
  text("Click bottom of the screen to show the Plugboard", width-500, height-100);
  if (!enigma.plugsVisible) {
   showPlainCipher(); 
  }
}

void mousePressed() {
  enigma.click(mouseX, mouseY);
}


void showPlainCipher() {
   text("Click bottom of the screen to show the Plugboard", width-500, height-100);
   text("Press escape key to close program", 200, 100);
   text( "Plain Text: " + PlainText, width/3, 400); //-- Commented out when solving 
   text( "Cipher Text: " + CipherText, (width/3)+500, 400); //-- Commented out when solving
   text("Use the images 'Rotor Configuration' and 'Plug Configuration' to set up the correct starting position, rotors and plug positions to solve my ciphertext.", width/2, (height/2)-100);
   if (isCipherSolved == true) {
     text("You have solved the cipher!", width/2, (height/2)-300);  
   }
   if (isPlainSolved == true) {
     text("You have solved the cipher!", width/2, (height/2)-300);  
   }
}

void keyPressed() {
  if (letterOrderLower.indexOf(key) != -1 && !isKeyPressed && !enigma.plugsVisible) {
   char output = enigma.runEnigmaMachine(key); 
   if (output == '1') {
    return; 
  }
  
  keyLight = output;
  lettersBoard[letterOrderLower.indexOf(output)].lightIsOn = true;
  isKeyPressed = true;
  keyDown = key;
  keyTypeNoise.play();
  PlainText = PlainText + key;
  CipherText = CipherText + output;
  clearCondition();
 
  }
  clearCondition();
}


void keyReleased() {
 if (letterOrderLower.indexOf(key) != -1 && key == keyDown) {
  lettersBoard[letterOrderLower.indexOf(keyLight)].lightIsOn = false;
  isKeyPressed = false;
    clearCondition();
 }
}

void clearCondition() {
 if (CipherText.equals("JWSQQXQWAKFRRYCWMMISKYSYC") == true || CipherText.equals("jwsqqxqwakfrrycwmmiskysyc") == true) {         
      isCipherSolved = true;
      cipherSolved.play();   
      println("Ciphersolved");
         text("You have solved the cipher!", width/2, (height/2)-200); 
  }
  if (CipherText.equals("THISCIPHERISADISAPPOINTED") == true || CipherText.equals("thiscipherisadisappointed") == true) {
         isPlainSolved = true;
      cipherSolved.play();   
      println("Ciphersolved");
         text("You have found the plaintext!", width/2, (height/2)-200); 
  }
}
