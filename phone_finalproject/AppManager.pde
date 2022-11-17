class AppManager{
  // defined at call
  ArrayList<App> apps;
  
  // Display Variables
  int appsPerRow = 4;
  int appsPerCol = 7;
  PVector iconSize, pad, appPos;
  
  AppManager(){
    // init array of apps
    this.apps = new ArrayList<App>();
    
    // dimensions of icons
    this.iconSize = new PVector(75, 75);
    
    // calculates padding to center apps on screen
    this.pad = new PVector((width-(this.appsPerRow*iconSize.x))/(this.appsPerRow+1),
                           (height-(this.appsPerCol*iconSize.y))/(this.appsPerCol+1));
    
    // pass to apps to display at this position
    this.appPos = new PVector(pad.x, pad.y);
  }
  
  void run(){
    displayIcons();
    for(App a: apps){
      if(a.open){
        a.run();
        //hm.open = false;
      }
    }
  }
  
  void displayIcons(){
    // iterate through all apps in apps array
    for(int i = 0; i < apps.size(); i++){
      App a = apps.get(i);
      
      // resize icon to universal dimensions if not already right size
      if( (a.iconSize.x != iconSize.x) && (a.iconSize.y != iconSize.y)){
        a.icon.resize(int(iconSize.x), int(iconSize.y));
      }
      
      // display app icon at appPos and update appPos.x
      a.pos = appPos;
      a.displayIcon();
      textAlign(CENTER, TOP);
      text(a.name, appPos.x+iconSize.x/2, appPos.y+iconSize.y);
      appPos.x += (pad.x + iconSize.x);
      
      // update appPos when new row starts
      if( (i+1) % appsPerRow == 0 ){
        appPos.y += (pad.y + iconSize.y);
        appPos.x = pad.x;
      }
    }
    // reset appPos
    appPos.x = pad.x;
    appPos.y = pad.y;
  }
  
  void addNewApp(App newApp){
    apps.add(newApp);
  }
  
  void deleteApp(App toDelete){
    // iter through apps to find toDelete
    for(App a:apps){
      if(a == toDelete){
        apps.remove(toDelete);
      }
    }
  }
  
}
