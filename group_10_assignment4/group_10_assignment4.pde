Wheel w1;
int globalTime = 0;
PVector pos1;
PVector speed1;

void setup() {
  size(1000,800); 
  pos1 = new PVector(40, 745);
  speed1 = new PVector(3, 0);
  
  w1 = new Wheel(pos1, .03);
}

void draw() {
  background(color(#87CEEB)); 
  makeRoad();
  
  vehicleUpdate();
  
  if (globalTime % 300 == 0) {
    w1.wheel.resetMatrix();
  }
  
  globalTime++;
  
  
}

void makeRoad() {
  //road
  fill(40);
  stroke(0);  
  rect(0,700,1000,300);
  
  fill(#FFFF33);
  strokeWeight(4);
  for (int i=50; i < 901; i += 200 ) {
    rect(i, 745, 100, 10);
  }
  
}

void vehicleUpdate() {
  w1.display();
  w1.wheel.translate(speed1.x, speed1.y);
}
