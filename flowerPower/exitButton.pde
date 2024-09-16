class exitButton {
int exitX;
int exitY;
int newHeight;
int newWidth;
PImage exitType;

  // initializing values
  exitButton(int iexitX, int iexitY, int inewHeight, int inewWidth, PImage iexitType) {
exitX = iexitX;
exitY = iexitY;
newHeight = inewHeight;
newWidth = inewWidth;
exitType = iexitType;
  }

// exit button functionailty 
void display(){
  image(exitType, exitX, exitY);
  //if the exit button is pressed
   if ((mousePressed == true) && (mouseX >= exitX) && (mouseX <= newWidth) &&
    (mouseY >= exitY) && (mouseY <= newHeight)) {
     //go back to the main screen
    screen = 0;

     // change the sounds so the right sound is playing
  gameSound.amp(0);
      intro.amp(1);

    // plays the click sound when the exit button is pressed
    mySounds = new soundEffect();
    mySounds.playButton();

    // resets data
    exitButton.resize(100, 0); 
    lives=3;
  }
}
}
