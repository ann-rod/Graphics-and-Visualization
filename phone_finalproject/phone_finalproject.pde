import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import processing.sound.*;

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
  
}
