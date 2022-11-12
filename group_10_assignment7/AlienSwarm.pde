class AlienSwarm{
  ArrayList<Alien> swarm;
  PVector pad;
  color projectileColor = color(0, 255, 255);
  float scaler = 8;

  // formation vars
  int numRows;
  int aliensPerRow = 7;
  int numAliens = aliensPerRow * numRows;
  
  // gameplay
  boolean reachedBottom = false;
  int shootingRate = 200;
  Projectile alienBullet;

  AlienSwarm(int numRows){
    this.numRows = numRows;
    pad = new PVector(44, 44); // padding for formation placement
    this.swarm = new ArrayList<Alien>();
    alienBullet = new Projectile(projectileColor);
    // create the aliens in the swarm
    this.createAliens();
  }
  
  void createAliens(){
    // start swarm position at top left of screen with some padding
    float currX = 4*scaler + pad.x;
    float currY = (-4*scaler - 1.2*pad.y)* this.numRows;
    
    for(int j = 0; j < this.numRows; j++){
      for(int i = 0; i < this.aliensPerRow; i++){
        // create new alien
        Alien temp = new Alien(new PVector(currX, currY), scaler);
        
        // mark the aliens in the front row of the swarm
        if(j == (this.numRows-1)){
          temp.frontRow = true;
        }
        // add alien to swarm
        swarm.add(temp);
        
        // pad between aliens in one row
        currX += 2*(4*scaler) + pad.x;
      }
      // reset padding on x and update padding on y
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
    ArrayList<Alien> toBeRemoved = new ArrayList<Alien>();;
    for(Alien a:swarm){
      
      
      // check if reached bottom of screen
      if(a.pos.y+(.5*pad.y) >= height - 60){
        reachedBottom = true;
      }
      
      // check if a is dead and remove if so
      if(a.HP <= 0){
        this.updateFrontRow(a.pos);
        //swarm.remove(a);
        toBeRemoved.add(a);
        this.numAliens -= 1;
      }
      
      // chance to attack if in front row
      if(a.frontRow && (a.HP > 0)){
        // chance to shoot at player
        if(int(random(shootingRate)) == 1){
          alienBullet.alienShoot(a.pos);
        } 
      }
      
      // normal update 
      a.update();
    }
    swarm.removeAll(toBeRemoved);
  }
  
  void shootingLoop(Ship ship) {
    alienBullet.display();
    alienBullet.moveFromAlien();
    alienBullet.shipCollision(ship);
  }
  
  
  void updateFrontRow(PVector ad_pos){
    for(Alien a: swarm){
      // find aliens on same column as dead alien
      if((a.pos.x == ad_pos.x)){
        // find alien directly behind dead alien
        if((a.pos.y < ad_pos.y) && (a.pos.y >= ad_pos.y -(8*scaler+1.5*pad.y))){
          // mark as front of row
          a.frontRow = true;
        }
      }
    }
  }

}
