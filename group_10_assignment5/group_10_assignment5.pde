PShape tow_shape;
Vehicle airport_tow;
PShape box1;




void createTow() {
  tow_shape = loadShape("Airport_tow.obj");
  airport_tow = new Vehicle(tow_shape, 50, new PVector(width/2,height/2,0), new PVector(2,0,4));
}

void updateTow() {
  airport_tow.display();
  airport_tow.path1();
}
