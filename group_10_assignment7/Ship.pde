class Ship {
  PVector ship_pos;
  int lives;
  PShape ship;
  Projectile bullet;
  float movementConstant;
  
  Ship(PVector pos, int life) {
    this.ship_pos = pos;
    this.lives = life;
    this.bullet = new Projectile(#F2F27F, 's');
    movementConstant = 12;
    
    this.ship = createShape(GROUP);
    createShipShape();
    this.ship.translate(this.ship_pos.x, this.ship_pos.y);
  }
  
  void display() {
    if (this.lives > 0) {
      shape(this.ship);
    }
  }
  
  void movement(int button, int buttoncode) {
    if ((button == 'a') || (button == 'A') || (buttoncode == LEFT)) {
      moveLeft();
    }
    if ((button == 'd') || (button == 'D') || (buttoncode == RIGHT)) {
      moveRight();
    }
  }

  void moveRight() {
    if (this.lives > 0) {
      this.ship_pos.x += movementConstant;
      this.ship.translate(movementConstant, 0);
    }
  }
  
  void moveLeft() {
    if (this.lives > 0) {
      this.ship_pos.x -= movementConstant;
      this.ship.translate(-movementConstant, 0);
    }
  }
  
  void createShipShape() {
    PShape rectng = createShape(RECT, 0, 0, 10, 10);
    this.ship.addChild(rectng);
  }
  
  void shoot(int button) {
    if ((button == 32) && (this.lives > 0)) { 
      this.bullet.shipShoot(this.ship_pos);
    }
  }
  
  void shootingLoopFunction(Alien alien) {
    this.bullet.display();
    this.bullet.moveFromShip();
    this.bullet.alienCollision(alien); 
  }
  
  void shipUpdate(Alien alien) {
    this.display();
    this.shootingLoopFunction(alien);
  }
  
  
}
