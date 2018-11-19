class Life 
{
  void display()
  {
    image(life0,50,50);
    image (life00,150,50);
    image(life000,250,50);
  }
  void counter()
  {
    int count = 0;
    if ((enpos.x - playerX) < (enradx + playerWidth))
    {
      if(count == 0)
      life000.resize(1,1);
      else if (count == 1)
      life00.resize(1,1);
      else if (count == 2)
      life0.resize(1,1);
      count++;
    }
  }
  void Shot()
  {
    if (dist(arrowrep.x,arrowrep.y,enpos.x,enpos.y) < (50 + enradx ))
    {
      text("+10",(AStart.x+100),AStart.y);
      textSize(50);
    }
  }
} 