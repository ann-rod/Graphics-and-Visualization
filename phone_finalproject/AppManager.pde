class AppManager{
  // defined at call
  ArrayList<App> apps;
  
  // Display Variables
  int appsPerRow = 4;
  int appsPerCol = 7;
  PVector iconSize, pad;
  
  AppManager(){
    // init array of apps
    this.apps = new ArrayList<App>();
    
    // dimensions of icons
    this.iconSize = new PVector(75, 75);
    
    // calculates padding to center apps on screen
    this.pad = new PVector((width-(this.appsPerRow*iconSize.x))/(this.appsPerRow+1),
                           (height-(this.appsPerCol*iconSize.y))/(this.appsPerCol+1));
    
    // calculate position of each app on screen
    this.calcAppPositions();
  }
  
  void run(){
    // display all icons
    displayIcons();
    
    // run app that was clicked on
    for(App a: apps){
      if(a.open){
        a.run();
      }
    }
  }
  
  void displayIcons(){
    // display all app icons
    for(App a:apps){
      a.displayIcon();
      
      // display app name under icon
      fill(255);
      textAlign(CENTER, TOP);
      text(a.name, a.pos.x+iconSize.x/2, a.pos.y+iconSize.y);
    }
  }
  
  void calcAppPositions(){
    // calculates the position of each app and assigns it
    float xCoord = pad.x;
    float yCoord = pad.y;
    
    // iterate through all apps in apps array
    for(int i = 0; i < apps.size(); i++){
      App a = apps.get(i);
      
      // resize icon to universal dimensions if not already right size
      if( (a.iconSize.x != iconSize.x) && (a.iconSize.y != iconSize.y)){
        a.icon.resize(int(iconSize.x), int(iconSize.y));
      }
      
      // display app icon at (xCoord, yCoord) and update xCoord
      a.pos.x = xCoord;
      a.pos.y = yCoord;
      xCoord += (pad.x + iconSize.x);
      
      // update Coords when new row starts
      if( (i+1) % appsPerRow == 0 ){
        yCoord += (pad.y + iconSize.y);
        xCoord = pad.x;
      }
    }
  }
  
  void addNewApp(App newApp){
    apps.add(newApp);
    this.calcAppPositions();
  }
  
  void deleteApp(App toDelete){
    // iter through apps to find toDelete and remove it
    for(App a:apps){
      if(a == toDelete){
        apps.remove(toDelete);
      }
    }
    this.calcAppPositions();
  }
  
}
