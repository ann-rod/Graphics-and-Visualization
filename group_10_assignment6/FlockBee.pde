class FlockBee{
  ArrayList<Bee> flock;
  int eatCount = 0;
  
  FlockBee(){
    flock = new ArrayList<Bee>();
    
    
    
  }
  
  void run(){
   for (Bee b: flock){
     b.run(flock);
     
   }
  }
  /*void displayBees(){
    // displays all Birds in Flock statically
    for(Bee b: flock){
      b.display();
      
    }
  }*/
    void addBee(Bee b) {
      flock.add(b);
      
    }
    
    void displayUpdate(){
    for(Bee b: flock){
      b.display();
      b.update();
    }
  }
  
  
  void predators(ArrayList<Bird> pred){
    for(Bee b: flock){
      b.pred = pred;
    }
  }
  
  void predatorAdded(Bird pred){
    for(Bee be: flock){
      be.pred.add(pred);
    }
  }
  
  
  void eatBee(Bee dead){
    for(Bee b: flock){
      if(b == dead){
        flock.remove(b);
     
        
      }
      
      
      
    }
  }
  }
