class Photo{
  // status
  Boolean open = false;
  
  PImage photo, icon;
  String filename;
  PVector pos, iconSize;
  
  Photo(PImage photo, String filename){
    this.photo = photo;
    this.icon = photo;
    this.filename = filename;
    
    // define pvectors
    this.iconSize = new PVector(80,80);
    this.pos = new PVector(0,0);
    
    // make icon image into icon size
    this.icon.resize(int(iconSize.x), int(iconSize.y));
  }
  
  void display(){
    image(icon, pos.x, pos.y);
  }
  
  void checkIfClicked(int mx, int my){
    // returns true if click happened within icon bounds
    if((this.pos.x < mx && mx < this.pos.x+this.iconSize.x)&& 
       (this.pos.y <= my && my <= this.pos.y+this.iconSize.y)){
      // opens the app if it was clicked on
      this.open = true;
    }
  }

}
