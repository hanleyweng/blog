class Plinth {

  PVector pos, dim;
  PImage tex1, tex2, tex3, tex4, tex5, tex6;
  float r;
  Plinth(PVector _pos, PVector _dim, float _r) {
    pos = _pos;
    dim = _dim;
    r  = _r;
  }

  void update() {
  }

  void display() {
    pushMatrix();
    //r=90;
    translate(pos.x, pos.y, -dim.z/2);
    //rotateX(radians(270));
    rotateZ(radians(r));
    rectangularPrism(new PVector(), dim);
    popMatrix();
  }
}

