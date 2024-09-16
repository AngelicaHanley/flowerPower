class levelScreen{
  
levelScreen(){
}
  
void display() {
  gameOverSound.amp(0);
  // new screen where you choose the difficulty mode and buttons for levels
  image(mainScreen, 0, 0);

  // levels easy, normal, and hard buttons
  image(easyButton, width/4 - easyButton.width/2, height/12 + 200);
  image(normalButton, width/2 - normalButton.width/2, height/12 + 200);
  image(hardButton, 750 - hardButton.width/2, height/12 + 200);

  // checks if button labeled "easy" is pressed
  if ((mousePressed==true) && (mouseX>=width/4 - easyButton.width/2) &&
    (mouseY>= height/12 + 200) && (mouseX<=width/4+easyButton.width/2) && (mouseY<=height/12 + 200 + easyButton.height)) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 2;
    flowerType = 1;
    // checks if button labeled "normal" is pressed
  } else if ((mousePressed==true) && (mouseX>=width/2-normalButton.width/2) &&
    (mouseY>= height/12+200) && (mouseX<=width/2+normalButton.width/2) &&
    (mouseY<=height/12 + normalButton.height+200)) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 3;
    flowerType = 2;
    // checks if button labeled "hard" is pressed
  } else if ((mousePressed==true) && (mouseX>=750-hardButton.width/2) &&
    (mouseY>= height/12+200) && (mouseX<=750+hardButton.width/2) &&
    (mouseY<=height/12 + hardButton.height+200)) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 4;
   flowerType = 3;
    // If "exit" button is pressed, then return to the main screen.
  } else {
    myExit.display();
  }
}
}
