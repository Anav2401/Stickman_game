class Characterb
{
  float speed;
  float distance;
  PVector origin;
  PVector mouse;
  float rotation;
  float YDifference;
  float playerY = Position.y;
  PVector arrow = new PVector (150, 50);
  boolean jumping = false;
  float groundY = height - 75;
  float playerX = Position.x;
  float playerWidth = 100;
  float playerHeight =150;
  float playerSpeedY = 0;
  PVector arrowrep = new PVector(arrow.x, 520);
  float velocityx = 0;
  float velocityy = 0;
  int t = 0;
  int bullet_capacity = 6;
  void ArrowLaunch()
  {
    PVector AStart = new PVector(150, 420);
    if (mousePressed)
    {
      cursor(CROSS);
      fill(0);
      ellipse(AStart.x, AStart.y, 10, 10);
      stroke(0);
      strokeWeight(4);
      line(AStart.x, AStart.y, mouseX, mouseY);
      rotation = tan(YDifference/mouseY);
      YDifference = mouseY-AStart.y; 
      pushMatrix();
      translate(Position.x, playerY -10);
      rotate(rotation);
      if (rotation > 0)
      {
        rotation = -rotation;
      }
      if (rotation > 120)
      {
        rotation = +rotation;
      }
      image(Arrow, arrow.x, arrow.y);
      popMatrix();
      if (key == 'W')
      {
        velocityx = cos(rotation);
        velocityy = sin(rotation);
        arrowrep.y =  (0.5)*(9.8)*(t*t) + 520;
        float calc = abs((pow((AStart.x- mouseX), 2) - pow((AStart.y- mouseY), 2)));
        float distance = sqrt(calc);
        arrowrep.x = distance*(velocityx*t);
        t += 1.25;
        arrowrep.x /= 4;
        pushMatrix();
        rotate(rotation);
        //image(Arrow2, arrowrep.x, arrowrep.y);
        fill(61,59,209);
        ellipse (arrowrep.x,arrowrep.y,20,20);
        popMatrix();
      } else
      {
        cursor(HAND);
      }
    }
  }
  void Jump()
  {
    //move the player
    playerY += 1.5*playerSpeedY;

    //is the player colliding with the ground?
    if (playerY + playerHeight > groundY) 
    {

      //snap the player's bottom to the ground's position
      playerY = groundY - playerHeight;

      //stop the player falling
      playerSpeedY = 0;

      //allow jumping again
      jumping = false;
    }
    //player is not colliding with the ground
    else 
    {
      //gravity accelerates the movement speed
      playerSpeedY ++;
    }
    //draw the player rectangle
    rect(playerX, playerY, playerWidth, playerHeight);
    image(storage, playerX, playerY - 150);
    //you can only jump if you aren't already jumping
    if (!jumping) 
    {

      //going up
      playerSpeedY = -15;

      //disallow jumping while already jumping
      jumping = true;
    }
  }
}