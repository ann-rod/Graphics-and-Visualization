class Bee{
  PShape Be;
  PVector pos;
  PVector vel;
  PVector accel;
  float force;
  float speed;
  float radius;
  float d = 10;
  boolean die = false;
  boolean spawn = false;
  
  ArrayList<Bird> pred;
  
  int bWidth = 15;
  int bHeight = 7;
  color birdFill = color(0, 0, 0);
  color yellow = color(203, 167, 47);
  
  Bee(float x, float y){
    
    accel = new PVector(0,0);
    float angle = random(TWO_PI);
    vel = new PVector(cos(angle), sin(angle));
    
    pos = new PVector(x,y);
    radius = 2;
    speed = 2;
    force = 0.05;
    
    
    
  }
  void run(ArrayList<Bee> bee){
    flock(bee);
    update();
    border();
    createBee();
    
    
  }
  
  void applyForce(PVector force){
    accel.add(force);
    
  }
  void flock(ArrayList<Bee> bee){
    PVector seperation = seperate(bee);
    PVector avgVel = avgVelocity(bee);
    PVector coh = cohesion(bee);
    seperation.mult(1.5);
    avgVel.mult(1);
    coh.mult(1);
    
    applyForce(seperation);
    applyForce(avgVel);
    applyForce(coh);
    
    
  }
  
  void update(){
    vel.add(accel);
    vel.limit(speed);
    pos.add(vel);
    accel.mult(0);
       
  }
  
  PVector steer(PVector targetLoc){
    PVector dest = PVector.sub(targetLoc, pos);
    dest.normalize();
    dest.mult(speed);
    
    PVector steering = PVector.sub(dest, vel);
    steering.limit(force);
    return steering;
    
  }
  void createBee(){
   pushMatrix();
    //Draw body of bee
    strokeWeight(1);
    //fill(#8D4D26);
    fill(255,255,0);
    ellipse(pos.x, pos.y, d, 2.2*d);
    //Draw wings of bee
    fill(255);
    ellipse(pos.x+.9*d, pos.y, 1.5*d, .8*d);
    ellipse(pos.x-.9*d, pos.y, 1.5*d, .8*d);
    //Draw points for bee eyes
    //Set up color for points
    strokeWeight(2);
    //Draw left eye of bee
    point(pos.x-.2*d,pos.y-.7*d);
    //Draw right eye of bee
    point(pos.x+.2*d,pos.y-.7*d);
    popMatrix();
  
  
  }
  
  void border(){
    if(pos.x < -radius) {
    pos.x = width+radius;
    }
    if (pos.y < -radius) {
    pos.y = height+radius;
    }
    if (pos.x > width+radius) {
    pos.x = -radius;
    }
    if (pos.y > height+radius) {
    pos.y = -radius;
    }
    
    
  }
  
  PVector seperate(ArrayList<Bee> bee){
    float sep = 25.0f;
    PVector steering = new PVector(0,0,0);
    
    int count = 0;
    for (Bee other : bee) {
      float d = PVector.dist(pos, other.pos);
      
      if ((d > 0) && (d < sep)) {
        PVector difference = PVector.sub(pos, other.pos);
        difference.normalize();
        difference.div(d);        
        steering.add(difference);
        count += 1;            
      }
    }
    if (count > 0) {
      steering.div((float)count);
    }

    if (steering.mag() > 0) {

      steering.normalize();
      steering.mult(speed);
      steering.sub(vel);
      steering.limit(force);
    }
    return steering;
    
  }
  
  PVector avgVelocity(ArrayList<Bee> bee){
    float distanceBetween = 50;
    PVector summation = new PVector(0,0);
    
    int c = 0;
    
    for(Bee other: bee){
      float distance = PVector.dist(pos, other.pos);
      if(distance > 0 && distance < distanceBetween){
        summation.add(other.vel);
        c += 1;
        
      }
      
    }
    if(c > 0){
      summation.div(float(c));
      summation.normalize();
      summation.mult(speed);
      PVector steering = PVector.sub(summation, vel);
      steering.limit(force);
      return steering;
      
    }
    else{ return new PVector(0,0);}
    
  }
  
  PVector cohesion(ArrayList<Bee> bee){
    float distanceBetween = 50;
    PVector summation = new PVector(0,0);
    int c = 0;
    for(Bee other: bee){
      float distance = PVector.dist(pos,other.pos);
      
      if(distance > 0 && distance < distanceBetween){
        summation.add(other.pos);
        c += 1;
        
      }
      
    }
    if(c > 0){
      summation.div(c);
      return steer(summation);
      
    }
    else {return new PVector(0,0); }
    
    
  }
   void display(){
    createBee();
  
   }
  PVector avoidPred(ArrayList<Bird> bird){
    
    float sep = 25.0f;
    PVector steering = new PVector(0,0,0);
    
    int count = 0;
    for (Bird other : bird) {
      float d = PVector.dist(pos, other.pos);
      
      if ((d > 0) && (d < sep)) {
        PVector difference = PVector.sub(pos, other.pos);
        difference.normalize();
        difference.div(d);        
        steering.add(difference);
        count += 1;            
      }
    }
    if (count > 0) {
      steering.div((float)count);
    }

    if (steering.mag() > 0) {

      steering.normalize();
      steering.mult(speed);
      steering.sub(vel);
      steering.limit(force);
    }
    return steering;
    
  }

  
  
}
