Raindrops[] raindrops;
Catcher catcher;

void setup() {
  size(600, 600);
  raindrops = new Raindrops[100];
  for (int i=0; i < raindrops.length; i++) {
    raindrops[i] = new Raindrops();
    catcher = new Catcher();
  }
}
void draw() {
  background(0);
   for (int i = 0; i < raindrops.length; i++) {
    raindrops[i].display();
    raindrops[i].fall();
    catcher.display();
  } 
}

