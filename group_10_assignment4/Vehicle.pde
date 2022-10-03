class Vehicle {
   PShape body;
   PVector pos;
   PVector speed;
   color bodycolor;
   
   Vehicle(PVector p, PVector v, color c) {
     this.pos = p;
     this.speed = v; 
     this.bodycolor = c;
     body = createShape(GROUP);
   }
   
   void display() {
     shape(this.body);  
   }
   
   void move() {
     this.body.translate(speed.x, speed.y); 
   }
   
   void setSpeed(PVector v) {
     this.speed = v; 
   }
   
  
  
}
