class Mouse {
  PVector pos;
  Mouse(){
   pos = new PVector(); 
  }
  void Update() {
    pos.x = mouseX;
    pos.y = mouseY;
  }
}

