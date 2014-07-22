class Star {
  ArrayList<Line> sides;
  Star(PVector top_pos, float _length) {
    sides = new ArrayList<Line>();
    PVector start = new PVector();
    PVector goal = top_pos;
    PVector add_vec = new PVector( _length, 0);
    add_vec.rotate(PI / 180.0f * -72.0f);
    for (int i = 0; i < 10; i++) {
      start = goal;
      if (i % 2 == 0) {
        add_vec.rotate(PI / 180.0f * 144.0f);
      } else if (i % 2 == 1) {
        add_vec.rotate(PI / 180.0f * -72);
      }
      //add_vec.rotate(PI / 180.0f * 72f);
      goal = PVector.add(goal,add_vec);
      Line side = new Line( start, goal );
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

