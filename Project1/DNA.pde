class DNA{
  int chromosomeLength = idealString.length();
  char[] chromosome = new char[idealString.length()];
  
  void init(){
    for(int i = 0; i< this.chromosomeLength; i++){
      float decision = floor(random(53));
      if(decision<26)
        this.chromosome[i] = (char)(decision + 'a');
      else if(decision<52)
        this.chromosome[i] = (char)(decision - 26 + 'A');
      else
        this.chromosome[i] = ' ';
    }
    
  }
  
  int fitness(String ideal){
    int score = 0;
    for(int i=0;i<this.chromosomeLength;i++){
      if(ideal.charAt(i) == this.chromosome[i])
        score++;
    }
    return score;
  }
  
  void mutate(){
    for(int i=0;i<this.chromosomeLength;i++){
      if(random(1) < mutationRate){
        float decision = floor(random(53));
        if(decision<26)
          this.chromosome[i] = (char)(decision + 'a');
        else if(decision<52)
          this.chromosome[i] = (char)(decision - 26 + 'A');
        else
          this.chromosome[i] = ' ';
      }
        
    }
  }
  
  DNA crossover(DNA parent){
    DNA child = new DNA();
    child.init();
    for(int i=0;i<this.chromosomeLength;i++){
      if(random(1) < 0.5)
        child.chromosome[i] = this.chromosome[i];
      else
        child.chromosome[i] = parent.chromosome[i];
    }
    child.mutate();
    return child;
  }
}