StarManager backgroundStars;
Barriers barrier;
Barriers barrier1;
Barriers barrier2;
Barriers barrier3;

Ship gameship;
Projectile ship_bullet;

AlienSwarm swarm;

void setup() {
  size(800, 950);
  backgroundStars = new StarManager(150, new PVector(0,width), new PVector(0,height), new PVector(1,4));

  gameship = new Ship(new PVector(width / 2, 9 * height / 10 + 20), 4, width, height);
  
  // creates 6 rows of aliens to defeat
  swarm = new AlienSwarm(6);
  
  // creates 4 barriers
  barrier = new Barriers(new PVector(width/4 +20 ,height/1.2));
  barrier1 = new Barriers(new PVector(width/2 + 20,height/1.2));
  barrier2 = new Barriers(new PVector(width * (3/4) +20,height/1.2));
  barrier3 = new Barriers(new PVector(width -130,height/1.2));
}

void draw() {
  background(0);
  backgroundStars.display();
  
  
  // game continues if player lives and 
  // swarm hasn't reached bottom of screen
  if ((gameship.lives > 0) && !swarm.reachedBottom){
    

    swarm.display();
    swarm.update();
    swarm.shootingLoop(gameship);
    gameship.shipUpdate(swarm.swarm);
    

  }
  else{
    
    background(0); 
    
  }
  
  // if swarm.numAliens == 0 you win?
  
  barrier.display();
  barrier1.display();
  barrier2.display();
  barrier3.display();
  barrier.checkCollision(ship_bullet.bullet_pos.x, ship_bullet.bullet_pos.y);
  barrier1.checkCollision(ship_bullet.bullet_pos.x, ship_bullet.bullet_pos.y);
  barrier2.checkCollision(ship_bullet.bullet_pos.x, ship_bullet.bullet_pos.y);
  barrier3.checkCollision(ship_bullet.bullet_pos.x, ship_bullet.bullet_pos.y);
  
  
}

void keyPressed() {
if(key == 'r'){
    barrier.recharge(mouseX,mouseY);
    barrier1.recharge(mouseX,mouseY);
    barrier2.recharge(mouseX,mouseY);
    barrier3.recharge(mouseX,mouseY);
    
  }
  else{
  gameship.movement(key, keyCode);
  gameship.shoot(key);
  
  }
  
}
