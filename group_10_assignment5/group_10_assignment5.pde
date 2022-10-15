PVector center, eye, up;

PVector coord, forward, planeUp;
Plane p1;

PShape tow_shape;
Vehicle airport_tow;

float x,y,z;
Forklift fork;
road c1;
Box box1;
int savedTime;


void setup(){
  size(800, 800, P3D);
  frameRate(60);
  lights();
  
  center = new PVector(0, 0,0);
  eye = new PVector(350, -10, 150);
  up = new PVector(0, -1, 0);
  camera(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
  
  coord = new PVector(0, 0, 0);
  forward = new PVector(0, -1, 0);
  planeUp = new PVector(0, 0, 1);
  p1 = new Plane(coord, forward, planeUp, 1, 150);
  
  createTow();
  
  c1 = new road(0,0,500);
  fork = new Forklift(0,0,220,0.01,0.00001);
  box1 = new Box(0,0,220,0.01,0.00001);
  
  x = width/2;
  y = height/2;
  z = 0;
}

void draw(){
  background(255);
  
  p1.display();
  p1.update();
  
  updateTow();
  
  pushMatrix();
  translate(x,y,z);
  c1.display();
  pushMatrix();
  if(millis()>1460){
  fork.update();
  fork.display();
  }
  popMatrix();
  box1.move();
  box1.display();
  popMatrix();
}

void createTow() {
  tow_shape = loadShape("Airport_tow.obj");
  airport_tow = new Vehicle(tow_shape, 50, new PVector(-1000,-height +400,width/2), new PVector(2,0,2));
}

void updateTow() {
  airport_tow.display();
  airport_tow.path1();
}
