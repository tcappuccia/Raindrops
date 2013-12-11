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
  image(sky, width/2, height/2, width, height); //Creates sky backgroung image
  fill(0, 0, 100);
  textAlign(CENTER);
  textSize(50);
  text("Score: " + score, width/2, 50); //Gives the player a score at the top of the screen.
  textSize(20);
  text("Time: " + millis()/1000 + " seconds", width/2, 100);
  currentTime = millis();
  c1.display();
  c1.update();
  if (currentTime-oldTime >= 2000) { //This keeps track of the time and allows raindrops to fall at given inervals.
    if (index < drops.length) {
      index++;
    }
    oldTime = currentTime;
  }

  for (int i = 0; i < index; i++) { //This shows the shape (raindrop) and gives it its falling motion.
    drops[i].display();
    drops[i].fall();


    if (c1.Catch(drops[i]) == true) { //This boolean determines whether it is true or not, in the case in which it is true, the raindrop resets and the score increases.
      drops[i].reset();
      score++;
    }
  }
}

