Raindrops[] drops = new Raindrops[100];
Catcher c1;
int oldTime, currentTime, startTime, index;
int score = 0;
int rx;
int ry;
int die;
float t;
PImage sky, life1;
boolean start;
boolean stop;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(600, 600);
  rx = width/2 - 50;
  ry = height/2 - 100;
  die = 3;
  t = 2;
  sky = loadImage("Sky.jpg");
  life1 = loadImage("heart.png");

  for (int i=0; i < drops.length; i++) { //calls the raindrops into existence.
    drops[i] = new Raindrops();
  }

  c1 = new Catcher(); //calls the catcher into existence.
  start = false;
  stop = false;
}

void draw() {
  //starting screen
  background(0);
  textAlign(CENTER);
  textSize(30);
  fill(0, 0, 100);
  text("Press The Button To Start The Game", width/2, height/2 + 150);  //This is the text that displays on the startup screen.
  println(die); //checks that the lives are properly functioning in the game.

  //start button
  fill(100, 100, 100);
  rect(rx, ry, 100, 100);
  textSize(15);
  fill(0, 0, 100);
  text("Game Objective: Catch as many raindrops as you can before time runs out.", width/2, height - 100);
  textSize(25);
  text("Good Luck!", width/2, height - 50);
  fill(0);
  textSize(15);
  text("Start Game", rx + 50, ry + 50);

  if (mousePressed && mouseX > rx && mouseX < rx + 100 && mouseY < ry + 100 && mouseY > ry) { //This boolean determines whether he game should begin or not.
    start=true;
    startTime = millis()/1000;
    oldTime = startTime;
  }

  //When the boolean is true, the game begins.

  if (start == true) {

    imageMode(CENTER);
    image(sky, width/2, height/2, width, height); //Creates sky backgroung image


    for (int i = 0; i < index; i++) { //This shows the shape (raindrop) and gives it its falling motion.
      drops[i].display();
      drops[i].fall();
      drops[i].dead();
      if (die == 0) {
        stop = true;
      }

      if (c1.Catch(drops[i]) == true) { //This boolean determines whether it is true or not, in the case in which it is true, the raindrop resets and the score increases.
        drops[i].reset();
        score++;
      }
    }

    //top screen telling you how many lives and seconds are left. Also tells you your score, for this game.
    //Placed here so that the raindrops fall behind the board.
    fill(0);
    rect(0, 0, width, 110);
    image(life1, 20, 20, 30, 30);
    fill(0, 0, 100);
    textAlign(CENTER);
    textSize(50);
    text("Score: " + score, width/2, 50); //Gives the player a score at the top of the screen.
    textSize(20);
    text("LIVES: " + die, 80, 30);
    currentTime = millis()/1000 - startTime; 
    text("Time Remaining: "+ (30 - currentTime) + " seconds", width/2, 100);

    c1.display();   //displays the catcher.
    c1.update();    //allows the catcher to follow the mouse.

    if (currentTime-oldTime == t) { //This keeps track of the time and allows raindrops to fall at given inervals.

      if (index < drops.length) {
        index++;
        println(index);
      }
      oldTime = currentTime;
    }
  }


  if (die == 0) { //If three raindrops are dropped, then game is over.
    stop = true;
  }

  //Deals with the timing (whether game ends or not) and the text that shows up.
  if (currentTime >= 30) { //This sets the time (30 seconds) that you can play for.
    stop = true;
  }

  if (stop == true) {    //following code allows a GameOver screen to appear.
    fill(0); 
    rect(0, 0, width, height);
    fill(0, 0, 100);
    textSize(50); 
    textAlign(CENTER); 
    text("Game Over", width/2, height/2 + 150);
    text("You Scored: " + score, width/2, height/2 + 200);
    textSize(25);
    fill(100, 100, 100);
    rect(rx, ry, 100, 100);
    fill(0, 0, 100);
    text("Press Button to Restart Game", rx + 50, ry + 350 );
    drops = new Raindrops[30];
    for (int i = 0; i < drops.length; i++) { //This stops the score from increasing after the game over screen appears.
      drops[i] = new Raindrops();
      drops[i].display();
      drops[i].fall();
      drops[i].dead();
    }
  }

  //resets the game so that you can play again without having to return to the start screen.
  if (mousePressed == true && mouseX > rx && mouseX < rx + 100 && mouseY < ry + 100 && mouseY > ry) {
    index = 1;
    currentTime = 0;            //what allows the raindrops to fall at the same interval after restarting the game.
    oldTime = currentTime;

    if (index < drops.length) {
      index++;
      println(index);
    }

    if (die == 0) {
      stop = true;
    }

    die = 3;
    start = true;
    stop = false;
    index = 1;
    score = 0;
  }
}


