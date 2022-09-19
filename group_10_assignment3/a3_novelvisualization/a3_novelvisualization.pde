PFont imprint;

// word colors
color blue = color(29,38,129);
color yellow = color(251, 221, 122);
color green = color(133, 187, 101);
color[] colorlist = {blue,yellow,green};
String[] wordlist;

void setup() {
  size(700, 600);
  wordlist = loadStrings("uniquewords.txt");
  imprint = createFont("IMPRISHA.TTF", 35);
  textFont(imprint);
  fill(255);
  textSize(35);
  draw_everything();
}

void draw() {
}

void draw_everything() {
  background(0);
  night_sky();
  draw_words();
}

void draw_words() {
  int x = 2;
  int y = 1 + (int) textAscent();
  fill(blue);
  while (true) {
    int wordindex = (int) random(wordlist.length);
    String word = wordlist[wordindex] + " ";
    int colorindex = (int) random(3);
    fill(colorlist[colorindex]);
    if (x + textWidth(word) > width) {
      x = 2;
      y += 1 + (int) textAscent();
      if (y > height) {
        break;
      }
      text(word, x, y);
      x += textWidth(word);
    }
    else {
      text(word, x, y); 
      x += textWidth(word);
    }
    
  }
}

void night_sky() {
  for (int x = 50; x < width - 45; x += 140) {
    for (int y=50; y < width - 45; y += 140) {
      int dx = (int) random(-30, 30);
      int dy = (int) random(-30, 30);
      star(x+dx,y+dy);
    }
  }
}

void star(int x, int y) {
  noFill();
  stroke(120);
  //ellipse(x,y,1,1);
  ellipse(x,y-10, 1, 1);
  ellipse(x+9,y-3,1,1);
  ellipse(x-9,y-3,1,1);
  ellipse(x+6,y+8,1,1);
  ellipse(x-6,y+8,1,1);
  
  strokeWeight(1);
  line(x,y-10,x+6,y+8);
  line(x+6,y+8,x-9,y-3);
  line(x-9,y-3,x+9,y-3);
  line(x+9,y-3,x-6,y+8);
  line(x-6,y+8,x,y-10);
  strokeWeight(1);
}

void mousePressed() {
  draw_everything(); 
}
