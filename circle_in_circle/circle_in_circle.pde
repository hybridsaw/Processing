float cx;
float cy;
float r;

void setup(){
  size(300,300);
  cx = width/2;
  cy = height/2;
  r = 100;
}

void draw(){
  background(255);
  stroke(0);
  ellipse(cx,cy,2*r,2*r);
  float x,y,r1;
  x = mouseX;
  y = mouseY;
  r1 = 20;
  //ellipse(x,y,2*r1,2*r1);
  
  float dx = x - cx;
  float dy = y - cy;
  float d = sqrt(dx*dx+dy*dy);

  if(r < d + r1){
   float rate = (r-r1)/d;
   x=cx+dx*rate;
   y=cy+dy*rate;
   stroke(255,0,0);
  }
  ellipse(x,y,2*r1,2*r1);
  line(cx,cy,x,y);
}
