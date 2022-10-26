class Hawk {
  PVector pos;
  PVector velocity;
  PShape body;
  ArrayList<Hawk> hawklist;
  int listidx;
  boolean canReproduce;
  boolean die;
  boolean eat;
  
  Hawk(PVector p, PVector v, ArrayList<Hawk> hklist) {
    this.pos = p;
    this.velocity = v;
    this.body = createShape(GROUP);
    createBody();
    this.hawklist = hklist;
    this.canReproduce = true;
    this.die = false;
    this.eat = true;
  }
  
  void display() {
    shape(this.body);
  }

  void createBody() {
    fill(#A27140);
    PShape hawkbody = createShape(ELLIPSE, pos.x, pos.y, 12, 25);
    this.body.addChild(hawkbody);
  }
  
  void updatePos(PVector v) {
    this.velocity = this.velocity.add(v);
    this.pos = this.pos.add(this.velocity);
    this.body.translate(this.velocity.x, this.velocity.y);
  }
  
  void updateVelocity() {

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
  
  void setIndex(int i) {
    this.listidx = i; 
  }
}
