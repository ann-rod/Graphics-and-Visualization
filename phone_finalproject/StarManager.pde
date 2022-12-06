class StarManager{
  ArrayList<Star> stars;
  
  int numStars;
  PVector xLim, yLim, radLim;
  
  StarManager(int numStars, PVector xLim, PVector yLim, PVector radLim){
    this.numStars = numStars;
    this.xLim = xLim;
    this.yLim = yLim;
    this.radLim = radLim;
    
    stars = new ArrayList<Star>();
    this.createStars();
  }
  
  void display(){
    for(Star s:stars){
      s.display();
    }
  }
  
  void createStars(){
    for(int i = 0; i < this.numStars; i++){
      stars.add(new Star(new PVector(random(xLim.x, xLim.y), 
                                     random(yLim.x, yLim.y)), 
                                     random(radLim.x, radLim.y)));
    }
  }
}
