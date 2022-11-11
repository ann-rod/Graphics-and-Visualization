StarManager backgroundStars;

Ship gameship;
Projectile ship_bullet;

AlienSwarm swarm;

void setup() {
  size(800, 950);
  backgroundStars = new StarManager(150, new PVector(0,width), new PVector(0,height), new PVector(1,4));

  gameship = new Ship(new PVector(width / 2, 5 * height / 6), 4);
  ship_bullet = gameship.bullet;
  
  // creates 6 rows of aliens to defeat
  swarm = new AlienSwarm(6);
}

void draw() {
  background(0);
  backgroundStars.display();
  
  
  // game continues if player lives and 
  // swarm hasn't reached bottom of screen
  if ((gameship.lives > 0) && !swarm.reachedBottom){
    //background(255);
    //gameship.shipUpdate(Alien);
    swarm.display();
    swarm.update();
    

  }
  else{
    
    background(0); 
    
  }
  
  // if swarm.numAliens == 0 you win?
  
}

void keyPressed() {
  gameship.movement(key, keyCode);
  gameship.shoot(key);
  
}
