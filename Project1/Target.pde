class Target 
{
  int lengt;
  PVector or;
  PVector bob;   
  float angle;
  float avelo;
  float aacc;
  int target_count;

  Target()
  {
    lengt = 0;
    angle = 0.0;
    avelo = 0.0;
    aacc  = 0.0;
  }
  void  PenTarget()
  {
    stroke(0);
    lengt = 250;
    or = new PVector(600, 250);
    bob  = new PVector (600, 500);
    angle = PI/4;
    aacc = -0.08 * sin(angle);
    angle += avelo;
    avelo += aacc;
    bob.x = or.x + (lengt*sin(angle));
    bob.y = or.y + (lengt*cos(angle));
    
    line(bob.x, bob.y, 600, 150);
    image(Target, bob.x, bob.y);
  }
  /*void Hit()
  {
    if (dist(arrowrep.x,arrowrep.y,bob.x,bob.y) < 150)
    {
      text("+15",(AStart.x+150),AStart.y);
    }
  }*/
}