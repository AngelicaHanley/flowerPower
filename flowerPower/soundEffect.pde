// These effects are called while in the draw function, so if they aren't placed
// in a class with its own function, the sound will be really bad.
class soundEffect {

  SoundFile button;
  SoundFile error;
  SoundFile yay;

  // loading in the sound files
  soundEffect() {
    button = new SoundFile(flowerPower.this, "click.wav");
    error = new SoundFile(flowerPower.this, "error.wav");
    yay = new SoundFile(flowerPower.this, "yay.wav");
  }

  // play the button click sound
  void playButton() {
    button.play();
  }
  // play the error sound
  void playError() {
    error.play();
  }
  // play the powerup sound
  void playYay() {
    yay.play();
  }
}
