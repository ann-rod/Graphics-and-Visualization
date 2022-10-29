class Flock{
  // An array of boid-like birds that updates
  // and manages bird interactions.
  
  ArrayList<Bird> flock;
  PVector avgHeading;
  float radius = 5; //pixels
  
  Flock(){
    this.flock = new ArrayList<Bird>();
    avgHeading = new PVector(0,0);
  }
  
  void addBird(Bird b){
    flock.add(b);
  }
  
  void killBird(Bird db){
    for(Bird b: flock){
      if(b == db){
        flock.remove(b);
      }
    }
  }
  
  void displayBirds(){
    // displays all Birds in Flock statically
    for(Bird b: flock){
      b.display();
    }
  }
  
  void displayAndUpdateBirds(){
    // displays all Birds in Flock and updates positions
    this.updateHeading();
    for(Bird b: flock){
      b.display();
      b.update();
    }
  }
  
  void updateHeading(){
  /*
    Counts the neighbors a Bird has within the radius window
    and updates the Bird's heading to the average velocity of
    the neighborhood.
  */
    for(Bird b1: flock){
      int numNeighbors = 0;
      float xAvg, yAvg;
      xAvg = yAvg = 0;
      for(Bird b2: flock){
        if(b1 != b2){
          // check if b2 is within x AND y windows of b1
          if((b1.pos.x-radius/2 < b2.pos.x || b2.pos.x < b1.pos.x+radius/2)& 
             (b1.pos.y-radius/2 < b2.pos.y || b2.pos.y < b1.pos.y+radius/2)){
            numNeighbors += 1;
            xAvg += b2.pos.x;
            yAvg += b2.pos.y; 
          }
        }
      }
      b1.flockHeading.x = xAvg/numNeighbors;
      b1.flockHeading.y = yAvg/numNeighbors;
    }
  }
  
  void introducePredators(ArrayList<Hawk> predList){
    for(Bird b: flock){
      b.predList = predList;
    }
  }
  
  void predatorAdded(Hawk h){
    for(Bird b: flock){
      b.predList.add(h);
    }
  }
  
  void predatorRemoved(Hawk rh){
    for(Bird b: flock){
      for(Hawk h: b.predList){
        if(h == rh){
          b.predList.remove(h);
        }
      }
    }
  }
  
  void introducePrey(ArrayList<Bee> preyList){
    for(Bird b: flock){
      b.preyList = preyList;
    }
  }
  
  void preyAdded(Bee bee){
    for(Bird b: flock){
      b.preyList.add(bee);
    }
  }
  
  void preyRemoved(Bee rbee){
    for(Bird b: flock){
      for(Bee bee: b.preyList){
        if(bee == rbee){
          b.preyList.remove(bee);
        }
      }
    }
  }
  
  void reproduce(){
    for(Bird b: flock){
      if(b.numBeesEaten >= 3){
        this.addBird(new Bird(new PVector(b.pos.x, b.pos.y), 
                              new PVector(b.vel.x, b.vel.y)));
      }
      b.numBeesEaten = 0;
    }
  }
  
}
