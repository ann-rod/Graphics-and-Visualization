class Forklift{
  PVector center;
  float x;
  float y;
  float radius;
  PShape forkl;
  float spd;
  PVector osci;
  float theta;
  
  Forklift(float x, float y, float radius, float spd, float theta){
    center = new PVector(x,y);
    osci = new PVector(0,0);
    this.radius = radius;
    this.spd = spd;
    this.theta = theta;
    
    forkl = loadShape("Forklift.obj");
    
    
    
    
  }
  void display(){
  pushMatrix();
     
    
  rotateX(radians(90));
  rotateY(radians(-90));
  
  scale(0.1,0.1,0.1);
  forkl.setFill(color(#E8E102));
  shape(forkl);
  
  popMatrix();
    
    
    
  }
  void update(){
    translate(osci.x,osci.y);
    
    osci.x = cos(theta) * radius;
    osci.y = sin(theta) * radius;
    forkl.rotateY(radians(0.577));
    theta += spd;
 
    
    
    
  }
  
  
  
  
}
