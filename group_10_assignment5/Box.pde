class Box{
  PVector center1;
  float x1;
  float y1;
  float radius1;
  PShape box11;
  float spd1;
  PVector osci1;
  float theta1;
  
  Box(float x1, float y1, float radius1, float spd1, float theta1){
    center1 = new PVector(x1,y1);
    osci1 = new PVector(0,0);
    this.radius1 = radius1;
    this.spd1 = spd1;
    this.theta1 = theta1;
    
    box11 = createShape(BOX,15);
    box11.setFill(color(255,0,0));
    
    
    
  }
  
  void display(){
  pushMatrix();
  
  shape(box11,0,0);
  popMatrix();
  
  }
  void move(){
    
    translate(osci1.x,osci1.y,12);
    
    osci1.x = (cos(theta1) * radius1);
    osci1.y = (sin(theta1) * radius1) ;
    box11.rotateY(radians(0.3));
    //box11.rotateX(radians(0.577));
    theta1 += spd1;
    
    
    
    
  }
  
  
  
}
