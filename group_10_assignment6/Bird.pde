class Bird{
  PVector pos;
  PVector vel;
  PShape bird;
  PVector flockHeading;
  
  float headingFactor = 0.00005;
  float centerFactor = 0.000005;
  float maxSpeed = 6;
  int bWidth = 15;
  int bHeight = 7;
  color birdFill = color(0, 0, 0);
  color yellow = color(203, 167, 47);
  
  boolean canDie = false;
  boolean canReproduce = false;
  
  Bird(PVector pos, PVector vel){
    this.pos = pos;
    this.vel = vel;
    
    this.flockHeading = new PVector(0, 0);
    this.createBody();
  }
  
  void createBody(){
    bird = createShape(GROUP);
    
    ellipseMode(CENTER);
    PShape body = createShape(ELLIPSE, 0, 0, bWidth, bHeight);
    PShape head = createShape(ELLIPSE, bHeight, -3, bHeight, bHeight);
    PShape wing = createShape(TRIANGLE, 4, 0, -5, 0, -6, -9); 
    PShape beak = createShape(TRIANGLE, 2*bWidth/3, -5, 2*bWidth/3, 0, 16, -2);
    
    body.setFill(birdFill);
    head.setFill(birdFill);
    wing.setFill(birdFill);
    beak.setFill(yellow);
    
    bird.addChild(body);
    bird.addChild(head);
    bird.addChild(wing);
    bird.addChild(beak);
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y);
    
    // flips Bird to face dir of x-vel
    if(vel.x < 0){
      scale(-1, 1);
    }
    shape(bird);
    popMatrix();
  }
  
  void update(){
    
    this.pos.x += vel.x;
    this.pos.y += vel.y;
    
    this.applyFlockAttraction();
    this.applyCenterAttraction();
    
    this.stayInFrame();
    this.speedLimit();  
    
  }

  void stayInFrame(){
    // keeps Bird within frame by flipping a velocity component
    
    if((pos.x + bWidth > width)||(pos.x-bWidth < 0)){
      vel.x = -vel.x;
      
      // update velocity with a boost to keep from getting stuck
      this.pos.x += 1.5*vel.x;
    }
    if((pos.y+bHeight > height)||(pos.y-bHeight < 0)){
      vel.y = -vel.y;
      
      // update velocity with a boost to keep from getting stuck
      this.pos.y += 1.5*vel.y;
    }
  }
  
  void speedLimit(){
    // limits vel components to maxSpeed
    // x-component
    if(vel.x > maxSpeed){
        vel.x = maxSpeed;
      }else if(vel.x < -maxSpeed){
        vel.x = -maxSpeed;
      }
      
    // y-component
    if(vel.y > maxSpeed){
      vel.y = maxSpeed;
    }else if(vel.y < -maxSpeed){
      vel.y = -maxSpeed;
    } 
  }
  
  void applyFlockAttraction(){
    // updates vel components toward the heading of Bird neighbors
    vel.x += (flockHeading.x - pos.x) * headingFactor;
    vel.y += (flockHeading.y - pos.y) * headingFactor;
  }
  
  void applyCenterAttraction(){
    // updates vel components toward center of screen
    vel.x += (width/2 - pos.x) * centerFactor;
    vel.y += (height/2 - pos.y) * centerFactor;
  }
   
}
