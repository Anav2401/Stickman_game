class Intro
{
  float speed;
  int spawnrate;
  int enradx;
  int enrady;
  float angle;
  Intro()
  {
    speed  = 0;
    spawnrate = 0;
    enradx = 0;
    enrady = 0;
  }
  void SpawnEn()
  {
    angle = PI/4;
    PVector enpos = new PVector(width+100, height-350);
    spawnrate = 200;
    noStroke();
    enradx = 100;
    enrady = 100;
    speed = 10;
    enpos.x = (width +100)+(-0.3*(enradx*(m-sin(m))));
    enpos.y = (height - 271) +(0.2*(enrady*(1+cos(m))));
    //image(monster, enpos.x, enpos.y);
     fill(0);
     ellipse(enpos.x, enpos.y, enradx, enrady);
     fill(255);
     ellipse(enpos.x-32, enpos.y-5, enradx-65, enrady-95);
     fill(255, 0, 0);
     ellipse(enpos.x-32, enpos.y-5, 5, 5);
     println(1000 - enpos.x);
  }
}