class Ship {
  PVector ship_pos;
  int lives;
  PShape ship;
  Projectile bullet;
  float movementConstant;
  PShape flames;
  boolean flamevisibility;

  Ship(PVector pos, int life) {
    this.ship_pos = pos;
    this.lives = life;
    this.bullet = new Projectile(#F2F27F);
    movementConstant = 12;
    
    this.ship = createShape(GROUP);
    this.flames = createShape(GROUP);
    this.flamevisibility = true;
    createShipShape();
    
    
  }
  
  void display() {
    if (this.lives > 0) {
      shape(this.ship);
    }
    this.flames.setVisible(this.flamevisibility);
    this.flamevisibility = ! this.flamevisibility;
  }
  
  void displayLives() {
    if (this.lives > 0) { 
      fill(#FA1212);
      for(int i=0; i < this.lives; i++) {
         rect(20 + 24*i, height - 24, 12, 12);
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
    noStroke();
    fill(#B4B4B4);
    
    PShape nosetip = createShape(TRIANGLE, this.ship_pos.x, this.ship_pos.y, this.ship_pos.x+6, this.ship_pos.y, this.ship_pos.x+3, this.ship_pos.y-6);
    PShape nose = createShape(RECT, this.ship_pos.x, this.ship_pos.y, 6, 24);
    PShape wings = createShape(RECT, this.ship_pos.x-12, this.ship_pos.y+24, 30, 6);
    PShape engine = createShape(RECT, this.ship_pos.x-3, this.ship_pos.y +30, 12, 6);
    PShape thruster1 = createShape(RECT, this.ship_pos.x-3, this.ship_pos.y+36, 4, 6);
    PShape thruster2 = createShape(RECT, this.ship_pos.x+5, this.ship_pos.y+36, 4, 6);
    fill(#FF0000);
    PShape flame1 = createShape(TRIANGLE, this.ship_pos.x-3, this.ship_pos.y+42, this.ship_pos.x+1, this.ship_pos.y+42, this.ship_pos.x-1, this.ship_pos.y+48);
    PShape flame2 = createShape(TRIANGLE, this.ship_pos.x+5, this.ship_pos.y+42, this.ship_pos.x+9, this.ship_pos.y+42, this.ship_pos.x+7, this.ship_pos.y+48);
    fill(#FAED5B);
    PShape flame3 = createShape(TRIANGLE, this.ship_pos.x-6, this.ship_pos.y+42, this.ship_pos.x+4, this.ship_pos.y+42, this.ship_pos.x-1, this.ship_pos.y+54);
    PShape flame4 = createShape(TRIANGLE, this.ship_pos.x+2, this.ship_pos.y+42, this.ship_pos.x+12, this.ship_pos.y+42, this.ship_pos.x+7, this.ship_pos.y+54);

    this.flames.addChild(flame3);
    this.flames.addChild(flame4);
    
    this.ship.addChild(nosetip);
    this.ship.addChild(nose);
    this.ship.addChild(wings);
    this.ship.addChild(engine);
    this.ship.addChild(thruster1);
    this.ship.addChild(thruster2);
    this.ship.addChild(this.flames);
    this.ship.addChild(flame1);
    this.ship.addChild(flame2);
    this.ship.translate(-3, -18);
    
    stroke(0);
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
