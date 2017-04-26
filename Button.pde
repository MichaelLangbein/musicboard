class Button extends Object{
  Tone tone;
  float[] colors;
  
  Button(int x, int y, int r, int n){
    super(x, y, r, 6);
    tone = new Tone(n);
    colors = new float[3];
    colors[0] = tone.f/880.0;
    colors[1] = 30;
    colors[2] = 30;
  }
  
  void onPress(){
    tone.play();
    colors[0] += 20;
  }
  
  void drawSelf(){
    colorMode(HSB, 4);
    fill(colors[0], colors[1], colors[2]);
    //ellipse(x,y,2*radius,2*radius);
    polygon();
    fill(255,255,255);
    text("" + tone.n%12, this.x-4, this.y+5);
    colors[0] = tone.f/880.0;
  }
  
}