import java.util.ArrayList;

Ecosystem ecosystem;

int numHawks = 0;
int numBirds = 10;
int numBees = 0;

void setup() {
  size(1500, 900);
  frameRate(60);
  
  ecosystem = new Ecosystem(numHawks, numBirds, numBees);
  
}

void draw() {
  background(255);
  ecosystem.update();
  
}


void keyPressed() {
  
  if (key == 'H' || key == 'h') {
    ecosystem.createHawks(1); 
  }
  
  if(keyCode == 'R' || keyCode == 'r'){
    boolean setupMode = false;
    ecosystem.spawnBird(setupMode);
  }
  
  if(keyCode == 'B' || keyCode == 'b'){
    // spawn bee
  }
 
  
}
