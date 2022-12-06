class ClockApp extends App{
  Clock bigclock;
  
  
  ClockApp(String name, PImage icon) {
    super(name, icon);
    bigclock = new Clock(); 
    
  }
  
  void run() {
    if (open) {
      background(255);
      bigclock.display() ;
      textSize(30);
      fill(0);
      String seconddigit;
      String minutedigit;
      String hourdigit;
      String ampm;
      if (second() < 10) {
        seconddigit = '0' + Integer.toString(second());
      }
      else {
        seconddigit = Integer.toString(second()); 
      }
      if (minute() < 10) {
        minutedigit = '0' + Integer.toString(minute()); 
      }
      else {
        minutedigit = Integer.toString(minute()); 
      }
      if (hour() % 12 < 10) {
        hourdigit = '0' + Integer.toString(hour() % 12);
      }
      else if (hour() == 12) {
        hourdigit = "12" ;
      }
      else {
        hourdigit = Integer.toString(hour() % 12); 
      }
      if (hour() < 12) {
        ampm = "am"; 
      }
      else {
        ampm = "pm" ;
      }
      
      String time = "CST: " + hourdigit + ":" + minutedigit + ":" + seconddigit + ampm;
      text(time, width/2, height/2);
      
      for(int i=0; i<4; i++) {
        line(0, height/2 + 80*i + textAscent() + 25, width, height/2 + 80*i + textAscent() + 25); 
      }
      
      String ESTtime;
      String ESThourdigit;
      String ESTampm;
      if ((hour() + 1) % 12 < 10) {
        ESThourdigit = '0' + Integer.toString((hour() + 1) % 12);
      }
      else if ((hour() + 1) == 12){
        ESThourdigit = "12";
      }
      else {
        ESThourdigit = Integer.toString((hour() + 1) % 12); 
      }
      if ((hour() + 1) < 12) {
        ESTampm = "am"; 
      }
      else {
        ESTampm = "pm" ;
      }
      
      ESTtime = "EST: " + ESThourdigit + ":" + minutedigit + ":" + seconddigit + ESTampm;
      
      text(ESTtime, width/2, (height+80 + 3*textAscent())/2);
     
     
      String PSTtime;
      String PSThourdigit;
      String PSTampm;
      if ((hour() - 2) % 12 < 10) {
        PSThourdigit = '0' + Integer.toString((hour() - 2) % 12);
      }
      else if (hour() - 2 == 12) {
        PSThourdigit = "12";
      }
      else {
        PSThourdigit = Integer.toString((hour() - 2) % 12); 
      }
      if ((hour() - 2) < 12) {
        PSTampm = "am"; 
      }
      else {
        PSTampm = "pm" ;
      }
      
      PSTtime = "PST: " + PSThourdigit + ":" + minutedigit + ":" + seconddigit + PSTampm;
      
      text(PSTtime, width/2, (height+240 + 3*textAscent())/2);
      
      String GMTtime;
      String GMThourdigit;
      String GMTampm;
      if ((hour() + 6) % 12 < 10) {
        GMThourdigit = '0' + Integer.toString((hour() + 6) % 12);
      }
      else if (hour() + 6 == 12) {
        GMThourdigit = "12"; 
      }
      else {
        GMThourdigit = Integer.toString((hour() + 6) % 12); 
      }
      if ((hour() + 6) < 12) {
        GMTampm = "am"; 
      }
      else {
        GMTampm = "pm" ;
      }
      
      GMTtime = "GMT: " + GMThourdigit + ":" + minutedigit + ":" + seconddigit + GMTampm;
      
      text(GMTtime, width/2, (height+400 + 3*textAscent())/2);
      fill(255);
    }
  }
  
  
  
  
}
