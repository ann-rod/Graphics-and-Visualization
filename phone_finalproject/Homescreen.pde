class Homescreen{
  // status
  boolean open = false;
  
  // defined at call
  PImage bgImage;
  AppManager am;
  
  // default settings
  color defaultBGColor = color(210, 210, 210);
  PFont font = createFont("Fonts/SF-Pro.ttf", 14);
  
  Homescreen(){
    this.bgImage = this.makeDefaultBG();
    this.am = new AppManager();
  }
  
  void run(){
    if(this.open){
      // display the background image
      image(bgImage, 0, 0);
      
      // make font uniform for everything inside phone
      textFont(font);
      
      // run the app manager
      am.run();
    }
  }
  
  void changeBG(PImage newBG){
    this.bgImage = newBG;
    this.bgImage.resize(width,height);
  }
  
  PImage makeDefaultBG(){
    // create blank image
    PImage defaultBG = createImage(width, height, RGB);
    
    // fill image with default color
    defaultBG.loadPixels();
    for(int p = 0; p < defaultBG.pixels.length; p++){
      defaultBG.pixels[p] = defaultBGColor;
    }
    defaultBG.updatePixels();
    return defaultBG;
  }
  
}
