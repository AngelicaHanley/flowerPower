class Flower {
  float w, h, x, y;

  // setting values from the flowerPower.pde
  Flower(float tempWidth, float tempHeight) {
    w = tempWidth;
    h = tempHeight;
  }

  // setting values from the flowerPower.pde
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  //checks to see if the flower runs into an obstacle
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < w/6 + o.r){
      return true;
    } else {
      return false;
    }
  }

  // checks to see if the flower runs into a powerup
  boolean intersectPu(PowerUp p) {
    float distance = dist(x, y, p.x, p.y);
    if (distance < w/2 + p.r ) {
      return true;
    } else {
      return false;
    }
  }

  void draw(int x, int y, PImage flower, PImage leafL, PImage leafR){
    stroke(59, 142, 65);
    strokeWeight(8);
    noFill();

    // Stem for gameplay. It moves as the flower moves.
    beginShape();
    curveVertex(x - 10, y); // first control point
    curveVertex(x - 10, y);
    curveVertex((x + 0.75*width)/2 - 75, y + (height - y)/4);
    curveVertex(0.5 * x + 200, y + 3*(height - y)/4);
    curveVertex(width/2, height);
    curveVertex(width/2, height); // final control point
    endShape();

    image(leafR, (x + 0.75*width)/2 - 72, y - 35 + (height - y)/4);
    image(leafL, 0.5 * x + 155, y - 40 + 3*(height - y)/4);

    // Flower for gameplay. The mouseX and mouseY move the flower.
    pushMatrix();
    image(flower, x - flower.width/2, y - 20 - flower.height/2);
    popMatrix();
  }

}
