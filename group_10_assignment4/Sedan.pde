class Sedan extends Vehicle {
  PShape sedan;
  PShape cab;
  PShape roof;
  Wheel wheel1;
  Wheel wheel2;
  PShape backlight;
  
  Sedan(PVector p, PVector v, color c) {
    super(p, v, c);
    sedan = createShape(GROUP);
    cab = createShape();
    roof = createShape();
    
    wheel1 = new Wheel( new PVector(pos.x + 50, pos.y + 60), v.mag() / 30);
    wheel2 = new Wheel( new PVector(pos.x + 200, pos.y + 60), v.mag() / 30);
    
    this.constructSedan();

  }
  
  void stop() {
    shape(this.body); 
  }
  
  void display() {
    shape(this.body);
    wheel1.rotateWheel();
    wheel2.rotateWheel();
  }
  
  void constructSedan() {
    makeCab();
    makeRoof();
    makeWindows();
    makeLights();
    toggleBrakeLight();
    this.body.addChild(wheel1.wheel);
    this.body.addChild(wheel2.wheel);
  }
  
  void makeCab() {
    cab = createShape();
    cab.beginShape();
    cab.fill(this.bodycolor);
    cab.noStroke();
    cab.vertex(pos.x, pos.y);
    cab.vertex(pos.x+250, pos.y);
    cab.vertex(pos.x+250, pos.y+60);
    cab.vertex(pos.x, pos.y+60);
    cab.endShape();
    
    
    PShape tireHole1 = createShape(ARC, pos.x+50, pos.y+60, 60, 60, PI, 2*PI);
    tireHole1.setFill(0);
    PShape tireHole2 = createShape(ARC, pos.x+200, pos.y+60, 60, 60, PI, 2*PI);
    tireHole2.setFill(0);
    
    this.body.addChild(cab);
    this.body.addChild(tireHole1);
    this.body.addChild(tireHole2);
  }
  
  void makeRoof() {
    roof = createShape();
    roof.beginShape();
    roof.fill(this.bodycolor);
    roof.noStroke();
    roof.vertex(pos.x+30, pos.y);
    roof.vertex(pos.x+45, pos.y-40);
    roof.vertex(pos.x+150,pos.y-40);
    roof.vertex(pos.x+205, pos.y);
    roof.endShape();
    
    this.body.addChild(roof);
  }
  
  void makeWindows() {
    PShape passenger;
    PShape rear;
    
    passenger = createShape();
    passenger.beginShape();
    passenger.fill(#86ECFF);
    passenger.vertex(pos.x +148, pos.y-35);
    passenger.vertex(pos.x+190, pos.y-5);
    passenger.vertex(pos.x+110, pos.y-5);
    passenger.vertex(pos.x+110, pos.y-35);
    passenger.endShape(CLOSE);
    
    rear = createShape();
    rear.beginShape();
    rear.fill(#86ECFF);
    rear.vertex(pos.x+100, pos.y-5);
    rear.vertex(pos.x+100, pos.y-35);
    rear.vertex(pos.x+48, pos.y-35);
    rear.vertex(pos.x+38, pos.y-5);
    rear.endShape(CLOSE);
    
    this.body.addChild(passenger);
    this.body.addChild(rear);
  }
  
  void makeLights() {
     PShape frontlamp;
     PShape backlamp;
     
     frontlamp = createShape(ARC, pos.x+250, pos.y+20, 30, 20, PI / 2, 3*PI /2);
     frontlamp.setFill(#FBFF86);
     
     backlamp = createShape(ARC, pos.x, pos.y+20, 30, 20, 3*PI/2, 5*PI/2);
     backlamp.setFill(#FBFF86);

     backlight = createShape(ARC, pos.x, pos.y+20, 25, 12, 3*PI/2, 5*PI/2);
     backlight.setFill(#FA0A0A);
     
     this.body.addChild(frontlamp);
     this.body.addChild(backlamp);
     this.body.addChild(backlight);
  }
  
  void toggleBrakeLight() {
    backlight.setVisible( ! backlight.isVisible());
  }
  
  void brakelightOn() {
     backlight.setVisible(true);
  }
  
  void brakelightOff() {
    backlight.setVisible(false); 
  }
  
  void setSpeed(PVector v) {
     this.speed = v; 
     this.wheel1.rot_speed = v.mag() / 30;
     this.wheel2.rot_speed = v.mag() / 30;
   }
  
  
  
  
}
