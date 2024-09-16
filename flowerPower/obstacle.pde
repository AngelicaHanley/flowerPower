//This code is based on the learning processing game, rain catcher
//link: http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game

class Obstacle {
  float r; //Obstacle radius
  float x, y; //Obstacle location
  float speed; //Obstacle speed
  int obstacle = 1;
  PImage evil;

  //loads in all the data needed for the obstacles
  Obstacle(PImage image) {
    evil = image;
    r = image.width/2;
    x = random(25, 975) - image.width/2;
    y = -50.0 - image.width/2;
  }

  //Move obstacles
  void move() {
    //Increment by speed
    y += speed;
    if (y > height + r*4){
      y = random(-250, -150);
       x = random(25, 975) - r;
    }
    
  }

 boolean reachedBottom() {
    // If we go a little beyond the bottom
   //will remove the image from the screen if its no longer being displayed
    if (y > height + r*4){ 
      return true;
    } else {
      return false;
    }
 }

  //places the image on the screen
  void display() {
    for (int i = 2; i < r; i++ ) {
      image(evil, x, y);
    }
    
  }

  //if the flower intercepts with the obstacles
  void caught() {
    // Stop it from moving by setting speed equal to zero
   // speed = 0; 
    // Set the location to somewhere way off-screen
    y = -500;
  }
  void reset(float high, float low){
    y = random(low, high);
  }
  void update(float newSpeed){
    speed = newSpeed;
  }
  void pause(boolean paused){
    if(paused){
      speed = 0;
    }
  }
    
}    
  
