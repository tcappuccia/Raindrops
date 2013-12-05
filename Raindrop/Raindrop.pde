Raindrops [] rain = new Raindrops [10];
int oldTime,currentTime;
int index;

void setup() {
  size(500, 600);
  for (int i = 0; i < rain.length; i++) {
    rain[i] = new Raindrops();
  }
    colorMode(HSB, 360, 100, 100);
}

void draw() {
  currentTime = millis();
  background(0);
  for (int i = 0; i < index; i++) {
    rain[i].display();
    rain[i].fall();
  }
  if(index<rain.length){
    index++;
  }
}

