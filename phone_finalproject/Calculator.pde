class Calculator extends App{
  Eval e;
  boolean calc_flag = false;
  Button_Calc zero;
  Button_Calc one;
  Button_Calc two;
  Button_Calc three;
  Button_Calc four;
  Button_Calc five;
  Button_Calc six;
  Button_Calc seven;
  Button_Calc eight;
  Button_Calc nine;
  Button_Calc clear;
  Button_Calc flip_sign;
  Button_Calc mod;
  Button_Calc division;
  Button_Calc mult;
  Button_Calc minus;
  Button_Calc add;
  Button_Calc equals;
  Button_Calc decimal;
  Calc_app calcdisplay;
  
  float posx;
  float posy;
  float x_dist = width / 4;
  float y_dist = 150;
  float radius = 125;
  //Button(String shape,PVector center, float radius, float w, float h)
  Calculator(float posx, float posy, String name, PImage icon){
    super(name, icon);
    this.posx = posx;
    this.posy = posy;
    calcdisplay = new Calc_app(new PVector(550, 840));
    
    clear = new Button_Calc("circle", this.posx, this.posy, radius, 0, 0, "C");
    clear.s.setFill(color(#D4D4D2));
    
    
    flip_sign = new Button_Calc("circle", this.posx + x_dist, this.posy, radius, 0, 0, "+-");
    flip_sign.s.setFill(color(#D4D4D2));
    
    mod = new Button_Calc("circle", this.posx + 2*x_dist, this.posy, radius, 0, 0,"%");
    mod.s.setFill(color(#D4D4D2));
    
    division = new Button_Calc("circle",this.posx + 3*x_dist, this.posy, radius, 0, 0, "/");
    division.s.setFill(color(#FF9500));
    
    seven = new Button_Calc("circle", this.posx, this.posy + y_dist, radius, 0, 0, "7");
    seven.s.setFill(color(#505050));
    
    eight = new Button_Calc("circle", this.posx+x_dist, this.posy + y_dist, radius, 0, 0, "8");
    eight.s.setFill(color(#505050));
    
    nine = new Button_Calc("circle", this.posx+ 2*x_dist, this.posy + y_dist, radius, 0, 0, "9");
    nine.s.setFill(color(#505050));
    
    mult = new Button_Calc("circle", this.posx+ 3*x_dist, this.posy + y_dist, radius, 0, 0, "x");
    mult.s.setFill(color(#FF9500));
    
    four = new Button_Calc("circle", this.posx, this.posy + 2*y_dist, radius, 0, 0, "4");
    four.s.setFill(color(#505050));
    
    five = new Button_Calc("circle", this.posx + x_dist, this.posy + 2*y_dist, radius, 0, 0, "5");
    five.s.setFill(color(#505050));
    
    six = new Button_Calc("circle", this.posx + 2*x_dist, this.posy + 2*y_dist, radius, 0, 0, "6");
    six.s.setFill(color(#505050));
    
    minus = new Button_Calc("circle", this.posx + 3*x_dist, this.posy + 2*y_dist, radius, 0, 0, "-");
    minus.s.setFill(color(#FF9500));
    
    one = new Button_Calc("circle", this.posx, this.posy + 3*y_dist, radius, 0, 0, "1");
    one.s.setFill(color(#505050));
    
    two = new Button_Calc("circle", this.posx + x_dist, this.posy + 3*y_dist, radius, 0, 0, "2");
    two.s.setFill(color(#505050));
    
    three = new Button_Calc("circle", this.posx + 2*x_dist, this.posy + 3*y_dist, radius, 0, 0, "3");
    three.s.setFill(color(#505050));
    
    add = new Button_Calc("circle",this.posx + 3*x_dist, this.posy + 3*y_dist, radius, 0, 0, "+");
    add.s.setFill(color(#FF9500));
    
    zero = new Button_Calc("rect", this.posx + 75, this.posy + 4*y_dist, radius,2.2*radius,radius, "0");
    zero.s.setFill(color(#505050));
    
    decimal = new Button_Calc("circle", this.posx + 2*x_dist, this.posy + 4*y_dist, radius, 0, 0, ".");
    decimal.s.setFill(color(#505050));
    
    equals = new Button_Calc("circle", this.posx + 3*x_dist, this.posy + 4*y_dist, radius, 0, 0, "=");
    equals.s.setFill(color(#FF9500));
    
    e = new Eval("1 + 2 + 3");
    text(e.ev("1 + 2 + 3"), width - 150,height - 830);
  }
  
  void run(){
    background(0);
    calcdisplay.display();
    clear.display();
    flip_sign.display();
    mod.display();
    division.display();
    seven.display();
    eight.display();
    nine.display();
    mult.display();
    four.display();
    five.display();
    six.display();
    minus.display();
    one.display();
    two.display();
    three.display();
    add.display();
    zero.display();
    decimal.display();
    equals.display();
    
    //text(e.ev("1 + 2 + 3.5"),width - 150,height - 830);
    
    
  }
  
  
  
  
  
}
