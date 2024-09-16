// This code is based on the learning processing game, rain catcher. 
// link: http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game

class PowerUp {
  float r; // Obstacle radius
  float x, y; // Obstacle location
  float speed; // Obstacle speed
  int obstacle = 1;
  PImage good;

  // Loads in all the data needed for the powerups.
  PowerUp(PImage image) {
    good = image;
    r = image.width/2;
    x = random(100, 900) - image.width/2;
    y = -50.0 - image.width/2;
  }

  // Move powerups
  void move() {
    // Increment by speed
    y += speed;
    if (y > height + r*4){
     y = random(-250, -150);
       x = random(100, 900) - r;
    }
  }

 boolean reachedBottom() {
   // If we go a little beyond the bottom.
   // This will get rid of the image if it goes beyond the bottom of the screen.
    if (y > height + r*4) {
     
      return true;
    } else {
      return false;
    }
 }

  // This function moves the powerups down the screen.
  void display() {
    for (int i = 2; i < r; i++ ) {
      image(good, x, y);
    }
    
  }
  // If the flower intercepts with the powerup...
  void caught() {
    // The powerup stops moving by setting speed equal to zero...
   // speed = 0; 
    // and is set to somewhere way off-screen
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
