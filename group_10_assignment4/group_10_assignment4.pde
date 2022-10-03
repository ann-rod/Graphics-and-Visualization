int globalTime = 0;
Sun sun;

Sedan sedan1;
PVector vehiclePos;
PVector vehicleSpeed;

float animationLength = 8;


void setup() {
  size(1000,800); 
  background(color(#87CEEB)); 
  sun = new Sun(new PVector(20,20), .01);

  vehiclePos = new PVector(-400, 700);
  vehicleSpeed = new PVector(3, 0);
  sedan1 = new Sedan(vehiclePos, vehicleSpeed, color(#0A78FA));
  
  
  
}

void draw() {
  background(color(#87CEEB)); 
  makeRoad();
  sun.display();
  
  vehicleUpdate();

  
  if (globalTime % (animationLength*60) == 0) {
    sedan1.body.resetMatrix();
    //sedan1.toggleBrakeLight();
  }
  
  globalTime++;
}

void makeRoad() {
  //road
  fill(40);
  stroke(0);  
  rect(0,700,1000,300);
  
  //stripes
  fill(#FFFF33);
  strokeWeight(4);
  for (int i=50; i < 901; i += 200 ) {
    rect(i, 745, 100, 10);
  }
}

void vehicleUpdate() {
  sedan1.display();
  sedan1.move();
}
