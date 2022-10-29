class Ecosystem {
  int numHawks, numBirds, numBees;
  
  ArrayList<Hawk> hawklist;
  
  // BIRD STUFF
  Flock birdFlock; // not using a buffer
  boolean setupMode;
  
  FlockBee flockbee;
  ArrayList<Bee> beelist;
  //ArrayList<Bee> beebuffer;  
  
  
  Ecosystem(int numHawks, int numBirds, int numBees) {
    this.numHawks = numHawks;
    this.numBirds = numBirds;
    this.numBees = numBees;
    
    this.setUpFlock();
    
    hawklist = new ArrayList<Hawk>();
    createHawks(this.numHawks);
        
    // introduces hawks to the birds
    birdFlock.introducePredators(hawklist);
       
    beelist = new ArrayList<Bee>();
     flockbee = new FlockBee();
     flockOfBees();
  }
  
  void update(){
    
    birdFlock.displayAndUpdateBirds();
    this.updateHawks();
    flockbee.run();
  }
  
  void createHawks(int numhawks) {
    for (int i=0; i < numhawks; i++) {
      int xpos = 30 + (int) random(40, width - 40);
      int ypos = (int) random(40, height - 40);
      PVector hawkpos = new PVector(xpos, ypos);
      PVector hawkv = new PVector(random(-1,1), random(-1,1));
      Hawk hk = new Hawk(hawkpos, hawkv);
      this.hawklist.add(hk);

      // add the new hawk to the Bird predator list
      birdFlock.predatorAdded(hk);
    }
  }
  
  void removeHawks(int numhawks) {
     for (int i=0; i < numhawks; i++) {
       Hawk hk = hawklist.get(i);
       this.hawklist.remove(this.hawklist.size() - 1);
       birdFlock.predatorRemoved(hk);
     }
  }
  
  void hawkAttractor() {
    for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        PVector net_dir = new PVector(0,0);
        for(Bird calcBird: birdFlock.flock){
           PVector dir = PVector.sub(calcBird.pos, currentHawk.pos);
           float m1 = 1 / dir.magSq() / dir.mag();
           
           dir = dir.mult(m1);
           net_dir = net_dir.add(dir);
        
        }
        float m2 = 1/net_dir.mag();
        float m3;
        if (net_dir.mag() > .1) { m3 = 1.5e-2;}
        else {m3 = constrain(m2, 1e-10, 1.5e-2);}
        net_dir.setMag(m3);
        currentHawk.velocity.mult(.998);
        currentHawk.updatePos(net_dir);
      }
    }
  }
  
  void hawkRepeller() {
    for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        PVector net_dir = new PVector(0,0);
        for (Hawk calcHawk: this.hawklist) {
          if ((calcHawk.die == false) && (calcHawk != currentHawk)) {
            PVector dir = PVector.sub(currentHawk.pos, calcHawk.pos);
            float m1 = 1 / dir.magSq() / dir.mag();
            
            dir = dir.mult(m1);
            net_dir = net_dir.add(dir);
          }
        }
        float m2 = 1 / net_dir.mag();
        float m3;
        if (net_dir.mag() > .1) {m3 = 1e-2;}
        else {m3 = constrain(m2, 1e-10, 1e-2);}
        net_dir.setMag(m3);
        currentHawk.velocity.mult(.998);
        currentHawk.updatePos(net_dir);  
      }
    }
  }
  
  void keepHawksInside() {
    for (Hawk hk: hawklist) {
      if ((hk.pos.x < 0) || (hk.pos.x > width)) {
        hk.velocity.x = -hk.velocity.x; 
      }
      if ((hk.pos.y < 0) || (hk.pos.y > height)) {
        hk.velocity.y = - hk.velocity.y; 
      }
    }
  }
  
  void hawkEatBird() {
     for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        for (Bird calcBird: birdFlock.flock) {
           PVector dir = PVector.sub(calcBird.pos, currentHawk.pos);
           if (dir.mag() < 3) {
             birdFlock.killBird(calcBird); 
          }
        }
      }
    }
  }
  
  void displayHawks() {
    for (Hawk hk: this.hawklist) {
      hk.display(); 
    }
  }
  
  void updateHawks() {
    displayHawks();
    hawkAttractor();
    hawkRepeller();
    keepHawksInside();
    //hawkEatBird();
  }
  
  void setUpFlock(){
    // call to spawn the initial amount of Birds
    setupMode = true;
    birdFlock = new Flock();
    for(int i = 0; i < numBirds; i++){
      this.spawnBird(setupMode);
    }
    setupMode = false;

  }
  
  
  
  void spawnBird(boolean setupMode){
    // Spawns a Bird with a random position and velocity.
    
    float minSpeed = 7;
    float maxSpeed = 10;
    
    // randomly calculates the direction of each velocity component
    float direction1 = int(random(-1.5,1.5));
      float direction2 = int(random(-1.5,1.5));
      while(direction1 == 0){
        direction1 = int(random(-1.5,1.5));
      }
      while(direction2 == 0){
        direction2 = int(random(-1.5,1.5));
      }
      
    birdFlock.addBird(new Bird(new PVector(random(10,width-10), random(10,height-10)), 
                             new PVector(direction1*random(minSpeed, maxSpeed), 
                             direction2*random(minSpeed, maxSpeed))));
    
    // only alters Bird count when not in setup mode
    if(!setupMode){
      numBirds += 1;
    }
  }
  
  void flockOfBees(){
    for (int i = 0; i < numBees; i++){
      createBee();
      
     flockbee.predators(birdFlock.flock);  
    }
    
    
    
  }
  
  void createBee(){
    flockbee.addBee(new Bee(random(width/2), random(height/2)));
    
    
  }
  void birdEatBee() {
     for (Bird currentbird: birdFlock.flock) {
      if (currentbird.canDie == false) {
        for (Bee calbee: beelist) {
          if (calbee.die == false) {
             PVector dir = PVector.sub(calbee.pos, currentbird.pos);
             if (dir.mag() < 10) {
               flockbee.eatBee(calbee); 
             }         
          }
        }
      
    }
  }
} 
  
  
  
}
