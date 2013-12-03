color c;
int oldTime;
void setup() {
  size(100, 100);
  colorMode(HSB, 360, 100, 100);
  c=color(random(360), 100, 100);
}

void draw() {
  background(c);
  if (millis()-oldTime > 2000) {
    c = color(random(360), 100, 100);
    oldTime = millis();
  }
  textAlign(CENTER);
  textSize(50);
  stroke(0);
  text(millis()/1000,width/2,height/2);
}

