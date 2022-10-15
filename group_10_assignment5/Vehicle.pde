class Vehicle {
  PShape vehicle;
  int scaleFactor;
  PVector start_pos;
  PVector v;
  
  Vehicle(PShape obj, int scale_f, PVector pos, PVector v) {
     this.vehicle = obj;
     this.vehicle.scale(scale_f);
     this.vehicle.rotateZ(0);
     this.vehicle.rotateY(-PI/2);
     this.start_pos = pos;
     this.vehicle.translate(start_pos.x, start_pos.y, start_pos.z);
     this.v = v;
  }
  
  void display() {
    shape(this.vehicle, 0, 0, this.vehicle.width, this.vehicle.height);
  }
  
  void path1() {
     this.move(this.v.x, this.v.y, this.v.z);
     this.vehicle.rotateY(-.025);
  }
  
  void move(float x, float y, float z) {
    this.vehicle.translate(x, y, z); 
  }

  void set_pos(float x, float y, float z) {
    this.vehicle.resetMatrix();
    this.vehicle.rotateZ(PI);
    this.vehicle.translate(x, y, z);
    this.start_pos = new PVector(x, y, z);
  }
   
}
