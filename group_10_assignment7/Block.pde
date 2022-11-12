class Block{
  
  PVector pos;
  int dim = 3;
  PShape block;
  float xspeed = 1;
  int totalTime = 5000;
  int savedTime = millis();
  Block(PVector pos) {
    block = createShape(RECT, 0,0,dim,dim);
    this.pos = pos;
    this.block.setFill(#0CF033);
    this.block.setStroke(#0CF033);
    
    
    
    
  }
  void display(){
    this.block.setFill(#0CF033);
    this.block.setStroke(#0CF033);
    shape(block,this.pos.x,this.pos.y);
    
    
  }
  
  void update(){
    int passedTime = millis() - savedTime;
    if(passedTime > totalTime){
      this.pos.x += xspeed * 50;
      xspeed *= -1;
      savedTime = millis();
    }
    
      
    
  }
  
  
}
