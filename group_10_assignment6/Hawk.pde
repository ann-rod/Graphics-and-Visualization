class Hawk {
  PVector pos;
  PVector velocity;
  PShape body;
  boolean canReproduce;
  boolean die;
  boolean eat;
  
  Hawk(PVector p, PVector v) {
    this.pos = p;
    this.velocity = v;
    this.body = createShape(GROUP);
    createBody();
    this.canReproduce = true;
    this.die = false;
    this.eat = true;
  }
  
  void display() {
    if (this.die == false) {
      shape(this.body);
    }
  }

  void createBody() {
    fill(#A27140);
    noStroke();
    PShape hawkbody = createShape(ELLIPSE, pos.x, pos.y, 12, 25);
    PShape leftwing = createShape(ARC, pos.x, pos.y-4, 40, 20, HALF_PI, PI);
    PShape rightwing = createShape(ARC, pos.x, pos.y-4, 40, 20, 0, HALF_PI);
    PShape tailfeather = createShape(QUAD, pos.x, pos.y - 10, pos.x - 4, pos.y + 16, pos.x, pos.y + 22, pos.x + 4, pos.y + 16);
    //PShape head = createShape(ELLIPSE, pos.x, pos.y - 13, 10, 10);
    fill(#FAB765);
    PShape beak = createShape(TRIANGLE, pos.x - 4, pos.y - 10, pos.x + 4, pos.y - 10, pos.x, pos.y - 18);
    this.body.addChild(beak);
    //this.body.addChild(head);
    this.body.addChild(tailfeather);
    this.body.addChild(leftwing);
    this.body.addChild(rightwing);
    this.body.addChild(hawkbody);
  }
  
  void updatePos(PVector v) {
    this.velocity = this.velocity.add(v);
    this.pos = this.pos.add(this.velocity);
    this.body.translate(this.velocity.x, this.velocity.y);
  }
  
  void setPos(PVector p) {
    this.body.translate(p.x - this.pos.x, p.y - this.pos.y);
    this.pos = p; 
  }
  
  void setVelocity(PVector v) {
    this.velocity = v; 
  }
  
  void toggleDeath() {
    this.die = ! this.die; 
  }
  
  void toggleEat() {
    this.eat = ! this.eat; 
  }
  
  void toggleReproduce() {
    this.canReproduce = ! this.canReproduce; 
  }
  
}
