class Vehicle {
   PShape body = createShape(GROUP);
   PVector speed;
   
   Vehicle(PVector v) {
     this.speed = v; 
   }
   
   void move() {
     this.body.translate(speed.x, speed.y); 
   }
  
  
}
