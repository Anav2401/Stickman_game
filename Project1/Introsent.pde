class Introsent
{
  void Sentence()
  {
    generation++;
    Sentences.calcFitness(idealString);
    Sentences.calcElite();
    fill(0);
    text(new String((Sentences.getElite(1))[0].chromosome), 300, 300);
    textSize(50);
    Sentences.reproduce();
    if (key == 'S')
    {
      background(0);
      scene1 = false;
      scene2 = true;
    }
    text("PRESS 'S' TO START", 10, width/2);
  }
}