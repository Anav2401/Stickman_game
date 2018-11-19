Characterb c;
Target t;
int m;
Intro in;
PImage Target;
boolean scene1 = true;
boolean scene2 = false;
boolean scene3 = false;
boolean scene4 = false;
int generation = 0;
float mutationRate = 0.02;
float elitism = 0.1;
int populationSize = 100;
String idealString = "Welcome";
Population Sentences = new Population();
Introsent sent = new Introsent();
PImage Arrow; 
PVector enpos = new PVector(width+100, height-350);
PVector Position = new PVector(100, 625);
PImage life0;
PImage life00;
PImage life000;
PVector Distance;
PVector arrow ;
PVector finish;
PImage storage;
import processing.video.*;
Capture video;
float groundY = height - 75;
float playerX = Position.x;
float playerY = Position.y;
float playerWidth = 100;
float playerHeight =150;
float playerSpeedY = 0;
float zoom = 1;
float angle = PI/4;
boolean life1 = true;
boolean life2 = true;
boolean life3 = true;
PVector arrowrep;
Life l = new Life();
boolean launcharrow = false;
boolean hitground = false;
//PImage Arrow2;
PImage monster;
int enradx;
int enrady;
PVector AStart;
void setup()
{
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  c = new Characterb();
  t = new Target();
  in = new Intro();
  Target = loadImage("Target.png");
  Target.resize(100, 100);
  Sentences.init();
  Arrow = loadImage("gun.png");
  Arrow.resize(100, 100);
  //Arrow2 = loadImage("Arrow.png");
  //Arrow2.resize(100, 25);
  life0 = loadImage("Life.png");
  life00 = loadImage("Life.png");
  life000 = loadImage("Life.png");
  life0.resize(50, 50);
  life00.resize(50, 50);
  life000.resize(50, 50);
  video = new Capture(this, width, height, 30);
  video.start();
  Life l;
  l = new Life();
  monster = loadImage("oy.png");
  monster.resize(100, 100);
}
void draw()
{
  background(203, 195, 195);
  noStroke();
  m = millis()/1000;
  background(203, 195, 195);
  if (scene1 == true)
  {
    textSize(100);
    sent.Sentence();
  }


  if (scene2 == true)
  {
    float zoom = 1;
    final  float inc = 1;
    short sz  = 50;
    text("PRESS MOUSE TO TAKE PICTURE", 0, 100);
    textSize(25);
    if (mousePressed)
    {
      if (video.available())
      {
        video.read();
        if (key == 'I') 
        {
          zoom += inc;
          sz++;
        } else if (mouseButton == 'O')  
        {
          zoom -= inc;
          sz --;
        }
      }
      if (key == 'P')
      { 
        translate(width/2, height/2);
        scale(zoom);

        video.stop();
        storage = video;
        storage.resize(100, 100);
        textSize(25);
        scene2 = false;
        scene3 = true;
      }
      translate(width/2, height/2);
      scale(zoom);
      background(0);
      image(video, sz, sz);
    }
  }


  if (scene3 == true)
  {
    background(203, 195, 195);
    fill(0);
    rect(width/2, height-100, width, 200);
    c.Jump();
    c.ArrowLaunch();
    t.PenTarget();
    in.SpawnEn();
    angle+=0.01;
    l.counter();
    l.display();
    //t.Hit();
    //l.Shot();
  }
}