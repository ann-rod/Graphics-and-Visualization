class PhotoEditor{
  Photo curr;
  PImage currBuff, currBuff2;
  
  // filter variables
  int currFilter = 0;
  int prevFilter = 0;
  int[] filterCodes = {0, 1, 2, 3, 4, 5};
  PVector filterTextPos = new PVector(width/2, height-15);
  
  // button variables
  ArrayList<Button> buttonArr;
  PVector buttonSize, buttonPad;
  color buttonCol = color(120, 160, 195);

  PhotoEditor(){
    // set button constants
    this.buttonSize = new PVector(60, 30);
    this.buttonPad = new PVector(5, 5);
    
    // init button array
    this.buttonArr = new ArrayList<Button>();
    
    // create and init previous and next buttons
    this.buttonArr.add(new Button("Prev.", new PVector(buttonPad.x, 
                             height-buttonSize.y-buttonPad.y), buttonSize, buttonCol) );          
    this.buttonArr.add(new Button("Next", new PVector(width-buttonSize.x-buttonPad.x,
                             height-buttonSize.y-buttonPad.y), buttonSize, buttonCol) );
  }
  
  void setCurrentPhoto(Photo curr){
    // takes the photo sent from library
    // and sets it as current
    this.curr = curr;
    this.resetCurrBuffs();
  }
  
  void run(){
    // check buttons
    this.checkButtons();
    
    // change filters
    if(currFilter == 0 && prevFilter != 0){
       this.resetCurrBuffs();
       this.prevFilter = 0;
    }else if(currFilter == 1 && prevFilter != 1){
      this.currBuff2 = filterGrayscale(this.currBuff, this.currBuff2);
      this.prevFilter = 1;
    }else if(currFilter == 2 && prevFilter != 2){
      this.currBuff2 = filterContrast(this.currBuff, this.currBuff2);
      this.prevFilter = 2;
    }else if(currFilter == 3 && prevFilter != 3){
      this.currBuff2 = filterGaussBlur(this.currBuff, this.currBuff2);
      this.prevFilter = 3; 
    }else if(currFilter == 4 && prevFilter != 4){
      this.currBuff2 = filterEdgeDetect(this.currBuff, this.currBuff2);
      this.prevFilter = 4;
    }else if(currFilter == 5 && prevFilter != 5){
      this.currBuff2 = filterSharpen(this.currBuff, this.currBuff2);
      this.prevFilter = 5;
    }
    this.display();
  }
  
  void display(){
    background(150);
    
    // show preview of current image with filter
    image(this.currBuff2, 0, height/2-this.currBuff.height/2);
    
    // create upper and lower menus
    fill(210);
    noStroke();
    rect(0, 0, width, 40);
    rect(0, height-40, width, 40);
    
    // show buttons
    for(Button b: buttonArr){
      b.display();
    }
    // show the name of the current filter
    this.dispFilterName();
  }
  
  void dispFilterName(){
    // displays the name of the current filter
    if(currFilter == 0){
      text("Original", filterTextPos.x, filterTextPos.y);
    }else if(currFilter == 1){
      text("Grayscale", filterTextPos.x, filterTextPos.y);
    }else if(currFilter == 2){
      text("Contrast", filterTextPos.x, filterTextPos.y);
    }else if(currFilter == 3){
      text("Blur", filterTextPos.x, filterTextPos.y);
    }else if(currFilter == 4){
      text("Sketch", filterTextPos.x, filterTextPos.y);
    }else if(currFilter == 5){
      text("Sharpen", filterTextPos.x, filterTextPos.y);
    }
  }
  
  void resetCurrBuffs(){
    // resets both buffers to the original image
    // then fits them to screen
    
    this.currBuff = curr.photo.copy();
    this.currBuff.resize(width, 0);
    
    this.currBuff2 = curr.photo.copy();
    this.currBuff2.resize(width, 0);
  }
  
  void checkButtons(){
    for(int i = 0; i < buttonArr.size(); i++){
      Button b = buttonArr.get(i);
      
      if(b.on && i == 0){
        // user clicked on previous button
        
        // toggle off to reuse later
        b.on = !b.on;
        
        // change to previous filter in array or wrap to end
        if(currFilter-1 < 0){
          this.currFilter = 5;
        }else{
        this.currFilter -= 1;
        }
      }
      
      if(b.on && i == 1){
        // user clicked on next button
        
        // toggle off to reuse later
        b.on = !b.on;
        
        // change to next filter or wrap to start
        if(currFilter+2 > filterCodes.length){
          this.currFilter = 0;
        }else{
          this.currFilter += 1;
        }
      }
    }
  }
  
  ///// FILTER FUNCTIONS BELOW /////
  PImage filterGrayscale(PImage img, PImage buff){
  /*
  Finds the grayscale value of each pixel in the original
  image and writes the value to the corresponding pixel in
  the buffer.
  */
    img.loadPixels();
    buff.loadPixels();
    
    // parse through each pixel in img
    for(int x = 0; x < img.width; x++){
      for(int y = 0; y < img.height; y++){
        int index = x + y*img.width;
        
        // finds rgb values of the current pixel
        float r = constrain(abs(red(img.pixels[index])), 0, 255);
        float g = constrain(abs(green(img.pixels[index])), 0, 255);
        float b = constrain(abs(blue(img.pixels[index])), 0, 255);
        
        // find average of rgb and apply color to buff
        float avg = (r + g + b)/3;
        buff.pixels[index] = color(avg, avg, avg);
      }
    }
    buff.updatePixels();
    return buff;
  }
  
  PImage filterContrast(PImage img, PImage buff){
  /*
  Creates a high contrast filter by adding a brightness factor
  with pixels above a brightness threshold, and subtracting
  brightness factor from filters under a lower threshold.
  */
    
    float factor = 10; // arbitrary, but between 8-15 looks okay
    colorMode(HSB, 360, 100, 100);
    img.loadPixels();
    buff.loadPixels();
    
    // parse through pixels in image and take brightness value
    for(int x = 0; x < img.width; x++){
      for(int y = 0; y < img.height; y++){
        int index = x + y*img.width;
        
        color c = color(img.pixels[index]);
        
        // add or subtract factor to certain levels of brightness
        if( brightness(c) > 60 ){
          c = color( hue(c), saturation(c),
                     constrain(abs(brightness(c)+factor), 0, 100));
        }else if( brightness(c) < 40){
          c = color( hue(c), saturation(c), 
                     constrain(abs(brightness(c)-factor), 0, 100));
        }
       // add new color to the corresponding buff pixel
       buff.pixels[index] = c;
      }
    }
    buff.updatePixels();
    colorMode(RGB, 255, 255, 255);
    return buff;
  }
  
  PImage filterGaussBlur(PImage img, PImage buff){
  /*
  Inputs the guassian blur kernel into the applyConvolution
  function and returns the edited buffer.
  */
    float[][] kernel = {{0.0625,0.125,0.0625},{0.125,0.25,0.125},{0.0625,0.125,0.0625}};
    buff = applyConvolution(img, buff, kernel);
    return buff;
  }
  
  PImage filterEdgeDetect(PImage img, PImage buff){
  /*
  Makes a black/white image with the edges outlined in white. Uses two
  Sobel kernels.
  */
    img.loadPixels();
    buff.loadPixels();
    
    // convert buffer to grayscale to get better edge detect
    buff = filterGrayscale(img, buff); // read from this for grayscale
    
    float[][] horzKernel = {{-1,0,1},{-2,0,2},{-1,0,1}};
    float[][] vertKernel = {{-1,-2,-1},{0,0,0},{1,2,1}};
    
    // make a buffer containing the horizontal edges
    PImage hbuff = createImage(img.width, img.height, ARGB);
    hbuff = applyConvolution(buff, hbuff, horzKernel);
    
    // make a bufer holding vertical edges
    PImage vbuff = createImage(img.width, img.height, ARGB);
    vbuff = applyConvolution(buff, vbuff, vertKernel);
    
    hbuff.loadPixels();
    vbuff.loadPixels();
    for(int x = 0; x < img.width; x++){
      for(int y = 0; y < img.height; y++){
        int index = x + y*img.width;
        
        // take color of current pixel in hbuff and vbuff
        color h = color(hbuff.pixels[index]);
        color v = color(vbuff.pixels[index]);
        
        // take magnitude of h+v rgb channels
        float r = sqrt( pow(red(h), 2) + pow(red(v), 2) );
        float g = sqrt( pow(green(h), 2) + pow(green(v), 2) );
        float b = sqrt( pow(blue(h), 2) + pow(blue(v), 2) );
        
        // constrain and put the new rgb values into the real buffer
        buff.pixels[index] = color(constrain(abs(r), 0, 255), 
                                   constrain(abs(g), 0, 255), 
                                   constrain(abs(b), 0, 255));
      }
    }
    buff.updatePixels();
    return buff;
  }
  
  PImage filterSharpen(PImage img, PImage buff){
  /*
  Takes the given image and sharpens it using a convolution
  matrix.
  */
    float[][] kernel = {{0.0,-1.0,0.0},{-1.0,5.0,-1.0},{0.0,-1.0,0.0}};
    buff = applyConvolution(img, buff, kernel);
    return buff;
  }
  
  PImage applyConvolution(PImage img, PImage buff, float[][] kernel){
  /*
  Given an image, its buffer, and a 3x3 kernel, will
  perform a matrix convolve of the image pixel values
  and then apply to the buffer.
  */
    img.loadPixels();
    buff.loadPixels();
    
    // traverse the pixels of the original image
    for(int x = 1; x < img.width-1; x++){
      for(int y = 1; y < img.height-1; y++){
        int index = x + y*img.width;
        
        // take rgb values of the original pixel
        float r = 0;
        float g = 0;
        float b = 0;
   
        for(int i = 0; i < 3; i++){
          for(int j = 0; j < 3; j++){
            int idx = (x+i-1) + img.width*(y+j-1);
            
            // apply kernel around original pixel
            r += red(img.pixels[idx]) * kernel[i][j];
            g += green(img.pixels[idx]) * kernel[i][j];
            b += blue(img.pixels[idx]) * kernel[i][j];
          }
        }
         // take the new rgb values and constrain
         r = constrain(abs(r), 0, 255);
         g = constrain(abs(g), 0, 255);
         b = constrain(abs(b), 0, 255);
         
         // add the new values to the buffer
         buff.pixels[index] = color(r, g, b);
      }
    }
    buff.updatePixels();
    buff = fixBorder(buff);
    return buff;
  }
  
  PImage fixBorder(PImage img){
  /*
  Takes an image given and changes the pixel border values to be
  the same as a direct neighbor. Intended to fix black border from
  a 3x3 kernel image processing.
  
  WARNING: CHANGES THE IMAGE INPUTTED. ONLY USE ON BUFFERS.
  */
    img.loadPixels();
    
    // take edge cases and make the same color as a neighbor
    for(int x = 0; x < img.width; x++){
      for(int y = 0; y < img.height; y++){
        int index = x + y*img.width;
        
        // make (0,0) = (1,1)
        if(x==0 && y==0){
          img.pixels[index] = color(img.pixels[1 + img.width]);
        }
        // (x, 0) = (x, 1)
        else if(y == 0){
          img.pixels[index] = color(img.pixels[x + img.width]);
        }
        // (x, img.height) = (x, img.height-1)
        else if(y == img.height-1){
          img.pixels[index] = color(img.pixels[x + (y-2)*img.width]);
        }
        // (0, y) = (1,y)
        else if(x == 0){
          img.pixels[index] = color(img.pixels[1 + y*img.width]);
        }
        // (img.width, y) = (img.width-1, y)
        else if(x == img.width-1){
          img.pixels[index] = color(img.pixels[(x-2) + y*img.width]);
        }
        // (img.width, img.height) = (img.width-1, img.height-1)
        else if(x == img.width-1 && y == img.height-1){
          img.pixels[index] = color(img.pixels[(x-2) + (y-2)*img.width]);
        }
      }
    }
    img.updatePixels();
    return img;
  }

}
