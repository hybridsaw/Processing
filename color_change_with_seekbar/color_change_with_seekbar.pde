float xh;
float yh;
float xo;
float yo;
float red = 0;
float green = 0;
float blue = 0;
COLOR change_color = COLOR.RED;

void setup() {
  size(300, 300);
  xh = 70;
  yh = height/2;
  xo = 255;
  yo = height/2;
}

void draw() {
  background(red, green, blue);
  String s = "now color(" + (int)red +','+ (int)green +','+ (int)blue + ")";
  text(s,10,10);
  s = "choosing color = ";
  line(xh, yh, xo, yo);
  float a = map(mouseX, 0, width, 0, 1);
  if (change_color == COLOR.RED) {
    red = 255 * a;
    s += "RED";
  }
  else if (change_color == COLOR.GREEN) {
    green = 255 * a;
    s += "GREEN";
  }
  else if (change_color == COLOR.BLUE) {
    blue = 255 * a;
    s += "BLUE";
  }
  float xf = xh + a * (xo - xh);
  float yf = yh + a * (yo - yh);
  text(s,10,20);
  ellipse(xf, yf, 10, 10);
}

void mouseReleased() {
  if (change_color == COLOR.RED) {
    change_color = COLOR.GREEN;
  } 
  else if(change_color == COLOR.GREEN){
    change_color = COLOR.BLUE;
  }
  else if(change_color == COLOR.BLUE){
    change_color = COLOR.RED; 
  }
}

