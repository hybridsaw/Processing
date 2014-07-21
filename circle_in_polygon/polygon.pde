class Polygon {
  PVector center;
  ArrayList<Line> sides;
  Polygon(float num, PVector _center, float r) {
    sides = new ArrayList<Line>();
    center = _center;
    float vertex_ang = 360.0f / num;
    PVector vec = new PVector(r, 0);
    PVector v1 = new PVector();
    PVector v2 = new PVector();
    
    for (float i = 0; i<num ; i++) {
      PVector start = PVector.add(center , vec);
      vec.rotate(vertex_ang * PI / 180f);
      PVector goal = PVector.add(center , vec);

      Line side = new Line(start, goal);
      sides.add(side);
    }
  }
  void Draw() {
    int n = sides.size();
    for (int i = 0; i < n; i++) {
      sides.get(i).Draw();
    }
  }
  void Update() {
    int n = sides.size();
    for (int i = 0; i < n; i++) {
      sides.get(i).Update();
    }
  }
}

