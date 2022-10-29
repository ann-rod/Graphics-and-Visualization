class Bird{
  PVector pos;
  PVector vel;
  PVector flockHeading;
  
  // Bird Life Cycle Vars
  boolean canDie = true;
  boolean canReproduce = false;
  int numBeesEaten = 0;
  
  // Bird visuals
  PShape bird;
  color birdFill = color(0, 0, 0);
  color yellow = color(203, 167, 47);
  int bWidth = 15;
  int bHeight = 7;
  
  // Bird Movement Vars
  float maxSpeed = 10;
  float centerFactor = 0.000005;
  float chaseFactor = 0.0005;
  float fearFactor = 0.00005; 
  float headingFactor = 0.0005;
  
  // Other Animal Interactions
  ArrayList<Bee> preyList;
  float preyRad = 10;
  ArrayList<Hawk> predList;
  float predRad = 10;
  
  Bird(PVector pos, PVector vel){
    this.pos = pos;
    this.vel = vel;
    
    this.flockHeading = new PVector(0, 0);
    this.createBody();
    
    predList = new ArrayList<Hawk>();
    preyList = new ArrayList<Bee>();
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
    this.applyPredRepulsion();
    //this.applyPreyAttraction();
    
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
  
  
  void applyPredRepulsion(){
    // finds all predators within a certain window and applies
    // a negative force on Bird 
    if(predList.size() > 0){
      for(Hawk h : predList){
        if((pos.x - predRad/2 < h.pos.x) || (h.pos.x < pos.x + predRad/2)){
          if((pos.y - predRad/2 < h.pos.y) || (h.pos.y < pos.y + predRad/2)){
            vel.x += -(h.pos.x - pos.x) * fearFactor;
            vel.y += -(h.pos.y - pos.y) * fearFactor;
          }
        }
      }
    }
  }
  
  void applyPreyAttraction(){
    // finds all prey within a certain window and applies
    // a force on Bird towards some prey
    if(predList.size() > 0){
      for(Bee bee : preyList){
        if((pos.x - preyRad/2 < bee.pos.x) || (bee.pos.x < pos.x + preyRad/2)){
          if((pos.y - preyRad/2 < bee.pos.y) || (bee.pos.y < pos.y + preyRad/2)){
            vel.x += (bee.pos.x - pos.x) * chaseFactor;
            vel.y += (bee.pos.y - pos.y) * chaseFactor;
          }
        }
      }
    }
    
  }
     
}
