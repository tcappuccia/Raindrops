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
    if (start == true) {
      if (score >= 0 && score < 5) {
        vel = new PVector(0, random(0.5, 1.25));
      }
      if (score >= 5) { //if the score is greater than or equal to 5, the speed increases between the set numbers.
        vel = new PVector(0, random(1.5, 2));
      }
      if (score >= 10) { //if the score is greater than or equal to 10, the speed increases between the set numbers.
        vel = new PVector(0, random(2.25, 3));
        if (score == 10 || score == 11 || score == 12 || score == 13 || score == 14 || score == 15 && stop == false) {
          fill(0);
          rect(20, 250, 550, 100);
          fill(0, 100, 100);
          textSize(30);
          text("Warning: Game is About To Intensify!", width/2, height/2);
        }
      }
      if (score >= 15) { //if the score is greater than or equal to 15, the speed increases between the set numbers.
        vel = new PVector(0, random(3.25, 4));
      }
    }
  }
  //This function makes the raindrops go off the screen once caught.
  void reset() {
    loc.set(mouseX, -height+2*tailSize*2);
    vel.set(0, 0);
  }

  //relates to the lives that you have in the game.
  void dead() {
    if (loc.y >= height ) {
      die--; 
      reset();
    }
  }
}

