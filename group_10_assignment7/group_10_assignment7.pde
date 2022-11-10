StarManager backgroundStars;

Ship gameship;
Projectile ship_bullet;

AlienSwarm swarm;

void setup() {
  size(800, 950);
  backgroundStars = new StarManager(150, new PVector(0,width), new PVector(0,height), new PVector(1,4));

  gameship = new Ship(new PVector(width / 2, 5 * height / 6), 4);
  ship_bullet = gameship.bullet;
  
  swarm = new AlienSwarm(3);
}

void draw() {
  background(0);
  backgroundStars.display();
  
  
  if (gameship.lives > 0) {
    //background(255);
    //gameship.shipUpdate(Alien);
    //swarm.display();

  }
  else {
    background(0); 
    
  }
  
}

void keyPressed() {
  gameship.movement(key, keyCode);
  gameship.shoot(key);
  
}
