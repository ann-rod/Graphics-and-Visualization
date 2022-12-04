class PhotoLibrary{
  ArrayList<Photo> plib;
  
  // display variables
  PVector psize, pad;
  int picsPerRow = 7;
  int picsPerCol = 10;

  PhotoLibrary(){
    this.plib = new ArrayList<Photo>();
    
    // set vector values
    this.psize = new PVector(80, 80);
    this.pad = new PVector((width-(this.picsPerRow*psize.x))/(this.picsPerRow+1),
                           (height-(this.picsPerCol*psize.y))/(this.picsPerCol+1));
    // load photos from /Data/Photos/
    this.loadLibrary();
    
    // calc and assign icon placements
    // for library display
    this.calcPositions();
  }
  
  void run(){
    this.displayLibrary();
  }
  
  void displayLibrary(){
    for(Photo p: this.plib){
      p.display();
    }
  }
  
  void calcPositions(){
    float xCoord = pad.x;
    float yCoord = pad.y;
    
    // iterate through all photos in lib
    for(int i = 0; i < this.plib.size(); i++){
      Photo p = this.plib.get(i);
      
      // resize icon to universal dimensions if not already right size
      if((p.iconSize.x != this.psize.x) && (p.iconSize.y != this.psize.y)){
        p.photo.resize(int(this.psize.x), int(this.psize.y));
      }
      
      // display app icon at (xCoord, yCoord), and update xCoord
      p.pos.x = xCoord;
      p.pos.y = yCoord;
      xCoord += (this.pad.x + this.psize.x);
      
      // update appPos when new row starts
      if( (i+1) % this.picsPerRow == 0 ){
        yCoord += (this.pad.y + this.psize.y);
        xCoord = this.pad.x;
      }
    }
  }
  
  void loadLibrary(){
    // make a list of all filenames in photos directory
    File[] files = new File(sketchPath()+"/Data/Photos/").listFiles();
    
    for(File f:files){
      // make path and image to assign to new Photo object
      Path fpath = Paths.get(f.getPath());
      String spath = "Photos/"+fpath.getFileName();
      PImage i = loadImage(spath);
      
      if(i != null){
        // make new Photo with the info and add to the library
        Photo p = new Photo(i, spath.substring(7));
        this.plib.add(p);
      }
    }
  }
  
  void addNewPhoto(Photo ph){
    this.plib.add(ph);
    this.calcPositions();
  }
  
}
