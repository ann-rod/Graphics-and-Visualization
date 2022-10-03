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

color bushFill = color(88, 131, 90);
color []flowerFill = {color(171, 82, 198), color(165, 70, 84), color(196, 80, 38)};
Bush bush1;
Bush bush2;
Bush bush3;

Bee b1;
Bee b2;
Wings w1;
Wings w2;



void setup() {
  size(1000,800); 
  background(color(#87CEEB)); 
  sun = new Sun(new PVector(20,20), .01);
  
  bush1 = new Bush(new PVector(500, 540), 65, bushFill, flowerFill[0], 55);
  bush2 = new Bush(new PVector(200,575), 80, bushFill, flowerFill[1], 60);
  bush3 = new Bush(new PVector(800,575), 80, bushFill, flowerFill[2], 65);

  vehiclePos1 = new PVector(-400, 700);
  vehicleSpeed1 = new PVector(5, 0);
  sedan1 = new Sedan(vehiclePos1, vehicleSpeed1, color(#0A78FA));
  
  vehiclePos2 = new PVector(-1400, 650);
  vehicleSpeed2 = new PVector(3, 0);
  sedan2 = new Sedan(vehiclePos2, vehicleSpeed2, color(#89E36C));
  sedan2.body.scale(-1,1);
  
  b1 = new Bee(990,700,1,4);
  b2 = new Bee(890,700,2,3);
  w1 = new Wings(990,700,1,4);
  w2 = new Wings(890,700,2,3);
  
  
}

void draw() {
  background(color(#87CEEB)); 
  makeRoad();
  makeRoadside();
  sun.display();
  
  bush1.display();
  bush2.display();
  bush3.display();
  bush1.update();
  bush2.update();
  bush3.update();
  
  w1.display();
  w2.display();
  w1.update();
  w2.update();
  
  b1.display();
  b1.update();
  b2.display();
  b2.update();
  
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
