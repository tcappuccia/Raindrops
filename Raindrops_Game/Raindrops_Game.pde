Raindrops[] drops;
Catcher c1;
int oldTime, currentTime, index;
int score = 0;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(600, 600);
  drops = new Raindrops[100];
  for (int i=0; i < drops.length; i++) {
    drops[i] = new Raindrops();
    c1 = new Catcher();
  }
}

void draw() {
  text(score,width/2, 50);
  currentTime = millis();
  background(0);
  for (int i = 0; i < drops.length; i++) {
    drops[i].display();
    drops[i].fall();
    c1.display();
  } 
  if (index < drops.length) {
    index++;
  }
}

