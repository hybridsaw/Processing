Circle circle;
Mouse mouse;
ArrayList<Star> stars = new ArrayList<Star>();
float count;

void setup() {
  size(300, 300);
  circle = new Circle(width/2, height/2, 20);
  for (float i = 0; i < 5 ; i++) {
    PVector center = new PVector(width/2,height/2-25);
    float r = 110;
    PVector add = new PVector(0f,-r);
    add.rotate((360f/5)*i/180f*PI);
    center.add(add);
    Star star = new Star(center, 30);
    stars.add(star);
  }
  mouse = new Mouse();
}

void draw() {

  background(255);
  stroke(0);
  mouse.Update();
  circle.Update();
  for (int i = 0;i < stars.size();i++) {
    stars.get(i).Update();
  }
  circle.Draw();
  for (int i = 0;i < stars.size();i++) {
    stars.get(i).Draw();
  }
}

