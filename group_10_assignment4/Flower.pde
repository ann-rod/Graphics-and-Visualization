class Flower{
  PVector coord;
  float rad;
  color pc;
  int moveDelay;
  
  // flower constants
  color CEN_COL = color(224, 199, 95);
  int COUNT = 0;
  int NUM_PETALS = 5;
  float OFFSET = rad/2;
  float RADX = 4;
  
  Flower(PVector coord, float rad, color pc, int moveDelay){
    this.coord = coord;
    this.rad = rad;
    this.pc = pc;
    this.moveDelay = moveDelay;
  }

  void display(){
   // draw petals
    stroke(pc);
    strokeWeight(rad);
    
    pushMatrix();
    translate(coord.x, coord.y);
    for(int i = 0; i < NUM_PETALS; i++){  
      line(0, 0, rad, RADX);
      rotate((2*PI)/(NUM_PETALS));
    }
    popMatrix();
    
    // draw center of flower
    pushMatrix();
    noStroke();
    fill(CEN_COL);
    ellipse(coord.x, coord.y, rad, rad);
    popMatrix();
  }
  
  void update(){
    COUNT++;
    
    if(COUNT == moveDelay){
      RADX = -RADX;
      COUNT = 0;
    }
  } 
}
