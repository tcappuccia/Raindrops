class Catcher {
  PVector loc;
  int d;
  PImage basket;

  Catcher() {
    colorMode(HSB, 360, 100, 100);
    d=70;
    loc = new PVector(mouseX, height-d);
    basket = loadImage("Basket.png");
  }

  void display() {  //displays the catcher.
    noStroke();
    fill(0, 50, 20);
    imageMode(CENTER);
    image(basket, loc.x, loc.y, d, d);
  }

  //This allows the catcher to follow the mouse.
  void update() {
    loc.set(mouseX, height-d);
  }

  //This boolean determines whether or not the raindrop is caught. If the return is true, then it is caught. If the return is false, then it is not caught.
  boolean Catch(Raindrops drops) {
    if (loc.dist(drops.loc) < d/2 + drops.tailSize/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

