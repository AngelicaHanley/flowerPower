class levels {
String flower;
String background;
//int flowerType;
PImage newflower;
float pausedMouseX;
float pausedMouseY;
  
levels(String iflower, String ibackground) {
flower = iflower;  
background = ibackground;
//flowerType = iflowerType;     
}


void display(){
paused = false;
//bckgrnd. 
  
newflower = loadImage(flower);
//bckgrnd.scroll(background);
 
 // Loads in the background noise while playing.
  intro.amp(0);
  gameSound.amp(1);

  // This checks the amount of lives that the player currently has.
  //checkLives(paused);
//  myLives.checkLives();

  // Flower type and components of obstacle class are changed depending on which level button is pressed.

  // Easy mode
  if (flowerType == 1) {
    
    scoreLevel = "easy";

    // Normal mode
  } else if (flowerType == 2) {

    scoreLevel = "normal";

    // Hard mode
  } else if (flowerType == 3) {

    scoreLevel = "hard";
  }

  stroke(59, 142, 65);
  strokeWeight(8);
  noFill();
  if (paused == false) {
    stroke(59, 142, 65);
    strokeWeight(8);
    noFill();

    // Stem for gameplay. It moves as the flower moves.
    beginShape();
    curveVertex(mouseX - 10, mouseY); // first control point
    curveVertex(mouseX - 10, mouseY);
    curveVertex((mouseX + 0.75*width)/2 - 75, mouseY + (height - mouseY)/4);
    curveVertex(0.5*mouseX + 200, mouseY + 3*(height - mouseY)/4);
    curveVertex(width/2, height);
    curveVertex(width/2, height); // final control point
    endShape();

    image(leafRight, (mouseX + 0.75*width)/2 - 72, mouseY - 35 + (height - mouseY)/4);
    image(leafLeft, 0.5*mouseX + 155, mouseY - 40 + 3*(height - mouseY)/4);

    // Flower for gameplay. The mouseX and mouseY move the flower.
    pushMatrix();
    image(newflower, mouseX - newflower.width/2, mouseY - 20 - newflower.height/2);
    popMatrix();

    flowerClass = new Flower(newflower.width, newflower.height);
    flowerClass.setLocation(mouseX - newflower.width/2, mouseY - 20 - newflower.height);

    pausedMouseX = mouseX;
    pausedMouseY = mouseY;
  } else {
    stroke(59, 142, 65);
    strokeWeight(8);
    noFill();

    // Stem for gameplay. It moves as the flower moves.
    beginShape();
    curveVertex(pausedMouseX - 10, pausedMouseY); // first control point
    curveVertex(pausedMouseX - 10, pausedMouseY);
    curveVertex((pausedMouseX + 0.75*width)/2 - 75, pausedMouseY + (height - pausedMouseY)/4);
    curveVertex(0.5*pausedMouseX + 200, pausedMouseY + 3*(height - pausedMouseY)/4);
    curveVertex(width/2, height);
    curveVertex(width/2, height); // final control point
    endShape();

    image(leafRight, (pausedMouseX + 0.75*width)/2 - 72, pausedMouseY - 35 + (height - pausedMouseY)/4);
    image(leafLeft, 0.5*pausedMouseX + 155, pausedMouseY - 40 + 3*(height - pausedMouseY)/4);

    // Flower for gameplay. The mouseX and mouseY move the flower.
    pushMatrix();
    image(newflower, pausedMouseX - newflower.width/2, pausedMouseY - 20 - newflower.height/2);
    popMatrix();

    flowerClass = new Flower(newflower.width, newflower.height);
    flowerClass.setLocation(pausedMouseX - newflower.width/2, pausedMouseY - 20 - newflower.height);
  }

  //bckgrnd.bgObstacles(); 
  //bckgrnd.bgPowerUps();
  
     if (paused == true) {
      image(pauseButton, width/2 - pauseButton.width/2, height/2 - pauseButton.height/2);
    }

  // Loads in and checks lives.
 // myLives.loadLives();
  //checkLives(paused);
//  myLives.checkLives();

  // Displays the score.
// myScore.display();
//idk fix code
//  myScore.display();

  // Displays the exit button on the level screen.
  levelsExit.display();
 
//bckgrnd. 
}

//implements game over features
void gameOver() {
//bckgrnd. 
  if (flowerType == 1) {
 //   bckgrnd.scroll("sky1bg.jpg");
  } else if (flowerType == 2) {
//    bckgrnd.scroll("sky2bg.jpg");
  } else if (flowerType == 3) {
 //   bckgrnd.scroll("sky3bg.jpg");
  }

  // Loads in the game over images and game over sounds.
  image(gameOver, width/8+20, height/3-30);
  counter = 0;
  gameSound.amp(0);
  gameOverSound.amp(1);

  // Displays the exit button on the game over screen.
  gameOverExit.display();
  lives = 3;

  // Displays the try again button on the game over screen.
  tryAgainButton.resize(165, 0);
  image(tryAgainButton, width/2-150 + exitButton2.width + 25, height/2 + 31);

  // checks if try again button is pressed
  if ((mousePressed == true) && (mouseX >= width/2-150 + exitButton2.width + 25)
    && (mouseX <= width/2-150 + exitButton2.width + 25 + tryAgainButton.width) &&
    (mouseY >= height/2 + 30) && (mouseY <= height/2 + 30 + tryAgainButton.height)) {
 for (int i = 0; i < totalObstacles; i++) {
      obstacle[i].reset(-300, -1200);
    }
    for (int i = 0; i < totalPowerUps; i++) {
      powerUp[i].reset(-300, -1200);
    }
  if (flowerType == 1) {
    screen = 2;
  } else if (flowerType == 2) {
    screen = 3;
  } else if (flowerType == 3) {
    screen = 4;
  }
    mySounds = new soundEffect();
    mySounds.playButton();
    exitButton.resize(100, 0);
    gameSound.amp(0);
    gameOverSound.amp(0);
    intro.amp(1);
  }
}

}
