Circle circle;
Mouse mouse;
ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  size(300, 300);
  circle = new Circle(width/2, height/2, 20);
  for (int i = 0; i < 8 ; i++) {
    Star star = new Star(new PVector(width/2, 25), 100);
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

