Ship gameship;
Projectile ship_bullet;

void setup() {
  size(1000, 1000);

  gameship = new Ship(new PVector(width / 2, 5 * height / 6), 4);
  ship_bullet = gameship.bullet;
  
  


}

void draw() {
  if (gameship.lives > 0) {
    background(255);
    //gameship.shipUpdate(Alien);


  }
  else {
    background(0); 
    
  }
  
}

void keyPressed() {
  gameship.movement(key, keyCode);
  gameship.shoot(key);
  
}
