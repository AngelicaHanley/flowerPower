// Sydney Aurelius, Angelica Hanley, Brooke Nelson, Valerie Cabrera, Maiah Jaffa
import processing.sound.*;

// loading in all files (images, sounds, fonts)
SoundFile intro, gameSound, gameOverSound;
PImage mainScreen, title, usersManual, gameOver;
PImage tulip, sunflower, rose, flower, leafLeft, leafRight;
PImage evilSpider, evilCaterpillar, evilBee;
PImage bananas, waterDrop, sun;
PImage box4scores, playButton, instructionsButton, easyButton, normalButton, hardButton, tryAgainButton, exitButton, exitButton2, pauseButton;
PImage life1, life2, life3, life4, life5, bonusSpeed;

// initializing classes
Obstacle[] obstacle;
PowerUp[] powerUp;
Flower flowerClass;
soundEffect mySounds;
bckgrnd bckgrnd;
exitButton myExit;
exitButton levelsExit;
//exitButton pausedExit;
exitButton gameOverExit;

// declaring & initializing variables
PImage[] obs = new PImage[3];
PImage[] pu = new PImage[3];
float score;
float hEasy = 0;
float hNormal = 0;
float hHard = 0;
float highScore = 0;
float counter = 0;
int totalObstacles = 0;
int totalPowerUps = 0;
int screen = 0;
int flowerType;
int lives = 3;
String scoreLevel;
boolean playing;
boolean paused = false;
int pausedCounter = 0;
int pausedMouseX;
int pausedMouseY;

// setting up (loading images, creating arrays)
void setup() {
  size(1000, 600);
  // loading in all the main images used
  mainScreen = loadImage("mainbg.jpg");
  title = loadImage("title.png");
  usersManual = loadImage("usersManual.jpg");
  gameOver = loadImage("gameover.png");

  // loading in all obstacles and putting them into an obstacle array in order to randomly generate obstacles
  evilSpider = loadImage("evilspider.png");
  evilSpider.resize(75, 0);
  obs[0] = evilSpider;
  evilCaterpillar = loadImage("evilcaterpillar.png");
  evilCaterpillar.resize(75, 0);
  obs[1] = evilCaterpillar;
  evilBee = loadImage("evilbee.png");
  evilBee.resize(75, 0);
  obs[2] = evilBee;

  // loading in all powerups and putting them into an PowerUp array in order to randomly generate powerups
  bananas = loadImage("bananas.png");
  bananas.resize(75, 0);
  pu[0] = bananas;
  waterDrop = loadImage("water.png");
  waterDrop.resize(0, 60);
  pu[1] = waterDrop;
  sun = loadImage("sun.png");
  sun.resize(75, 0);
  pu[2] = sun;

  // loading in the leaves for the stem
  leafLeft = loadImage("leafLeft.png");
  leafRight = loadImage("leafRight.png");

  // loading in all the buttons used
  playButton = loadImage("playbutton.png");
  instructionsButton = loadImage("instructionsbutton.png");
  easyButton = loadImage("easybutton.png");
  easyButton.resize(200, 0);
  normalButton = loadImage("normalbutton.png");
  normalButton.resize(200, 0);
  hardButton = loadImage("hardbutton.png");
  hardButton.resize(200, 0);
  tryAgainButton = loadImage("tryagainbutton.png");
  exitButton = loadImage("exitbutton.png");
  exitButton.resize(100, 0);
  exitButton2 = loadImage("exitbutton2.png");
  exitButton2.resize(150, 0);
  pauseButton = loadImage("pausebutton.png");
  pauseButton.resize(200, 0);
  bonusSpeed = loadImage("bonusSpeed.png");

  // loading in sound files
  intro = new SoundFile(this, "intro.wav");
  gameSound = new SoundFile(this, "playing.wav");
  gameOverSound = new SoundFile(this, "goSound.wav");

  // obstacles, powerups, backgrounds, and exit buttons
  obstacle = new Obstacle[250];
  powerUp = new PowerUp[250];
  for (int i = 0; i < 250; i++) {
    obstacle[i] = new Obstacle(obs[(int)random(0, obs.length)]);
    obstacle[i].update(0);
    powerUp[i] = new PowerUp(pu[(int)random(0, pu.length)]);
    powerUp[i].update(0);
  }



  bckgrnd = new bckgrnd();
  myExit = new exitButton(0, 2, exitButton.height, exitButton.width, exitButton);
  levelsExit = new exitButton(0, height - exitButton.height-2, height - 2, exitButton.width, exitButton);
  //pausedExit =  new exitButton(0, height - exitButton.height-2, height - 2, exitButton.width, exitButton);
  gameOverExit = new exitButton(width/2-150, height/2 + 30, height/2 + 30
    + exitButton2.height, width/2-150 + exitButton2.width, exitButton2);

  // intro song to play
  intro.loop();

  gameSound.loop();
  gameSound.amp(0);

  gameOverSound.loop();
  gameOverSound.amp(0);
}

