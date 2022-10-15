class Plane{
  PShape plane;
  PVector coord, lgCoord, forward, up;
  int distForward;
  LandingGear landgear;
  float scale, startCoord;
  
  int distCount, upCount = 0;
  float dy = 0;
  int LG_OFFSET = -4;
  float UP_RATE = 0.2;
  
  Plane(PVector coord, PVector forward, PVector up, float scale, int distForward){
    this.coord = coord;
    this.forward = forward;
    this.up = up;
    this.scale = scale;
    this.distForward = distForward;
    
    startCoord = coord.y;
    
    // define plane graphic
    plane = loadShape("VLJ19OBJ.obj");
    plane.scale(9 * this.scale);
    
    // define landgear with new coord. system
    lgCoord = new PVector(this.coord.x, this.coord.y+LG_OFFSET);
    landgear = new LandingGear(this, lgCoord, this.forward, this.up, this.scale, UP_RATE);
  }
  
  void display(){
    pushMatrix();
    rotateX(-HALF_PI);
    rotateZ(HALF_PI);
    shape(plane, this.coord.x, this.coord.y, plane.width, plane.height);
    popMatrix();
    
    landgear.display();
  }
  
  
  void update(){
    // moves the plane in the +z direction
    this.coord.y -= 1;
    landgear.update();
    
    // moves the plane upward after distForward has been reached
    if(abs(this.coord.y) > abs(distForward)){
      plane.translate(UP_RATE*up.x, UP_RATE*up.y, UP_RATE*up.z);
      landgear.goingUp = true;
      upCount ++;
    }
    
    // resets plane and landing gear positions when reaching 2*distForward
    if(abs(this.coord.y) > 2*abs(distForward)){
      plane.translate(-UP_RATE*upCount*up.x, -UP_RATE*upCount*up.y, -UP_RATE*upCount*up.z);
      this.coord.y = startCoord;
      landgear.reset();
      distCount = 0;
      upCount = 0;
    }
    distCount++;
  }  
  
}
