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


  boolean Catch(Raindrops drops) {
    if (loc.dist(drops.loc) < d/2 + drops.tailSize/2) {
      return true;
    }
    else {
      return false;
    }
  }
}
<<<<<<< HEAD
=======

>>>>>>> fixed some issues
