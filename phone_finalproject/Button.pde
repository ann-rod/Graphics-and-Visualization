class Button{
  String title;
  PVector pos, size;
  color c;
  
  // status bool
  Boolean on = false;
  
  Button(String title, PVector pos, PVector size, color c){
    this.title = title;
    this.pos = pos;
    this.size = size;
    this.c = c;
  }
  
  void display(){
    // simple rectangular button with label
    fill(c);
    rectMode(CORNER);
    rect(pos.x, pos.y, size.x, size.y);
    
    // show label
    fill(255);
    textAlign(CENTER, CENTER);
    text(title, pos.x+size.x/2, pos.y+size.y/2-2);
  }
  
  void checkIfClicked(float mx, float my){
    // returns true if click happened within button bounds
    if((pos.x < mx && mx < pos.x+size.x)&& 
       (pos.y <= my && my <= pos.y+size.y)){
      this.on = true;
    }else{
      this.on = false;
    }
  }
  
}
