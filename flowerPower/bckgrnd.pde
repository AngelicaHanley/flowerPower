class bckgrnd {

  // This sets the y position of the background images to 0, and we will increment it upwards in a moment.
  float yposb = 0;
  float level = 0;
  PImage bg;

  // This is a constructor that loads the background function in the flowerPower pde.
  bckgrnd() {
  }

  // The scroll function increments the y position of the background images by adding to it.
  // This makes the backgrounds scroll continuously throughout the levels.
  void scroll(String bgImage, boolean paused) {
    
    bg = loadImage(bgImage);

    //This loads in 2 of the background images and sets them exactly 600 pixels apart.
    image(bg, 0, yposb);
    image(bg, 0, yposb-bg.height);

    //changing the speed according to the levels' difficulty
    if (bgImage == "sky1bg.jpg") {
      level = 2;
    } else if (bgImage == "sky2bg.jpg") {
      level = 5;
    } else {
      level = 10;
    }

if (paused == false){
    yposb = yposb+level;


    // If the y position reaches 600+, then the position is set back to 0.
    if (yposb > bg.height) {
      yposb = 0;
    }
}
  }
}
