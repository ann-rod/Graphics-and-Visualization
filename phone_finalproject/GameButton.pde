class GameButton {
  char btype;
  color col;
  int posx;
  int posy;
  int bwidth;
  int bheight;
  String btext;
  
  GameButton(char btype, int x, int y, int w, int h, String t, color c) {
    this.btype = btype;
    this.posx = x;
    this.posy = y;
    this.bwidth = w;
    this.bheight = h;
    this.btext = t;
    this.col = c;
  }
  
  void display() {
    fill(#F79E28);
    if (this.btype == 'r') {
      rectMode(CENTER);
      rect(this.posx, this.posy, this.bwidth, this.bheight);

    } else if (this.btype == 'r') {
      ellipse(this.posx, this.posy, this.bwidth, this.bwidth);
    }
    
    fill(0);
    textSize(12);
    text(this.btext, this.posx, this.posy-(textAscent()/2));
  }
  
  boolean checkMousePosition() {
    if (this.btype == 'r') {
      if ((mouseX >= this.posx-this.bwidth/2)&&(mouseX <= this.posx+this.bwidth /2)) {
        if  ((mouseY >= this.posy-this.bheight/2)&&(mouseY <= this.posy+this.bheight /2)) {
          return true;
        } else {
          return false; 
        }
      } else {
        return false; 
      }
    } else {
      if ( (Math.pow((mouseX - this.posx), 2) + Math.pow((mouseY - this.posy), 2)) <= Math.pow((this.bwidth / 2), 2)) {
        return true; 
      }
      else {
        return false; 
      }
    }
  }
  

  
    
  

  
}
