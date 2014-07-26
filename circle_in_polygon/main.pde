Circle circle;
Line line;
Mouse mouse;
Star star;
Polygon octagon;

void setup() {
  size(300, 300);
  circle = new Circle(width/2, height/2, 20);
  //line = new Line(new PVector(10.0f, 150.0f), new PVector(200.0f, 150.0f));
  //star = new Star(new PVector(width/2,25),100);
                        //num , position , r 
  octagon = new Polygon(5, new PVector(width/2, height/2), 100);
  mouse = new Mouse();
}

void draw() {

  background(255);
  stroke(0);
  mouse.Update();
  circle.Update();
  //star.Update();
  octagon.Update();
  //line.Update();
  circle.Draw();
  //star.Draw();
  octagon.Draw();
  //line.Draw();
}