// This is where the magic happens!
void draw() {

  // which screen should be displayed
  if (screen == 0) {
    mainScreen();
  } else if (screen == 1) {
    levelScreen();
  }
  // restarts game without having other screens' code playing
  else if (screen == 5) {
    gameOver();
  } else if (screen == 2) {
    levels();
  } else if (screen == 3) {
    instructions();
  }
}

void mainScreen() {
  //resets the value of the array so the obstacles and powerups start at the tops
  for (int i = 0; i < obstacle.length; i++) {
    obstacle[i].reset(-200, -1200);
    powerUp[i].reset(-200, -1200);
  }
  //resetting the counter and the pause and play button
if(paused == true || paused == false){
  counter = 0;
  if (paused == true){
    paused = false;
  }
}
  gameOverSound.amp(0);
  image(mainScreen, 0, 0);

  // title
  image(title, width/2 - 255.5, 100);

  // button to press play and instructions
  image(playButton, width/2 + 45, height/2 + 115);
  image(instructionsButton, width/2 - instructionsButton.width + 20, height/2 + 115);

  // checking if play button is pressed and updates screen variable
  if ((mousePressed==true) && (mouseX>=width/2 + 45) && (mouseY>=height/2 + 115)
    && (mouseX<=width/2 + 45 + playButton.width) && (mouseY<=height/2+115 + playButton.height)) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 1;
    // checks if instructions button is pressed and updates screen variable
  } else if ((mousePressed==true) && (mouseX>=width/2 - instructionsButton.width + 20) && (mouseY>=height/2 + 115)
    && (mouseX<=width/2 + 20) && (mouseY<=height/2+115 + instructionsButton.height) && screen==0) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 3;
  }
}

void levelScreen() {
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
    screen = 2;
    flowerType = 2;
    // checks if button labeled "hard" is pressed
  } else if ((mousePressed==true) && (mouseX>=750-hardButton.width/2) &&
    (mouseY>= height/12+200) && (mouseX<=750+hardButton.width/2) &&
    (mouseY<=height/12 + hardButton.height+200)) {
    mySounds = new soundEffect();
    mySounds.playButton();
    screen = 2;
    flowerType = 3;
    // If "exit" button is pressed, then return to the main screen.
  } else {
    myExit.display();
  }
}

