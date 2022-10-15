class LandingGear{
  Plane plane;
  PShape landgear;
  PVector coord, forward, up;
  float scale;
  float upRate;
  
  boolean landingGearOut = true;
  boolean goingUp = false;
  int distCount, upCount = 0;
  float dy = 0;
  
  LandingGear(Plane plane, PVector coord, PVector forward, PVector up, float scale, float upRate){
    this.plane = plane;
    this.coord = coord;
    this.forward = forward;
    this.up = up;
    this.scale = scale;
    this.upRate = upRate;
    
    // define landing gear graphic
    landgear = loadShape("Airliner 757 landing gear (base colour).obj");
    landgear.scale(.9 * this.scale);
    landgear.translate(0, 0, -5);
  }
  
  void display(){
    pushMatrix();
    rotateY(HALF_PI);
    shape(landgear, coord.x, coord.y+dy, landgear.width, landgear.height);
    popMatrix();
  }
  
  void update(){
    // move landing gear forward in same direction as plane-forward
    landgear.translate(0,0,1);
    distCount++;
    
    // move landing gear up at same rate as plane
    if(goingUp){
      landgear.translate(0, upRate*up.z, 0);
      upCount++;
      
      // bring up landing gear into plane when mid-air
      dy+= 0.05;
      if(dy >= 1){
        dy = 1;
      }
    }
  }
  
  void reset(){
    landgear.translate(0,-upRate*upCount, -distCount);
    upCount = 0;
    distCount = 0;
    dy = 0;
    this.goingUp = false;
  }
  
}
