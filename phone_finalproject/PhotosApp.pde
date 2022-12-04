class PhotosApp extends App{
  PhotoLibrary lib;
  PhotoEditor ed;
  
  // editor status
  Boolean toggleEditor = false;
  
  // button stuff
  ArrayList<Button> buttonArr;
  color buttonCol = color(120, 160, 195);
  PVector buttonSize, buttonPad;
  
  PhotosApp(String name, PImage icon){
    super(name, icon);
    
    // init library and editor
    this.lib = new PhotoLibrary();
    this.ed = new PhotoEditor();
    
    // set button variable values
    this.buttonSize = new PVector(60, 30);
    this.buttonPad = new PVector(5, 5);
    
    // init button array and add save/back buttons
    buttonArr = new ArrayList<Button>();
    buttonArr.add(new Button("Save", new PVector(width-buttonSize.x-buttonPad.x,
                             buttonPad.y), buttonSize, buttonCol));
    buttonArr.add(new Button("Back", new PVector(buttonPad.x, buttonPad.y),
                             buttonSize, buttonCol) );

  }
  
  void run(){
    if(this.open){
      background(235);
      
      // runs library or editor
      if(!this.toggleEditor){
        // library stuff
        this.lib.run();
        this.checkForClickedPhoto();
      }else{
        // editor stuff
        this.ed.run();
        this.displayEdButtons();
        this.checkEdButtons();
      }
    }
  }
  
  void checkForClickedPhoto(){
    // checks photo statuses
    for(Photo p: this.lib.plib){
      if(p.open){
        // sends the current photo to the editor
        this.ed.setCurrentPhoto(p);
        // toggle open editor
        this.toggleEditor = !this.toggleEditor;
      }
    }
  }
  
  void displayEdButtons(){
    for(Button b: buttonArr){
      b.display();
    }
  }
  
  void checkEdButtons(){
    // checks if editor buttons were clicked on
    for(int i = 0; i < buttonArr.size(); i++){
      Button b = buttonArr.get(i);
       
      // user clicked on save button
      if(b.on && i == 0){
        // turn off to reuse when next clicked
        b.on = !b.on;
        
        // run saving function
        this.saveNewPhoto();
      }
      
      // user clicked on back button
      if(b.on && i==1){ 
        
        // turn off to reuse when next clicked
        b.on = !b.on;
        
        // close out of editor
        this.closeOpenPhoto();
        this.toggleEditor = !this.toggleEditor;
      }
    }
  }
  
  void closeOpenPhoto(){
    // closes all photos to return to library
    for(Photo ph: this.lib.plib){
      if(ph.open){
        ph.open = false;
      }
    }
  }
  
  void saveNewPhoto(){
    // generate a random name and save the new PImage in Photos directory
    String newPhotoName = this.genRandChar()+this.genRandChar()+this.genRandChar()
                         +this.genRandChar()+this.genRandChar()+this.genRandChar()
                         +this.genRandChar()+this.genRandChar()+".png";
    save("Data/Photos/"+newPhotoName);
    
    // add to photo library
    this.lib.addNewPhoto(new Photo(this.ed.currBuff2, newPhotoName));
    
    // notify user that it was saved
    text("Saved to Library!", width-90, 15);
  }
  
  char genRandChar(){
    // return a randomly generated character
      char[] chars = {'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd',
                      'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h',
                      'I', 'i', 'J', 'j', 'K', 'k', 'L', 'l',
                      'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p',
                      'Q', 'q', 'R', 'r', 'S', 's', 'T', 't',
                      'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x',
                      'Y', 'y', 'Z', 'z', '1', '2', '3', '4',
                      '5', '6', '7', '8', '9', '0'};
                      
       return chars[int(random(chars.length))];
  }
}
