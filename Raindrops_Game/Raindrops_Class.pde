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

  //This function gives the raindrop a falling moion.
  void fall() {
    loc.y+=vel.y;
    if (loc.y > height) { //This resets the raindrop so that once it is off the screen it begins off at the top of the screen again.
      loc.y = 0;
    }
  }
  void reset() {
    loc.set(mouseX, height+2*tailSize);
  }
}

