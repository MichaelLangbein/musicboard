class Tone{
  public float f;
  public float a;
  public int n;
  private AudioOutput ao;
  
  Tone(int n){
    this.n = n;
    this.f = getNStepsUp(220, n);
    this.a = 1;
    this.ao = out;
  }
  
  void play(){
    ao.playNote(0, 1, new SineInstrument(this.f));
  }
  
  public int getN(float f0, float fx){
    float n =  log2( fx/f0 ) * 12;
    return (int)n;
  }
  
  public float getNStepsUp(float base, int n){
    return base * pow(2, (n/12.0));
  }
  
  public float log2(float f){
    return (float)Math.floor(Math.log(f)/Math.log(2.0));
  }
}