import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import processing.sound.*;

import java.time.LocalDateTime;
import java.util.*;
import java.time.format.DateTimeFormatter;
import java.util.Stack;
Homescreen h;
//Calc_app calc;
Calculator calculator;
color co;

Homescreen hm;
PhotosApp p;

GameManager game;
SoundFile shootingsound;
ClockApp clock;

void setup(){
  size(625, 950);
  hm = new Homescreen();
  hm.open = true;
  
  p = new PhotosApp("Photos", loadImage("AppIcons/PhotosAppIcon.jpeg"));
  hm.am.addNewApp(p);
  
  game = new GameManager("Space Invaders", loadImage("AppIcons/spaceinvaders.jpg"));
  hm.am.addNewApp(game);
  shootingsound = new SoundFile(this, "shoot.wav");

  clock = new ClockApp("Clock", loadImage("AppIcons/clockicon.png"));
  hm.am.addNewApp(clock);
  
  //calc = new Calc_app(new PVector(550, 840));
  calculator = new Calculator(75,250, "Calculator", loadImage("AppIcons/calculatoricon.png"));
  hm.am.addNewApp(calculator);
  co = color((random(0,255)),random(0,255), random(0,255));

}

void draw(){
  hm.run();

  
}

  void mouseClicked(){
    
  // apps check if they were clicked on
  for(App a: hm.am.apps){
    a.checkIfClicked(mouseX, mouseY);
  }
  
  //check if photo app was opened
  if(p.open){
    
    // check if the back/save buttons in photos app were clicked on
    for(Button b: p.buttonArr){
      b.checkIfClicked(mouseX, mouseY);
    }
    
    // check if prev/next buttons in editor were clicked on
    for(Button b: p.ed.buttonArr){
      b.checkIfClicked(mouseX, mouseY);
    }
    
    // check if a photo icon was clicked
    for(Photo ph: p.lib.plib) {
      ph.checkIfClicked(mouseX, mouseY);
    }
  } 
  
  if (game.open) {
    game.uponMousePressed();
  }
   
}

void keyPressed(){
  // closes all apps and returns to home
  if(key == 'q'){
    for(App a: hm.am.apps){
      a.closeApp();
    }
  }
  
  if (game.open) {
    game.uponKeyPressed(key, keyCode);

  }
  
  
  if(key == '0' && calculator.open == true){
    text('0',width - 150,height - 830);
    
  }
  if(key == '1' && calculator.open == true){
    text('1',width - 150,height - 830);
    
  }
  if(key == '2' && calculator.calc_flag == true){
    text('2',width - 150,height - 830);
    
  }
  if(key == '3' && calculator.calc_flag == true){
    text('3',width - 150,height - 830);
    
  }
  if(key == '4' && calculator.calc_flag == true){
    text('4',width - 150,height - 830);
    
  }
  if(key == '5' && calculator.calc_flag == true){
    text('5',width - 150,height - 830);
    
  }
  if(key == '6' && calculator.calc_flag == true){
    text('6',width - 150,height - 830);
    
  }
  if(key == '7'&& calculator.calc_flag == true){
    text('7',width - 150,height - 830);
    
  }
  if(key == '8'&& calculator.calc_flag == true){
    text('8',width - 150,height - 830);
    
  }
  if(key == '9'&& calculator.calc_flag == true){
    text('9',width - 150,height - 830);
  }
  
  if(key == '%'&& calculator.calc_flag == true){
    text('%',width - 150,height - 830);
  }
  if(key == '.'&& calculator.calc_flag == true){
    text('.',width - 150,height - 830);
  }
  
  if(key == '-'&& calculator.calc_flag == true){
    text('-',width - 150,height - 830);
  }
  if(key == '+'&& calculator.calc_flag == true){
    text('+',width - 150,height - 830);
  }
  if(key == '*'&& calculator.calc_flag == true){
    text('*',width - 150,height - 830);
  }
  if(key == '/'&& calculator.calc_flag == true){
    text('/',width - 150,height - 830);
  }
  if(key == '='&& calculator.calc_flag == true){
    text('=',width - 150,height - 830);
  }
  if(key == 'c'&& calculator.calc_flag == true){
    text('C',width - 150,height - 830);
  }
  
}