void levels() {
  // Loads in the background noise while playing.
  intro.amp(0);
  gameSound.amp(1);

  // This checks the amount of lives that the player currently has.
  checkLives();

  // Flower type and components of obstacle class are changed depending on which level button is pressed.

  // Easy mode
  if (flowerType == 1) {
    flower = loadImage("tulip.png");
    bckgrnd.scroll("sky1bg.jpg", paused);
    scoreLevel = "easy";

    // Normal mode
  } else if (flowerType == 2) {
    flower = loadImage("sunflower.png");
    bckgrnd.scroll("sky2bg.jpg", paused);
    scoreLevel = "normal";

    // Hard mode
  } else if (flowerType == 3) {
    flower = loadImage("rose.png");
    bckgrnd.scroll("sky3bg.jpg", paused);
    scoreLevel = "hard";
  }
  if (paused == false) {
    flowerClass = new Flower(flower.width, flower.height);
    flowerClass.draw(mouseX, mouseY,flower, leafLeft, leafRight);
    flowerClass.setLocation(mouseX - flower.width/2, mouseY - 20 - flower.height);
    
    pausedMouseX = mouseX;
    pausedMouseY = mouseY;
    
  } else {
    flowerClass = new Flower(flower.width, flower.height);
    flowerClass.draw(pausedMouseX, pausedMouseY,flower, leafLeft, leafRight);
    flowerClass.setLocation(pausedMouseX - flower.width/2, pausedMouseY - 20 - flower.height);
  }
  // Increment totalObstacles
  if (totalObstacles < obstacle.length - 1) {
    totalObstacles ++ ;
  }

  // Increment totalPowerUps
  if (totalPowerUps < powerUp.length - 1) {
    totalPowerUps ++ ;
  }

  // The i value here determines how many obstacles are onscreen. The more you add to i,
  // the less obstacles will be onscreen.
  for (int i = 0; i < totalObstacles; i = i+35) {
    if (scoreLevel == "easy") {
      if (paused == true) {
        obstacle[i].pause(paused);
      } else {
        obstacle[i].update(7);
      }
    } else if (scoreLevel == "normal") {
      if (paused == true) {
        obstacle[i].pause(paused);
      } else {
        obstacle[i].update(10);
      }
    } else if (scoreLevel == "hard") {
      if (paused == true) {
        obstacle[i].pause(paused);
      } else {
        obstacle[i].update(13);
      }
    }
    obstacle[i].move();
    obstacle[i].display();

    // if an obstacle is hit
    if (flowerClass.intersect(obstacle[i])) {
      mySounds = new soundEffect();
      mySounds.playError();
      if (paused == false) {
        obstacle[i].caught();
        lives--; // subtracts a life
      }
    }
  }

  // Spawns powerUps, which are less frequent than obstacles. This makes the game more difficult.
  for (int i = 0; i < totalPowerUps; i = i+85) {
    if (scoreLevel == "easy") {
      if (paused == true) {
        powerUp[i].pause(paused);
      } else {
        powerUp[i].update(3);
      }
    } else if (scoreLevel == "normal") {
      if (paused == true) {
        powerUp[i].pause(paused);
      } else {
        powerUp[i].update(7);
      }
    } else if (scoreLevel == "hard") {
      if (paused == true) {
        powerUp[i].pause(paused);
      } else {
        powerUp[i].update(11);
      }
    }
    powerUp[i].move();
    powerUp[i].display();
    
    if (paused == true) {
      image(pauseButton, width/2 - pauseButton.width/2, height/2 - pauseButton.height/2);
    }
    
    if (flowerClass.intersectPu(powerUp[i])) {
      mySounds = new soundEffect();
      mySounds.playYay();
      if (paused == false) {
        powerUp[i].caught();

        // max lives is five
        if (lives < 5) {
          lives++; // add a life
        }
      }
    }
  }
 
  loadLives();
  checkLives();

  score(paused);

  // Displays the exit button on the level screen.
  levelsExit.display();
  
}

// Checks the number of lives and displays accordingly
// Loads a gray heart to represent a life lost
void checkLives() {
  if (lives == 2) {
    life3.filter(GRAY);
    image(life1, 943, 10);
    image(life2, 883, 10);
    image(life3, 823, 10);
  }
  if (lives == 1) {
    life3.filter(GRAY);
    image(life3, 823, 10);
    life2.filter(GRAY);
    image(life2, 883, 10);
    image(life1, 943, 10);
  }
  if (lives == 0) {
    life3.filter(GRAY);
    image(life3, 823, 10);
    life2.filter(GRAY);
    image(life2, 883, 10);
    life1.filter(GRAY);
    image(life1, 943, 10);

    // implement restart functionality
    screen = 5;
  }

  // lives 4 and 5 are purple bc they are ~special~
  if (lives == 4) {
     image(life4, 763, 10);
  }
  if (lives == 5) {
    if(paused == false){
      counter+=1.0;
    } 
    image(life5, 703, 10);
    image(life4, 763, 10);

 
      image(bonusSpeed, 680, 50);
    
  }
}

