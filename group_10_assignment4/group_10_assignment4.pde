int globalTime = 0;
Sun sun;

int localVehicleTime = 0;
Sedan sedan1;
Sedan sedan2;
PVector vehiclePos1;
PVector vehicleSpeed1;
PVector vehiclePos2;
PVector vehicleSpeed2;
PVector brakeSpeed = new PVector(0,0);

void setup() {
  size(1000,800); 
  background(color(#87CEEB)); 
  sun = new Sun(new PVector(20,20), .01);

  vehiclePos1 = new PVector(-400, 700);
  vehicleSpeed1 = new PVector(5, 0);
  sedan1 = new Sedan(vehiclePos1, vehicleSpeed1, color(#0A78FA));
  
  vehiclePos2 = new PVector(-1400, 650);
  vehicleSpeed2 = new PVector(3, 0);
  sedan2 = new Sedan(vehiclePos2, vehicleSpeed2, color(#89E36C));
  sedan2.body.scale(-1,1);
  
}

void draw() {
  background(color(#87CEEB)); 
  makeRoad();
  makeRoadside();
  sun.display();
  
  vehicleUpdate();
  
  
  
  globalTime++;
  localVehicleTime++;
}

void makeRoad() {
  //road
  fill(40);
  stroke(0);  
  rect(0,700,1000,100);
  
  //stripes
  fill(#FFFF33);
  strokeWeight(4);
  for (int i=50; i < 901; i += 200 ) {
    rect(i, 745, 100, 10);
  }
}

void makeRoadside() {
  fill(#EDC9AF);
  noStroke();
  rect(0, 500, 1000, 200);
  stroke(1);
}

void vehicleUpdate() {
  sedan2.display();
  sedan2.move();
  
  sedan1.display();
  sedan1.move();
  
  if (globalTime % (8*60) == 0) {
    sedan1.body.resetMatrix(); 
    sedan2.body.resetMatrix();
    sedan2.body.scale(-1,1);
    localVehicleTime = 0;
  }
  
  if ((localVehicleTime % 200 > 10) && (localVehicleTime % 200 < 70)) {
    sedan1.setSpeed(brakeSpeed);
    sedan1.brakelightOn();
  }
  else {
    sedan1.setSpeed(vehicleSpeed1);
    sedan1.brakelightOff();
  }
  
  
  
  
}
