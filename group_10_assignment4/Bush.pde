class Bush{
  PVector coord;
  int rad;
  color c;
  color fc;
  int moveDelay;
  
  // universals for bush (constants)
  PShape body;
  int COUNT = 0;
  int DX = 5;
  int NUM_LEAVES = 30;
  
  // universals for flowers
  int FL_OFFSET;
  Flower f1;
  Flower f2;
  
  Bush(PVector coord, int rad, color c, color fc, int moveDelay){
    this.coord = coord;
    this.rad = rad;
    this.c = c;
    this.fc = fc;
    this.moveDelay = moveDelay;
    
    // flower inits
    FL_OFFSET = 3*rad/8;
    f1 = new Flower(new PVector(coord.x+FL_OFFSET+DX, coord.y-FL_OFFSET), rad/6, fc, moveDelay/3);
    f2 = new Flower(new PVector(coord.x-FL_OFFSET+DX, coord.y+FL_OFFSET), rad/6, fc, moveDelay/3);
  }
  
  void display(){
    // draw bush
    stroke(c);
    strokeWeight(20);
    
    pushMatrix();
    translate(coord.x+DX, coord.y);
    for(int i = 0; i < NUM_LEAVES; i++){  
      line(0, 0, rad, 0);
      rotate(2*PI/(NUM_LEAVES-1));
    }
    popMatrix();
    
    // display flowers
    f1.display();
    f2.display();
  }
  
  void update(){
    COUNT ++;
    // update x-vals of flowers to match bush
    f1.coord.x = coord.x+FL_OFFSET+DX;
    f2.coord.x = coord.x-FL_OFFSET+DX;
  
    if(COUNT == moveDelay){
      DX = - DX;
      COUNT = 0;
    }
    // update rotation of flowers
    f1.update();
    f2.update();
  } 
}
