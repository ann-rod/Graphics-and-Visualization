class Star{
  PVector pos;
  float rad;
  
  Star(PVector pos, float rad){
    this.pos = pos;
    this.rad = rad;
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, rad, rad);
  }
}
