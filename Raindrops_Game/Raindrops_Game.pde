Raindrops[] drops;
Catcher c1;
int oldTime, currentTime, index;
int score = 0;
PImage sky;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(600, 600);
  sky = loadImage("Sky.jpg");
  drops = new Raindrops[100];
  for (int i=0; i < drops.length; i++) {
    drops[i] = new Raindrops();
    c1 = new Catcher();
  }
}

void draw() {
  background(0);
  imageMode(CENTER);
   image(sky,width/2, height/2,width,height);
  fill(0, 0, 100);
  textAlign(CENTER);
  textSize(50);
  text("Score: " + score, width/2, 50);
  currentTime = millis();
  c1.display();
  c1.update();
  if (currentTime-oldTime >= 2000) {
    if (index < drops.length) {
      index++;
    }
    oldTime = currentTime;
  }
  for (int i = 0; i < index; i++) {
    drops[i].display();
    drops[i].fall();

    if (c1.Catch(drops[i]) == true) {
      drops[i].reset();
      score++;
    }
  }
}

