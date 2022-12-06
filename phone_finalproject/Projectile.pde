class Projectile {
  PVector bullet_pos;
  PVector default_pos;
  boolean visible;
  Ship ship;
  AlienSwarm alienManager;
  color col;
  boolean moving;
  float speed;
  
  Projectile(color c) {
    // initialize bullet to be off screen
    this.default_pos = new PVector(-100, -100);
    this.bullet_pos = this.default_pos;
    this.visible = false;
    this.col = c;
    this.moving = false;
    this.speed = 8;
  }
  
  void display() {
    if (visible) {
      fill(col);
      ellipse(this.bullet_pos.x, this.bullet_pos.y, 8, 8);
    }
  }
  
  void resetProjectile() {
    this.moving = false;
    this.visible = false;
    this.bullet_pos = this.default_pos;
  }
  
  // ship functions
  void shipShoot(PVector ship_pos) {
    if (! this.visible) {
      this.visible = true;
      this.moving = true;
      this.bullet_pos = ship_pos.copy();
    }
  }
  
  void moveFromShip() {
    if (this.moving == true) {
      this.bullet_pos.y -= this.speed;
      
      if ((abs(this.bullet_pos.y - height/2) > height/2) || (abs(this.bullet_pos.x - width/2) > width/2)) {
        resetProjectile();
      }
    }
  }

  void alienCollision(ArrayList<Alien> swarm) {
    for (Alien alien: swarm) {
      if (this.bullet_pos.dist(alien.pos) < 36) {
        alien.HP -= 1;
        resetProjectile();
      }
    }
  } 
  
    // alien test functions
  void alienShoot(PVector alien_pos) {
    if (! this.visible) {
      this.visible = true;
      this.moving = true;
      this.bullet_pos = alien_pos.copy();
    }   
  }
  
  void moveFromAlien() {
    if (this.moving == true) {
      this.bullet_pos.y += this.speed;
      
      if ((abs(this.bullet_pos.y - height/2) > height/2) || (abs(this.bullet_pos.x - width/2) > width/2)) {
        resetProjectile();
      }
    }
  }
  
  void shipCollision(Ship ship) {
    if (this.bullet_pos.dist(ship.ship_pos) < 32) {
      ship.lives -= 1;
      resetProjectile();
    }
  }  
  
  
}