// instructions screen
void instructions() {
  image(usersManual, 0, 0);
  usersManual.resize(1000, 600);
  // Displays the exit button on the instructions screen.
  myExit.display();
}

// calculates the score and displays it
void score(boolean paused) {
  textAlign(CORNER);
  //each time this is called, increment the counter and divide it by a high number to get an accurate score
  if (paused == false) {
    counter ++;
  }
  score = counter/250.0;

  //check to see if a new high score has been produced/ produces a high score
  if (scoreLevel == "easy") {
    highScore = highScoreEasy(score);
  } else if (scoreLevel == "normal") {
    highScore = highScoreNormal(score);
  } else {
    highScore = highScoreHard(score);
  }

  // high score counter
  box4scores = loadImage("box4scores.png");
  box4scores.resize(0, 110);
  image(box4scores, 5, 5);
  fill(#FFD8E5);
  PFont font = loadFont("Starborn-18.vlw");
  textFont(font);
  text("HIGH SCORE: ", 30, 32);
  // nf sets the float value to always produce to the 100th place (decimal)
  text(nf(highScore, 0, 2) + " ft.", 30, 52);
  text("SCORE: ", 30, 82);
  text(nf(score, 0, 2) + " ft.", 30, 102);
  textSize(30);
  textAlign(CENTER);
  if (score >= 5 && score < 5.40) {
    fill(255);
    text("Keep going, 5 ft so far!", width/2 + 1, 70);
    fill(#FF679A);
    text("Keep going, 5 ft so far!", width/2, 70);
  } else if (score >= 10 && score < 10.40) {
    fill(255);
    text("Wow, 10 ft Already!", width/2+1, 70);
    fill(#FF679A);
    text("Wow, 10 ft Already!", width/2, 70);
  } else if (score >= 25 && score < 25.40) {
    fill(255);
    text("Great job, 25 ft!", width/2+1, 70);
    fill(#FF679A);
    text("Great job, 25 ft!", width/2, 70);
  } else if (score >= 50 && score < 50.40) {
    fill(255);
    text("INSANE, you are at 50 ft!", width/2+1, 70);
    fill(#FF679A);
    text("INSANE, you are at 50 ft!", width/2, 70);
  } else if (score >= 100 && score < 100.40) {
    fill(255);
    text("LEGENDARY, you are at 100 ft!", width/2 + 1, 70);
    fill(#FF679A);
    text("LEGENDARY, you are at 100 ft!", width/2, 70);
  }
}

// loads hearts to represent lives
void loadLives() {
  
  life1 = loadImage("life.png");
  life2 = loadImage("life.png");
  life3 = loadImage("life.png");
  life4 = loadImage("life2.png");
  life5 = loadImage("life2.png");
  image(life1, 943, 10);
  image(life2, 883, 10);
  image(life3, 823, 10);
}

float highScoreEasy(float currScore) {
  // checks the new score with the stored highest score
  if (currScore > hEasy) {
    hEasy = currScore;
  }
  //returns the highest score value
  return hEasy;
}

float highScoreNormal(float currScore) {
  // checks the new score with the stored highest score
  if (currScore > hNormal) {
    hNormal = currScore;
  }
  //returns the highest score value
  return hNormal;
}

float highScoreHard(float currScore) {
  // checks the new score with the stored highest score
  if (currScore > hHard) {
    hHard = currScore;
  }
  //returns the highest score value
  return hHard;
}

//implements game over features
void gameOver() {

  if (flowerType == 1) {
    bckgrnd.scroll("sky1bg.jpg", paused);
  } else if (flowerType == 2) {
    bckgrnd.scroll("sky2bg.jpg", paused);
  } else if (flowerType == 3) {
    bckgrnd.scroll("sky3bg.jpg", paused);
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
    screen = 2;
    mySounds = new soundEffect();
    mySounds.playButton();
    exitButton.resize(100, 0);
    gameSound.amp(0);
    gameOverSound.amp(0);
    intro.amp(1);
  }
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }
}
