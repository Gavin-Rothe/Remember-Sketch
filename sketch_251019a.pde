ArrayList<mouse> mice = new ArrayList<mouse>();
JSONObject json = new JSONObject();
//PrintWriter doc;

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
  if(key== '1') {
  noLoop();
  background(100);
  json.setInt("canvasWidth", width);
  json.setInt("canvasHeight", height);
  JSONObject backgroundColor = new JSONObject();
  backgroundColor.setInt("r", 100);
  backgroundColor.setInt("g", 100);
  backgroundColor.setInt("b", 100);
  json.setJSONObject("backgroundColor", backgroundColor);
  JSONArray jsonMice = new JSONArray();
  for(int i = 0; i < mice.size(); i++) {
    jsonMice.setJSONObject(i, mice.get(i).toJSONObject());
  }
  json.setJSONArray("mice", jsonMice);
  saveJSONObject(json, "mice.json");
  }
  
  if(key == '2') {
    for(mouse p : mice) {
      System.out.println(p);
      rect(p.x, p.y, 10,10);
    }
    redraw();
  }
}

 // doc = createWriter("mouse.csv");
  //doc.println("x,y");
 // for(mouse z : mice){
   // doc.println(z.toCSVLine());
//  }
//doc.flush();
//doc.close();


void parseFile() {
  JSONObject json = loadJSONObject("mice.json");
  JSONArray jsonMice = json.getJSONArray("mice");
  for( int i = 0; i < jsonMice.size(); i++) {
    JSONObject mouse = jsonMice.getJSONObject(i);
    rect(mouse.getFloat("x"),mouse.getFloat("y"),10,10);
  }
 // BufferedReader reader = createReader("points.csv");
 // String line = null;
 // try {
   // while ((line = reader.readLine()) != null) {
     // String[] pieces = split(line, ',');
     // float x = float(pieces[0]);
     // float y = float(pieces[1]);
     // mice.add( new mouse(x,y) );
     // circle(x,y,20);
   // }
   // reader.close();
 // } catch (IOException e) {
   // e.printStackTrace();
 // }
}
