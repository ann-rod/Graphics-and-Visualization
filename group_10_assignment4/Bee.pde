class Bee {
  PShape bee;
  PShape body;
  PShape arc1;
  PShape arc2;
  PShape arc3;
  PShape eye;
  PShape stinger;
  //PShape wing1;
  //PShape wing2;
  float xpos, ypos, xspeed, yspeed;
  
  Bee(float xpos, float ypos, float xspeed, float yspeed) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    
  
  bee = createShape(GROUP);
  pushMatrix();
  fill(255,255,0);
  translate(500,200);
  rotate(.32);
  strokeWeight(3);
  body = createShape(ELLIPSE,0,0,200,138);
  noFill();
  arc1 = createShape(ARC, -120,10,200,180,radians(-48.5),radians(36));
  arc2 = createShape(ARC,-80,10,200,300,radians(-31),radians(23));
  arc3 = createShape(ARC,-38,10,200,300,radians(-27.5),radians(18));
  fill(0);
  stinger = createShape(TRIANGLE,100,0,120,8, 100,10);
  popMatrix();
  
  eye = createShape(ELLIPSE,-60,-40,25,25);
  
  pushMatrix();
  //fill(245,245,245);
  noFill();
  
  translate(515,90);
  rotate(radians(110));
  //wing1 = createShape(ARC,-108,0,130,110,radians(48),radians(225));
  //arc(0,-25,130,110,radians(48),radians(232));
  rotate(radians(10));
  //wing2 = createShape(ARC,-90,-40,130,110,radians(70),radians(312));
  //arc(15,-70,130,110,radians(70),radians(300));
  popMatrix();
  //circle(480,127,5); //180 x 77 y
  //circle(441,247,5);
  //noFill();
  //curve(300, 50, 480, 127, 441, 247, 300, 90);
  body.rotate(.32);
  bee.addChild(body);
  arc1.rotate(.32);
  bee.addChild(arc1);
  arc2.rotate(.32);
  bee.addChild(arc2);
  arc3.rotate(.32);
  bee.addChild(arc3);
  stinger.rotate(.32);
  bee.addChild(stinger);
  bee.addChild(eye);
  /*wing1.rotate(radians(110));
  bee.addChild(wing1);
  wing2.rotate(radians(110));
  bee.addChild(wing2);*/
  bee.scale(.2);
  }
  

  void display(){
    shape(bee,xpos,ypos);
    
    
  }
  void update(){
    xpos = xpos - xspeed;
    if(xpos < -10){
      xpos = 1000;
      
    }
    
    ypos = ypos + yspeed;
    
    if(ypos >= 700 && ypos > 775){
      yspeed = -1 * yspeed;
      
      
      
    }
    
    if(ypos < 700 && ypos > 625){
      yspeed = -1* yspeed;
    }
      
      
    
    
  }
 
  
  
}


class Wings{
  PShape wing1;
  PShape wing2;
  PShape wings;
  float xpos, ypos, xspeed, yspeed;
  
  Wings(float xpos, float ypos, float xspeed, float yspeed){
    this.xpos = xpos;
    this.ypos = ypos;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    
    wings = createShape(GROUP);
    
    wing1 = createShape(ARC,-108,0,130,110,radians(48),radians(225));
    wing2 = createShape(ARC,-90,-40,130,110,radians(70),radians(312));
    
    wing1.rotate(radians(110));
    wings.addChild(wing1);
    wing2.rotate(radians(110));
    wings.addChild(wing2);
    wings.scale(.2);
    
    
    
    
    
  }
  
  void display(){
    wings.setFill(color(255,255,255));
    wings.rotate(PI);
    
    
    shape(wings,xpos,ypos);
  
  
  
  
}

void update(){
  wings.rotate(radians(360));
    xpos = xpos - xspeed;
    if(xpos < -10){
      xpos = 1000;
      
    }
    
    ypos = ypos + yspeed;
    
    if(ypos >= 700 && ypos > 775){
      yspeed = -1 * yspeed;
      
      
      
    }
    
    if(ypos < 700 && ypos > 625){
      yspeed = -1* yspeed;
    }
      
      
    
    
  }

}
