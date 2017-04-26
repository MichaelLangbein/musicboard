class Object{
  float x;
  float y;
  float radius;
  int npoints;
  
  Object(float x, float y, float radius, int npoints){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.npoints = npoints;
  }  
  
  void drawSelf(){
    ellipse(x, y, radius, radius);
    polygon();
  }
  
  void polygon() {
    pushMatrix();
    translate(x, y);
    rotate(PI/2);
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = cos(a) * radius;
      float sy = sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  boolean inShape(int cx, int cy){
    return ( abs(cx - x) < radius+2 ) && ( abs(cy - y) < radius+2 );
  }
}