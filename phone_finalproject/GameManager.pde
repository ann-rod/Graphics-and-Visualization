class GameManager extends App{
  boolean difficultychosen;
  GameButton normaldiff;
  GameButton harddiff;
  Barriers barrier;
  Barriers barrier1;
  Barriers barrier2;
  Barriers barrier3;
  Ship gameship;
  Projectile ship_bullet;
  AlienSwarm swarm;
  Projectile swarm_bullet;
  StarManager backgroundStars;
  int difficulty;
  int ship_lives;
  int alien_rows;
  boolean muted;
  //SoundFile shootingfile;
  
  
  GameManager(String name, PImage icon) {
    super(name, icon);

    
    difficultychosen = false;
    backgroundStars = new StarManager(150, new PVector(0, width), new PVector(0, height), new PVector(1,4));
    
    //GameButton(String btype, int x, int y, int w, int h, String t, color c)
    normaldiff = new GameButton('r', width/2, height/2 - 40, 80, 40, "Normal", #4E7EF2);
    harddiff = new GameButton('r', width/2, height/2 + 40, 80, 40, "Hard", #4E7EF2);
    
    gameship = new Ship(new PVector(width / 2, 9 * height / 10 + 20), 4);
    ship_bullet = gameship.bullet;
    
    // creates 4 barriers
    barrier = new Barriers(new PVector(width/4 +40 ,height/1.2));
    barrier1 = new Barriers(new PVector(width/2 + 40,height/1.2));
    barrier2 = new Barriers(new PVector(width * (3/4) +40,height/1.2));
    barrier3 = new Barriers(new PVector(width -110,height/1.2));
    muted = false;
  }
  
  
  void run() {
    if (open == false) {
      difficultychosen = false; 
    }
    
    else if (open == true){
      background(0);
      backgroundStars.display();
      
      if (difficultychosen == false) {
        normaldiff.display();
        harddiff.display();
      }
      
      if (difficultychosen) {
        if (swarm.swarm.size() == 0) {
          background(0);
          textSize(100);
          fill(#2B46ED);
          text("You Win", width / 2 - textWidth("You Win") / 2, height / 2);
          }
        
        // game continues if player lives and 
        // swarm hasn't reached bottom of screen
        else if ((gameship.lives > 0) && !swarm.reachedBottom){
          
      
          swarm.display();
          swarm.update();
          swarm.shootingLoop(gameship);
          gameship.shipUpdate(swarm.swarm);
          
          barrier.display();
          barrier1.display();
          barrier2.display();
          barrier3.display();
          barrier.checkCollision(ship_bullet);
          barrier1.checkCollision(ship_bullet);
          barrier2.checkCollision(ship_bullet);
          barrier3.checkCollision(ship_bullet);
          barrier.checkCollision(swarm_bullet);
          barrier1.checkCollision(swarm_bullet);
          barrier2.checkCollision(swarm_bullet);
          barrier3.checkCollision(swarm_bullet);
      
          }
        else{
          background(0); 
          textSize(100);
          fill(#F2314B);
          text("You Lose", width / 2 - textWidth("You Lose") / 2, height / 2);
          
          }
        }
      }
  }
  
  void uponKeyPressed(int button, int buttoncode) {
    if (open && difficultychosen) {
      if ((button == 'r') || (button == 'R')) {
        barrier.recharge(mouseX,mouseY);
        barrier1.recharge(mouseX,mouseY);
        barrier2.recharge(mouseX,mouseY);
        barrier3.recharge(mouseX,mouseY);
       }
       else if ((button == 'a') || (button == 'A') || (buttoncode == LEFT) || (button == 'd') || (button == 'D') || (buttoncode == RIGHT)) {
         gameship.movement(button, buttoncode);
       }
        if ((button == 32) && (gameship.lives > 0) && (ship_bullet.visible == false)) {
         gameship.shoot(key);
         shootingsound.play(); 
       }
        if ((button == 'm') || (button == 'M')) {
          muted = ! muted;
          if (muted == false) {shootingsound.amp(1);}
          else {shootingsound.amp(0);}
       }
       
    }
    
  }
  
  void uponMousePressed() {
    if ((open == true) && (difficultychosen == false)) {
       if (normaldiff.checkMousePosition()) {
         difficulty = 0; 
         difficultychosen = true;
         swarm = new AlienSwarm(6);
         swarm_bullet = swarm.alienBullet;
       }
       else if (harddiff.checkMousePosition()) {
         difficulty = 1; 
         difficultychosen = true;
         swarm = new AlienSwarm(9);
         swarm_bullet = swarm.alienBullet;
         gameship.lives = 3;
       }
    }
  }
  
}
