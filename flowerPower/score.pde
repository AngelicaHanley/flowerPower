// calculates the score and displays it
class score{
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
  
score() {
  }

void display() {
  
  
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
    fill(#FF679A);
  if (score >= 5 && score < 5.40) {
  //    fill(#FFD8E5);
    text("Keep going, 5 ft so far!", width/2, 70);
  } else if (score >= 10 && score < 10.40) {
    text("Wow, 10 ft already!", width/2, 70);
  } else if (score >= 25 && score < 25.40) {
    text("Great job, 25 ft!", width/2, 70);
  } else if (score >= 50 && score < 50.40) {
    text("INSANE, you are at 50 ft!", width/2, 70);
  }
   else if (score >= 100 && score < 100.40) {
    text("LEGENDARY, you are at 100 ft!", width/2, 70);
  }
}
}
