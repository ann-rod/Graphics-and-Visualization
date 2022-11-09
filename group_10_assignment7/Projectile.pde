class Projectile {
  PVector bullet_pos;
  PVector default_pos;
  boolean visible;
  Ship ship;
  //AlienManager alienManager;
  color col;
  // 's' for ship, 'a' for aliens, 'b' for barrier
  char mode;
  boolean moving;
  float speed;
  
  Projectile(color c, char m) {
    // initialize bullet to be off screen
    this.default_pos = new PVector(-100, -100);
    this.bullet_pos = this.default_pos;
    this.visible = false;
    this.col = c;
    this.mode = m;
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
    if (this.mode == 's') {
      if (! this.visible) {
        this.visible = true;
        this.moving = true;
        this.bullet_pos = ship_pos.copy();
      }
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

  void alienCollision(Alien alien) {
    if (this.bullet_pos.dist(alien.coord) < 16) {
      alien.health -= 1;
      resetProjectile();
    }
  } 
  
  /*  // alien test functions
  void alienShoot(PVector alien_pos) {
    if (this.mode == 'a') {
      if (! this.visible) {
        this.visible = true;
        this.moving = true;
        this.bullet_pos = alien_pos.copy();
      }
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
    if (this.bullet_pos.dist(ship.ship_pos) < 16) {
      ship.lives -= 1;
      resetProjectile();
    }
  }  
  */
  
}
