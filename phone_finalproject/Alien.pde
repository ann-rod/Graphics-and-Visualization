class Alien{
  // Stats
  int HP = 2; // changes colors when hit, dies on second hit
  boolean frontRow = false;
  
  // visuals
  PVector pos;
  float scaler;
  PShape alien, wings, body, eyes, fangs;
  color green = color(0, 255, 0);
  color pink = color(255, 0, 255);
  
  // movement
  int amountMovedDown = 0;
  // float alienSpeed = .025;
  float alienSpeed = .08;
  boolean sweep = false;

  Alien(PVector pos, float scaler){
    this.pos = pos;
    this.scaler = scaler;
    
    // create the alien PImage
    this.createVisual();
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y);
    shape(alien);
    popMatrix();
  }
  
  void update(){
    
    // move down into position when spawned
    if(amountMovedDown < (height/4)){
      this.pos.y += 1;
      amountMovedDown += 1;
    }else{
      // move down slowly after spawn movement is done
      this.pos.y += alienSpeed;
    }
    
    // damage updater
    if(HP < 2){
      this.showDamage();
    }
    
  }
  
  void showDamage(){
    // change colors when at 1 HP to show damage was taken
    body.setFill(pink);
    wings.setFill(green);
    eyes.setFill(color(255,0,0));
    fangs.setFill(green);
  }
  
  
  void createVisual(){
    // create the body
    body = createShape();
    body.beginShape();
    body.strokeWeight(2);
    body.fill(green);
    body.vertex(-4*scaler, 0);
    body.vertex(-1.5*scaler, -1.5*scaler);
    body.vertex(-.5*scaler, -4*scaler);
    body.vertex(.5*scaler, -4*scaler);
    body.vertex(1.5*scaler, -1.5*scaler);
    body.vertex(4*scaler, 0);
    body.vertex(1*scaler, 3*scaler);
    body.vertex(-1*scaler, 3*scaler);
    body.vertex(-4*scaler, 0);
    body.endShape();
    
    // create the wings
    wings = createShape();
    wings.beginShape();
    wings.strokeWeight(2);
    wings.fill(pink);
    wings.vertex(0, -2*scaler);
    wings.vertex(-2*scaler, 0);
    wings.vertex(-3*scaler, -3*scaler);
    wings.vertex(0, -2*scaler);
    wings.vertex(3*scaler, -3*scaler);
    wings.vertex(2*scaler, 0);
    wings.vertex(0, -2*scaler);
    wings.endShape();
    
    // create the eyes
    eyes = createShape();
    eyes.beginShape();
    eyes.strokeWeight(2);
    eyes.fill(pink);
    eyes.vertex(0, 1*scaler);
    eyes.vertex(-1*scaler, 3*scaler);
    eyes.vertex(-4*scaler, 0);
    eyes.vertex(0, 1*scaler);
    eyes.vertex(4*scaler, 0);
    eyes.vertex(1*scaler, 3*scaler);
    eyes.vertex(0, 1*scaler);
    eyes.endShape();
    
    // create the fangs
    fangs = createShape();
    fangs.beginShape();
    fangs.strokeWeight(1);
    fangs.fill(pink);
    fangs.vertex(-.5*scaler, 3*scaler);
    fangs.vertex(-.5*scaler, 4*scaler);
    fangs.vertex(-1*scaler, 3*scaler);
    fangs.vertex(1*scaler, 3*scaler);
    fangs.vertex(.5*scaler, 4*scaler);
    fangs.vertex(.5*scaler, 3*scaler);
    fangs.vertex(-.5*scaler, 3*scaler);
    fangs.endShape();
    
    // add all parts into group for display
    alien = createShape(GROUP);
    alien.addChild(wings);
    alien.addChild(body);
    alien.addChild(eyes);
    alien.addChild(fangs);
  }
  
}
