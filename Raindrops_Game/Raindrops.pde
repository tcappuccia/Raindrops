class Raindrops {
  PVector loc, vel;
  int tailSize = 20;

  Raindrops() {
    colorMode(HSB, 360, 100, 100);
    strokeWeight(1);
    stroke(195,100,100);
       loc = new PVector(random(width),random(height));
    vel = new PVector(0, random(1,3));
  }

  void display() {
        fill(190, 100, 100);
    for (int i = tailSize; i > 0; i--) {
      ellipse(loc.x, loc.y-i, tailSize-i, tailSize-i);
    }
    loc.add(vel);
  }

  void fall() {
    loc.y+=vel.y;
    if (loc.y > height) {
      loc.y = 0;
    }
  }
}


