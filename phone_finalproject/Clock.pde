class Clock {
  float secrad;
  float minrad;
  float hrrad;
  PVector center;
  int rad;
  
  Clock() {
    secrad = .7;
    minrad = .6;
    hrrad = .45;
    center = new PVector(width/2, height/2-250);
    rad = 180;
  
  }
  
  void display() {
    ellipseMode(RADIUS);
    ellipse(center.x, center.y, rad, rad);
    for(int i=0; i<12; i++) {
      float theta = 2*PI*i/12; 
      line(center.x+.8*rad*cos(theta), center.y + .8*rad*sin(theta), center.x+.95*rad*cos(theta), center.y+.95*rad*sin(theta));
    }
    
    for(int j=0; j<60; j++) {
      float theta = 2*PI*j/60;
      line(center.x+.9*rad*cos(theta), center.y + .9*rad*sin(theta), center.x+.95*rad*cos(theta), center.y+.95*rad*sin(theta));

    }
    
    float seconds = 2*PI*second()/60 - HALF_PI;
    float minutes = 2*PI*(minute() + norm(second(), 0, 60))/60 - HALF_PI; 
    float hours = 4*PI*(hour() + norm(minute(), 0, 60))/24 - HALF_PI;
    
    stroke(#FA2D2D);
    line(center.x, center.y, center.x+secrad*rad*cos(seconds), center.y+secrad*rad*sin(seconds));
    stroke(0);
    line(center.x, center.y, center.x+minrad*rad*cos(minutes), center.y+minrad*rad*sin(minutes));
    line(center.x, center.y, center.x+hrrad*rad*cos(hours), center.y+hrrad*rad*sin(hours));

    
  }
  
  
  
  
}
