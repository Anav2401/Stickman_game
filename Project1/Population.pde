class Population{
  
  DNA[] Individuals = new DNA[populationSize];
  float[] fitness = new float[populationSize];
  float[] selectionArray = new float[populationSize];
  FloatDict elitists = new FloatDict();
  
  void init(){
    for(int i = 0; i< populationSize; i++){
      this.Individuals[i] = new DNA();
      this.Individuals[i].init();
    }
  }
  
  void calcFitness(String ideal){
    float sum = 0;
    for(int i = 0; i< populationSize; i++){
      this.fitness[i] = this.Individuals[i].fitness(ideal);
      sum = sum+this.fitness[i];
      this.selectionArray[i] = sum;
    }
    
    for(int i = 0; i< populationSize; i++){
      this.fitness[i] /= sum;
      this.selectionArray[i] /= sum;
    }
    
   }
   
   void calcElite(){
    for(int i =0; i<populationSize;i++){
      this.elitists.set(str(i),this.fitness[i]);
    }
    this.elitists.sortValuesReverse();
  }
  
  DNA[] getElite(int number){
    DNA[] Elite = new DNA[number];
    String[] keys = this.elitists.keyArray();
    for(int i=0;i<number;i++){
      Elite[i] = this.Individuals[Integer.parseInt(keys[i])];
    }
    return Elite;
  }
  
  void reproduce(){
    DNA[] nextGen = new DNA[populationSize];
    DNA father = new DNA();
    DNA mother = new DNA();
    int number = round(populationSize*elitism);
    DNA Elite[] = getElite(number);
    
    for(int i =0; i<populationSize; i++){
      if(i<number){
        nextGen[i] = new DNA();
        nextGen[i] = Elite[i];
      }
      else{
        float decision_dad = random(1);
        float decision_mom = random(1);
        boolean isDadMissing = true;
        boolean isMomMissing = true;
        for(int j = 0; j<populationSize; j++){
          if((decision_dad<selectionArray[j]) && isDadMissing){
            father = this.Individuals[j];
            isDadMissing = false;
          }
          if((decision_mom<random(1)) && isMomMissing){
            mother = this.Individuals[j];
            isMomMissing = false;
          }
        }
        nextGen[i] = father.crossover(mother);
        nextGen[i].mutate();
      }
    }
  this.Individuals = nextGen;
  }
  

}