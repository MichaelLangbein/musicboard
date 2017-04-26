import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


int[] pos(int n){
  int[] p = new int[2];
  p[0] = n%24;
  p[1] = n/24;
  return p;
}

int[] board(int n){
  int[] p = pos(2*n);
  println(n + " => "+ p[0] + ", " + p[1]);
  return p;
}


int chessboard(int r, int c){
  return (r+c)%2;
}

int note(int r, int c){
  return (int)((r-1)/2.0 + c*3.5);
}

int N(int R, int C){
  return (R*C)/2;
}


Minim minim;
AudioOutput out;
int R = 10;
int C = 10;
int N = N(R,C);
Button[] bs = new Button[N];
int radius = 20;
int vertDist = (int)( 2 * radius * cos(PI/6) );
int diagDist = vertDist;

void setup(){
  size(250,300);
  background(0);
  
  minim = new Minim(this);
  out = minim.getLineOut(); //<>//
  
  vertDist = (int)(vertDist*0.86);
  diagDist = (int)(diagDist*0.55);
  
  int n = 0; //<>//
  for(int c = 0; c<C; c++){
    for(int r = 0; r<R; r++){
      if(chessboard(r,c) == 1){
        int note = note(r,c);
        int xpos =  c*diagDist + 50;
        int ypos = height - r*vertDist - 50;
        bs[n] = new Button(xpos, ypos, radius, note);
        n++;
      }
    }
  }
}

void draw(){
  for(int n = 0; n<N; n++){
    bs[n].drawSelf();
  }
}


void mouseClicked(){
  for(int i = 0; i < bs.length; i++){
    if(bs[i].inShape(mouseX,mouseY)){
      bs[i].onPress();
    }
  }
}