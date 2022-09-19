IntDict wordfrequency;
String[] lines;
int[] k = new int[143];
float xscale = .915; //0.5754276827;
float yscale = .955; //0.2657534247;
void setup() {
  size(1500,1000);
  lines = loadStrings("wordfrequency.txt");
  wordfrequency = new IntDict();
  for (int i = 0; i < lines.length; i++) {
    String[] line = split(lines[i], ":");
    wordfrequency.set(line[0], int(line[1]));
    k[i] = int(line[0]);
    
    
  }
}

void draw(){
  background(255,255,255);
  stroke(5);
  line(20,0,20,970);
  line(20,970, 1500, 970);
  fill(0,0,0);
  
  fill(255,0,0);
  textSize(12);
  text("0",8, 975);
  text("1594", 1470, 985);
  textSize(20);
  text("Appearance in text",650,950 );
  textSize(12);
  
  pushMatrix();
  float angle1 = radians(90);
  translate(5, 0);
  rotate(angle1);
  text("999",0,0);
  textSize(20);
  text("Words",500,-60);
  popMatrix();
  
  fill(255,0,0);
  
  
  for (int i = 0; i < lines.length; i++){
    circle((xscale * k[i]) + 20, abs((yscale  * wordfrequency.get(str(k[i]))) - 970), 10);
  
    
    
   
  }
  
  
}
