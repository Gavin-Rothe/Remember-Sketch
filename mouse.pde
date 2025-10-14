class mouse {
  float x;
  float y;
  
  mouse(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  String toString(){
    return "("+x+","+y+")";
  }
    
  String toCSVLine() {
    return x+","+y;
  }
  
  JSONObject toJSONObject(){
    JSONObject rats = new JSONObject();
    rats.setFloat("x",this.x);
    rats.setFloat("y",this.y);
    return rats;
    
  }
}
