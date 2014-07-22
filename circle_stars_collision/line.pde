class Line {
  PVector start;
  PVector goal;
  Line(float x1, float y1, float x2, float y2) {
    start.x = x1;
    start.y = y1;
    goal.x = x2;
    goal.y = y2;
  }
  Line(PVector _start, PVector _goal) {
    start = _start;
    goal = _goal;
  }
  void Draw() {
    line(start.x, start.y, goal.x, goal.y);
  }
  void Update() {
    if (isHit()) {
      stroke(255, 0, 0);
    }
  }
  boolean isHit() {
    PVector line = PVector.sub(goal, start);
    PVector v = PVector.sub(circle.pos, start);
    PVector cross = line.cross(v);
    //mag = return vector's length
    float line_length = line.mag();
    float distance = cross.mag() / line_length;
    if ( distance < circle.r ) {
      PVector v2 = PVector.sub(circle.pos, goal);
      if (PVector.dot( v, line ) * PVector.dot( v2, line )<=0) {
        float dot = line.dot(v);
        float lerp_rate = dot/line_length / line_length;
        PVector nearest_point = PVector.lerp(start, goal, lerp_rate);
        PVector reject_direc = PVector.sub(circle.pos, nearest_point);
        reject_direc.normalize();
        reject_direc.mult(circle.r);
        circle.pos = PVector.add(nearest_point, reject_direc);
        return true;
      } else {
        if (v.mag()<circle.r||v2.mag()<circle.r) {
          float dot = line.dot(v);
          float lerp_rate = dot/line_length / line_length;
          PVector nearest_point = PVector.lerp(start, goal, lerp_rate);
          PVector reject_direc = PVector.sub(circle.pos, nearest_point);
          reject_direc.normalize();
          reject_direc.mult(circle.r);
          circle.pos = PVector.add(nearest_point, reject_direc);
          return true;
        }
      }
    }
    return false;
  }
}

