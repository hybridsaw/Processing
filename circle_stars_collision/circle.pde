class Circle {
  PVector pos;
  float r;
  float speed;
  Circle(float x, float y, float _r) {
    pos = new PVector(x, y);
    r=_r;
    speed = r/3;
  }
  void Draw() {
    ellipse( pos.x, pos.y, r*2, r*2);
  }
  void Update() {
    PVector dir = PVector.sub(mouse.pos, pos);
    dir.normalize();
    dir.mult(speed);
    pos = PVector.add(pos, dir);
    if ( pos.dist(mouse.pos) < speed) {
      pos = mouse.pos;
    }
    //pos.x += norm(mouseX-pos.x, 0, 1) * speed;
    //pos.y += norm(mouseY-pos.y, 0, 1) * speed;
  }
}

