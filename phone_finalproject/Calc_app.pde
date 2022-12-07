class Calc_app{
  PShape calc;
  PShape grey_back;
  PShape black_back;
  PShape grey_rect;
  PShape g_circle1;
  PShape g_circle2;
  PShape g_circle3;
  PShape g_circle4;
  PShape o_circle1;
  PShape o_circle2;
  PShape o_circle3;
  PShape grey_oval;
  PVector pos;
  
  Calc_app(PVector pos){
    this.pos = pos;
    calc = createShape(GROUP);
    grey_back = createShape(RECT, 0,0, 67,60,9);
    grey_back.setFill(color(220,220,220));
    black_back = createShape(RECT, 15,8,39,42,9);
    black_back.setFill(color(0,0,0));
    
    grey_rect = createShape(RECT, 17, 10, 35, 18,9);
    grey_rect.setFill(color(80,80,80));
    
    g_circle1 = createShape(ELLIPSE, 21,33,8,8);
    g_circle2 = createShape(ELLIPSE, 30,33,8,8);
    g_circle3 = createShape(ELLIPSE, 21,44,8,8);
    g_circle4 = createShape(ELLIPSE, 30,44,8,8);
    
    calc.addChild(grey_back);
    calc.addChild(black_back);
    calc.addChild(grey_rect);
    calc.addChild(g_circle1);
    calc.addChild(g_circle2);
    calc.addChild(g_circle3);
    calc.addChild(g_circle4);
    
  }
  
  void display(){
    shape(calc,this.pos.x, this.pos.y);
    
    
  }
  
  
  
}
