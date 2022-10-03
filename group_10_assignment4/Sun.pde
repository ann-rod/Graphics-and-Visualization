class Sun {
  PVector pos;
  float rot_speed;
  PVector[] rays = new PVector[12];
  
  Sun(PVector p, float theta) {
    this.pos = p;
    this.rot_speed = theta;
    
    makeRays();
    

  }
  
  void display() {
    fill(#FAEE0A);
    stroke(#FAEE0A);
    
    ellipse(pos.x, pos.y, 120, 120);
     
    for (int i=0; i<12;i++) {
      line(this.pos.x + 80*rays[i].x, this.pos.y + 80*rays[i].y, this.pos.x + 110*rays[i].x, this.pos.y + 110*rays[i].y);
      rays[i].rotate(this.rot_speed);
    }
     
     
     
     
  }
  
  void makeRays() {     
     for (int i = 0; i < 12; i++) {
        rays[i] = new PVector(cos(i * PI / 6), sin( i * PI / 6));
     }
  }
  
  
  
  
}
