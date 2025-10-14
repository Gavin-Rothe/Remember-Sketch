ArrayList<mouse> mice = new ArrayList<mouse>();
PrintWriter doc;

void setup(){
  size(600,600);
  background(100);
}

void draw(){
  rect(mouseX, mouseY, 10,10);
  mice.add(new mouse(mouseX,mouseY));
}

void mousePressed(){
  noLoop();
background(100);
parseFile();
}

void keyPressed(){
  noLoop();
  background(100);
  doc = createWriter("mouse.csv");
  doc.println("x,y");
  for(mouse z : mice){
    doc.println(z.toCSVLine());
  }
doc.flush();
doc.close();
}

void parseFile() {
  BufferedReader reader = createReader("points.csv");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ',');
      float x = float(pieces[0]);
      float y = float(pieces[1]);
      mice.add( new mouse(x,y) );
      circle(x,y,20);
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}
