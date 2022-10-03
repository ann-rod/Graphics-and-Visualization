Bee b1;
Bee b2;
Wings w1;
Wings w2;

void setup(){
  size(1000,800);
  background(255,255,255);
  b1 = new Bee(990,700,1,4);
  b2 = new Bee(890,700,2,3);
  w1 = new Wings(990,700,1,4);
  w2 = new Wings(890,700,2,3);
  
  
  /*bee = createShape(GROUP);
  size(1000,800);
  background(255,255,255);
  
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
  wing1 = createShape(ARC,-108,0,130,110,radians(48),radians(225));
  //arc(0,-25,130,110,radians(48),radians(232));
  rotate(radians(10));
  wing2 = createShape(ARC,-90,-40,130,110,radians(70),radians(312));
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
  wing1.rotate(radians(110));
  bee.addChild(wing1);
  wing2.rotate(radians(110));
  bee.addChild(wing2);
  */
  
  
  
  


}
void draw(){
  background(255,255,255);
  w1.display();
  w2.display();
  w1.update();
  w2.update();
  
  b1.display();
  b1.update();
  b2.display();
  b2.update();
  
  
  println(mouseX + " : " + mouseY);
  
 
  
  
  
  
}
