import java.util.ArrayList;

Ecosystem system;
int numHawks = 5;
int numBirds;
int numBees;

void setup() {
  size(1500, 900);
  frameRate(60);
  
  system = new Ecosystem(numHawks, numBirds, numBees);
  
  
  
  
  
}

void draw() {
  
  
  
  
}


void keyPressed() {
  if (key == 'h') {
    system.createHawks(1); 
  }
  
  
  
  
}
