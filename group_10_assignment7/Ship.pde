class Ship {
  PVector ship_pos;
  int lives;
  PShape ship;
  Projectile bullet;
  float movementConstant;
  int screenWidth;
  int screenHeight;
  
  Ship(PVector pos, int life, int w, int h) {
    this.ship_pos = pos;
    this.lives = life;
    this.bullet = new Projectile(#F2F27F);
    this.screenWidth = w;
    this.screenHeight = h;
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
  
  void displayLives() {
    if (this.lives > 0) { 
      fill(#FA1212);
      for(int i=0; i < this.lives; i++) {
         rect(20 + 24*i, this.screenHeight - 24, 12, 12);
       }
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
    if ((this.lives > 0) && (this.ship_pos.x < width - 40)) {
      this.ship_pos.x += movementConstant;
      this.ship.translate(movementConstant, 0);
    }
  }
  
  void moveLeft() {
    if ((this.lives > 0) && (this.ship_pos.x > 40)) {
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
  
  void shootingLoopFunction(ArrayList<Alien> swarm) {
    this.bullet.display();
    this.bullet.moveFromShip();
    this.bullet.alienCollision(swarm); 
  }
  
  void shipUpdate(ArrayList<Alien> swarm) {
    this.display();
    this.displayLives();
    this.shootingLoopFunction(swarm);
  }
  
  
}
