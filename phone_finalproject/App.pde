class App{
  // defined at call
  String name;
  PImage icon;
  
  // status
  boolean open = false;
  
  // GLOBAL VARIABLES
  PVector iconSize = new PVector(75, 75);
  
  // changes once app manager assigns it a position
  PVector pos = new PVector(0,0);
  
  App(String name, PImage icon){
    this.name = name;
    this.icon = icon;
    
    // resize icon to a uniform size
    this.icon.resize(int(iconSize.x), int(iconSize.y));
  }
  
  void displayIcon(){
    image(icon, pos.x, pos.y);
  }
  
  void checkIfClicked(int mx, int my){
    // returns true if mouse click happened
    // within bounds of icon
    if((pos.x < mx && mx < pos.x+iconSize.x)&& 
       (pos.y <= my && my <= pos.y+iconSize.y)){
      // opens the app if it was clicked on
      this.open = true;
    }
  }
  
  void run(){
    if(this.open){
      // code to run the app.
      // changes for every app
    }
  }
  
  void closeApp(){
    this.open = false;
  }
  
}
