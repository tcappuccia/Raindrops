class Catcher {
  PVector loc;
  int d;

  Catcher() {
    colorMode(HSB, 360, 100, 100);
    d=50;
    loc = new PVector(mouseX, height-d);
  }

  void display() {
    noStroke();
    fill(0, 50, 20);
    ellipse(mouseX, loc.y, d, d);
  }

  void reset() {
    loc.set(mouseX, height-d);
  }

  void Catch() {
    if (loc.dist(raindrops.loc) < d) {
      raindrops.loc.set( - width, height*10);
      drop.vel.set(0, 0);
    }
  }
}
