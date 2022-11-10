class AlienSwarm{
  ArrayList<Alien> swarm;
  int aliensPerRow = 7;
  int numRows;
  float scaler = 8;
  
  PVector pad;
  
  AlienSwarm(int numRows){
    this.numRows = numRows;
    pad = new PVector(44, 44);
    
    this.swarm = new ArrayList<Alien>();
    this.createAliens();
  }
  
  void createAliens(){
    float currX = 4*scaler + pad.x;
    float currY = 4*scaler + pad.y;
    for(int j = 0; j < this.numRows; j++){
      for(int i = 0; i < this.aliensPerRow; i++){
        swarm.add(new Alien(new PVector(currX, currY), scaler));
        currX += 2*(4*scaler) + pad.x;
      }
      currX = 4*scaler + pad.x;
      currY += 2*(4*scaler) + pad.y;
    }
  }
  
  void display(){
    for(Alien a:swarm){
      a.display();
    }
  }
  
  void update(){
    for(Alien a:swarm){
      a.update();
    }
  }
}
