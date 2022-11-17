Homescreen hm;

void setup(){
  size(625, 950);
  hm = new Homescreen();
  hm.open = true;
  
  hm.am.addNewApp(new PhotosApp("Photos", loadImage("AppIcons/PhotosAppIcon.jpeg")));
  for(int i = 0; i < 5; i++){
    hm.am.addNewApp(new App("Test App "+str(i), createImage(75, 75, RGB)));
  }

}

void draw(){
  hm.run();
}

void mouseClicked(){
  // apps check if they were clicked on and
  // open if they were
  for(App a: hm.am.apps){
    a.checkIfClicked(mouseX, mouseY);
  }
}
