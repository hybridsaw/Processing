float top;
float bottom;
float left;
float right;

void setup(){
  size(300,300);
  top = height/4;
  bottom = height/4*3;
  left = width/4;
  right = width/4*3;
}

void draw(){
  background(255);
  stroke(0);
  //   (  x,  y,     width,    height)
  rect(left,top,right-left,bottom-top);
  float x,y,r1;
  x = mouseX;
  y = mouseY;
  r1 = 20;
  
  if(top > y - r1){
    y = top + r1;
    stroke(255,0,0);
  }
  else if(bottom < y + r1){
   y = bottom - r1; 
   stroke(255,0,0);
  }
  
  if(left > x - r1){
   x = left + r1; 
   stroke(255,0,0);
  }
  else if(right < x + r1){
   x = right - r1;
   stroke(255,0,0);
  }
  ellipse(x,y,2*r1,2*r1);
}
