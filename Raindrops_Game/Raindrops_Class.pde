class Raindrops {
  PVector loc, vel;
  int tailSize = 20;

  Raindrops() {
    colorMode(HSB, 360, 100, 100);
    strokeWeight(1);
    stroke(195, 100, 100);
    loc = new PVector(random(width), -tailSize);
    vel = new PVector(0, random(1, 2));
  }

  /* 
   This function creates the raindrop. It is composed of an ellipse with a tail.
   The tail is created using the tailSize variable and he for loop.
   */
  void display() {
    fill(190, 100, 100);
    for (int i = tailSize; i > 0; i--) { //This for loop creates the raindrop shape.
      ellipse(loc.x, loc.y-i, tailSize-i, tailSize-i);
    }
    loc.add(vel); //This gives the raindrop a velocity.
  }

  //This function gives the raindrop a falling motion.
  void fall() {
    loc.y+=vel.y;
  }
  //This function makes the raindrops go off the screen once caught.
  void reset() {
    loc.set(mouseX, height+2*tailSize);
  }
}

