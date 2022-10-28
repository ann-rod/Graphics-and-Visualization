
class Ecosystem {
  ArrayList<Hawk> hawklist;
  ArrayList<Bee> beelist;
  ArrayList<Bird> birdlist;
  ArrayList<Hawk> hawkbuffer;
  ArrayList<Bee> beebuffer;
  ArrayList<Bird> birdbuffer;  
  int numHawks;
  int numBirds;
  int numBees;
  
  Ecosystem(int hawks, int birds, int bees) {
    this.numHawks = hawks;
    this.numBirds = birds;
    this.numBees = bees;
    
    hawklist = new ArrayList<Hawk>();
    createHawks(this.numHawks);
    
    
  }
  
  void createHawks(int numhawks) {
    for (int i=0; i < numhawks; i++) {
      int xpos = 30 + (int) random(40, width - 40);
      int ypos = (int) random(40, height - 40);
      PVector hawkpos = new PVector(xpos, ypos);
      PVector hawkv = new PVector(xpos / width / 2.0, ypos / height / 2.0);
      Hawk hk = new Hawk(hawkpos, hawkv, this.hawklist);
      this.hawklist.add(hk);
      Hawk hk2 = new Hawk(hk.pos, hk.velocity, this.hawkbuffer);
      this.hawkbuffer.add(hk2);
      hk.setIndex(hawklist.indexOf(hk));
      hk2.setIndex(hk.listidx);
    }
  }
  
  void removeHawks(int numhawks) {
     for (int i=0; i < numhawks; i++) {
       this.hawklist.remove(this.hawklist.size() - 1);
       this.hawkbuffer.remove(this.hawkbuffer.size() - 1);
     }
  }
  
  void hawkAttractor() {
    for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        PVector net_dir = new PVector(0,0);
        for (Hawk calcBird: this.birdbuffer) {
          if (calcBird.canDie == false) {
             PVector dir = PVector.sub(calcBird.pos, currentHawk.pos);
             float m1 = 1 / dir.magSq() / dir.mag();
             
             dir = dir.mult(m1);
             net_dir = net_dir.add(dir);
          }
        }
        float m2 = 1/net_dir.mag();
        float m3;
        if (net_dir.mag() > .1) { m3 = 2e-2;}
        else {m3 = constrain(m2, 1e-10, 2e-2);}
        net_dir.setMag(m3);
        currentHawk.velocity.mult(.9998);
        currentHawk.updatePos(net_dir);
      }
    }
  }
  
  void hawkRepeller() {
    for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        PVector net_dir = new PVector(0,0);
        for (Hawk calcHawk: this.hawkbuffer) {
          if ((calcHawk.die == false) && (calcHawk.listidx != currentHawk.listidx)) {
            PVector dir = PVector.sub(currentHawk.pos, calcHawk.pos);
            float m1 = 1 / dir.magSq() / dir.mag();
            
            dir = dir.mult(m1);
            net_dir = net_dir.add(dir);
          }
        }
        float m2 = 1 / net_dir.mag();
        float m3;
        if (net_dir.mag() > .1) {m3 = .5e-2;}
        else {m3 = constrain(m2, 1e-10, .5e-2);}
        net_dir.setMag(m3);
        currentHawk.velocity.mult(.9998);
        currentHawk.updatePos(net_dir);  
      }
    }
  }
  
  void updateHawkBuffer() {
    for (int i=0; i < this.hawklist.size(); i++) {
      Hawk bufferhawk = this.hawkbuffer.get(i);
      Hawk realhawk = this.hawklist.get(i);
      bufferhawk.pos = realhawk.pos;
      bufferhawk.velocity = realhawk.velocity;
      bufferhawk.die = realhawk.die;
      bufferhawk.canReproduce = realhawk.canReproduce;
      bufferhawk.eat = realhawk.eat;
    }
  }
  
  void hawkEatBird() {
     for (Hawk currentHawk: this.hawklist) {
      if (currentHawk.die == false) {
        for (Hawk calcBird: this.birdbuffer) {
          if (calcBird.canDie == false) {
             PVector dir = PVector.sub(calcBird.pos, currentHawk.pos);
             if (dir.mag() < 7) {
               calcBird.canDie == true; 
             }         
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
    hawkEatBird();
    updateHawkBuffer();
  }
  
}
