class Button_Calc{
  float centerx;
  float centery;
  String shape;
  float radius;
  float w;
  float h;
  PShape s;
  String chara;
  color co;
  String ex = "0";
  
  Button_Calc(String shape,float centerx, float centery, float radius, float w, float h,String chara){
    this.centerx = centerx;
    this.centery = centery;
    this.radius = radius;
    this.w = w;
    this.h = h;
    this.chara = chara;
    
    
    if(shape == "rect"){
      rectMode(CENTER);
      s = createShape(RECT, centerx, centery, w, h, 125);
    }
    else{
      s = createShape(ELLIPSE,centerx,centery,radius,radius);
      
    }
    
  }
  
  void display(){
    text(ex,width - 150,height - 830);
    if(chara == "1" || chara == "2" || chara == "3" || chara == "4"
    || chara == "5" || chara == "6" || chara == "7" || chara == "8" || 
    chara == "9" || chara == "0" || chara == "."){
      co = color(#505050);
      
      
    }
    if(chara == "/" || chara == "x" || chara == "-" || chara == "+" ||
    chara == "="){
      co = color(#FF9500); 
      
      
    }
    if (chara == "C" || chara == "+-" || chara == "%" ){
      co = color(#D4D4D2);
      
      
    }
    shape(s);
    textAlign(CENTER);
    textSize(60);
    text(chara,this.centerx,this.centery + 20);
    
    if(shape != "rect"){
      
      if(dist(mouseX, mouseY, centerx, centery) < this.radius/2 && mousePressed){
      if(chara == "c" || chara == "C"){
        ex = " ";
        
      }
      else{
        ex+= chara;
        
      }
      
    }
    
    if(dist(mouseX, mouseY, centerx, centery) < this.radius/2){
      s.setFill(color(255,255,255,200));
      
    }
    else {
      s.setFill(co);
      
      
    }
    }
    if(chara == "0") {
      if (mouseX > 12 && mouseX < 12 + 125*2.2 && mouseY > 786 && mouseY < 786 + 125){
        s.setFill(color(255,255,255,200));  
        
      }
      else{
        s.setFill(co);
        
      }
      
      
    }
    
  } 
  
}
