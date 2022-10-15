class road{
  PVector center;
  float radius;
  float x;
  float y;
  float r;
  
  road(float x, float y, float r){
    center = new PVector(x,y);
    radius = r;
    
    
  }
  
  void display(){
    fill(0);
    circle(center.x,center.y,radius);
    noFill();
    strokeWeight(3);
    stroke(255);
    circle(center.x,center.y,radius-20);
    stroke(255,255,0);
    circle(center.x,center.y,radius-60);
    stroke(255);
    circle(center.x,center.y,radius-100);
    
    
    pushMatrix();
    fill(#179805);
    noStroke();
    translate(0,0,.002);
    circle(center.x,center.y,radius-120);
    popMatrix();
    
    //circle(center.x,center.y,radius);
    
    
    
  }
  
  
  
  
  
  
}
