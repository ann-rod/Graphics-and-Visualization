class Wheel {
  PVector center;
  PVector[] spokes_pos = new PVector[5];
  PShape[] spokes = new PShape[5];
  float rot_speed;
  int slength = 18;
  PShape wheel;
  
  Wheel(PVector pos, float theta) {
    super();
    this.center = pos;
    this.rot_speed = theta;
    this.wheel = createShape(GROUP);
        
    for (int i=0; i < 5; i++) {
      this.spokes_pos[i] = new PVector(slength * cos(i * 2 * PI / 5), slength * sin(i * 2 * PI / 5));
     } 
     
    this.constructWheel();
  }
  
  void display() {
    rotateWheel();
    shape(this.wheel);

  }
  
  void rotateWheel() {
    removeSpokes();
    rotateSpokes();
    makeSpokes();
  }
  
  void constructWheel() {
    makeHubcap();
    makeSpokes();
    makeTire();
  }
  
  void removeSpokes() {
    for (int i = 0; i < 5; i++) {
      wheel.removeChild(wheel.getChildIndex(spokes[i]));
    }
  }
  
  void makeTire() {
    PShape tire;
    noFill();
    stroke(0);
    strokeWeight(this.slength / 2 + 4);
    tire = createShape(ELLIPSE, this.center.x, this.center.y, 2 * (this.slength + 4), 2 * (this.slength + 4)); 
    this.wheel.addChild(tire);
    fill(0);
    strokeWeight(1);
    
  }
  
  void makeHubcap() {
    PShape hub;
    stroke(#838383);
    fill(#838383);
    hub = createShape(ELLIPSE, this.center.x, this.center.y, this.slength/4, this.slength/4);
    this.wheel.addChild(hub);
    stroke(0);
    fill(0);
  }
  
  void makeSpokes() {
    stroke(#838383);
    fill(#838383);
    strokeWeight(5);
    for (int i=0; i < 5; i++) {   
      spokes[i] = createShape(LINE, 
      this.center.x, this.center.y, this.center.x + this.spokes_pos[i].x, this.center.y + this.spokes_pos[i].y);
      this.wheel.addChild(spokes[i]);
    }
    strokeWeight(1);
    fill(0);
  }
  
  void rotateSpokes() {
    for (int i=0; i < 5; i++) {
      spokes_pos[i].rotate(this.rot_speed);
    }
  }
  
  void setRotSpeed(float theta) {
    this.rot_speed = theta; 
  }
  
  float getX() {
    return this.center.x; 
  }
  
  float getY() {
    return this.center.y; 
  }
  
  float getRotSpeed() {
    return this.rot_speed; 
  }
}
