/*
//Readme and Set Up Instructions:
//For this program's sound file to work, you will need to install the Processing Library titled 'Sound' -
//This can be found in "Sketch > Import Library > Manage Libraries..." 
//References and sources used:
//Based on CodeBullet's video "Building an Enigma Machine" 
//https://www.youtube.com/watch?v=2D2bJWHvqJo
//<a href="https://www.freepik.com/free-photo/wooden-textured-background_2768392.htm#query=wood%20texture&position=0&from_view=keyword&track=ais&uuid=c4a7ed76-ea0d-4011-89ef-bf0e50f48007">Image by rawpixel.com</a> on Freepik
//https://freesound.org/people/yottasounds/sounds/380138/ - Typewriter sounds used under Public Domain Licensing.
//https://freesound.org/people/fleurescence/sounds/573132/ - Snowboard strap sound used for rotor change SFX - used under Public Domain Licensing
//https://freesound.org/people/extrafonia2/sounds/491079/ - Electricity Contact sound - Used under Public Domain Licensing
//https://freesound.org/people/newagesoup/sounds/364740/ - Box SFX - Used under Public Domain Licensing
//https://freesound.org/people/joepayne/sounds/413203/ - Fanfare SFX - Used under Public Domain Licensing
//Link to https://processing.org/download - for downloading the program to code and run this program for assessing.

//This document contains the ciphertext to solve the plaintext and vice-versa. 

//Ciphertext: "JWSQQXQWAKFRRYCWMMISKYSYC"
//Plaintext:  "THISCIPHERISADISAPPOINTED"

//Rotor Configuration:
    //II-IV-V
    
//Starting Position  
      5 1 14

//Plug Configuration
    Q-Y
    R-W
    E-N
    T-G
    O-J
    P-C
    A-F
    H-V
    K-X
    Z-B

//Number to Alphabet:
    1=A
    2=B
    3=C
    D=4
    E=5
    F=6
    G=7
    H=8
    I=9
    J=10
    K=11
    L=12
    M=13
    N=14
    O=15
    P=16
    Q=17
    R=18
    S=19
    T=20
    U=21
    V=22
    W=23
    X=24
    Y=25
    Z=26
*/


/*

====Instructions===
Step 1: Set the Rotors to the Specified Rotors: II - IV - V by clicking on the numbers above the rotors. If you have two of the same rotors, please adjust.
Step 2: Set the Starting Positions to 5 - 1 - 14 by clicking on the rotors until you get the required starting position.
Step 3: Click on the bottom of the screen to open the Plugboard scene.
Step 4: Arrange the Plugs by clicking and dragging the 10 Plugs into this specific order:
    Q-Y
    R-W
    E-N
    T-G
    O-J
    P-C
    A-F
    H-V
    K-X
    Z-B
  
  Use the attached screenshots  "Rotor_Configuration_" and "Plug_Configuration_" as references to ensure you have the required settings.
  
Step 5: To solve the Ciphertext, type into the keyboard using the Plaintext provided "THISCIPHERISADISAPPOINTED". You can write this down as a visual aid to ensure your input is correct.

Step 6: To solve the Plaintext, set the Rotors to the exact same specifications and the same Plugboard settings, and this time type in the Ciphertext "JWSQQXQWAKFRRYCWMMISKYSYC"

Successful completion is identified when you have correctly inputted either the ciphertext or plaintext as exactly specified. If you make a mistake, press the Escape key to close the window, and start again.

*/
