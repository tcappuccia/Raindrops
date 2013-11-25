class Catcher {
  PVector loc;
  int x;

  catcher(float 1) {
    x=50;
    loc =new PVector(mouseX, height-x);
  }
  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }
}

