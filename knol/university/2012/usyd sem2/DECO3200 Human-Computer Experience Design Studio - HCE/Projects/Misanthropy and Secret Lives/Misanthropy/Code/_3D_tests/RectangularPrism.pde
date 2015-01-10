void rectangularPrism(float x, float y, float z, float xl, float yl, float zl) { //parameters: xpos,ypos,zpos, xlength,ylength,zlength
  //fill(frameCount%255, (frameCount+50)%255 , (frameCount-50)%255);

  pushMatrix();
  translate(-xl/2, -yl/2, -zl/2);

  beginShape(QUADS);    // +Z "front" face
  texture(tex);  
  vertex(   x, y, z+zl, 0, 0);
  vertex(x+xl, y, z+zl, 1, 0);
  vertex(x+xl, y+yl, z+zl, 1, 1);
  vertex(   x, y+yl, z+zl, 0, 1);  
  endShape();

  beginShape(QUADS);    // -Z "back" face
  texture(tex);
  vertex(x+xl, y, z, 0, 0);
  vertex(   x, y, z, 1, 0);
  vertex(   x, y+yl, z, 1, 1);
  vertex(x+xl, y+yl, z, 0, 1);
  endShape();

  beginShape(QUADS);    // +Y "bottom" face
  texture(tex);  
  vertex(   x, y+yl, z+zl, 0, 0);
  vertex(x+xl, y+yl, z+zl, 1, 0);
  vertex(x+xl, y+yl, z, 1, 1);
  vertex(   x, y+yl, z, 0, 1);   
  endShape();


  beginShape(QUADS);  // -Y "top" face
  texture(tex2);
  vertex(   x, y, z, 0, 0);
  vertex(x+xl, y, z, 1, 0);
  vertex(x+xl, y, z+zl, 1, 1);
  vertex(   x, y, z+zl, 0, 1);
  endShape();

  beginShape(QUADS);  // +X "right" face
  texture(tex2);
  vertex(x+xl, y, z+zl, 0, 0);
  vertex(x+xl, y, z, 1, 0);
  vertex(x+xl, y+yl, z, 1, 1);
  vertex(x+xl, y+yl, z+zl, 0, 1);   
  endShape();

  beginShape(QUADS);  // -X "left" face
  texture(tex2);
  vertex(x, y, z, 0, 0);
  vertex(x, y, z+zl, 1, 0);
  vertex(x, y+yl, z+zl, 1, 1);
  vertex(x, y+yl, z, 0, 1);
  endShape();

  popMatrix();
}

void rectangularPrism(PVector pos, PVector dim) { 

  pushMatrix();
  translate(-dim.x/2, -dim.y/2, -dim.z/2);

  beginShape(QUADS);    // +Z "top" face
  texture(tex2);  
  vertex(      pos.x, pos.y, pos.z+dim.z, 0, 0);
  vertex(pos.x+dim.x, pos.y, pos.z+dim.z, 1, 0);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z+dim.z, 1, 1);
  vertex(      pos.x, pos.y+dim.y, pos.z+dim.z, 0, 1);  
  endShape();

  beginShape(QUADS);    // -Z "bottom" face
  texture(tex);
  vertex(pos.x+dim.x, pos.y, pos.z, 0, 0);
  vertex(      pos.x, pos.y, pos.z, 1, 0);
  vertex(      pos.x, pos.y+dim.y, pos.z, 1, 1);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z, 0, 1);
  endShape();

  beginShape(QUADS);    // +Y "front" face
  texture(tex);  
  vertex(      pos.x, pos.y+dim.y, pos.z+dim.z, 0, 0);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z+dim.z, 1, 0);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z, 1, 1);
  vertex(      pos.x, pos.y+dim.y, pos.z, 0, 1);   
  endShape();


  beginShape(QUADS);  // -Y "back" face
  texture(tex2);
  vertex(      pos.x, pos.y, pos.z, 0, 0);
  vertex(pos.x+dim.x, pos.y, pos.z, 1, 0);
  vertex(pos.x+dim.x, pos.y, pos.z+dim.z, 1, 1);
  vertex(      pos.x, pos.y, pos.z+dim.z, 0, 1);
  endShape();

  beginShape(QUADS);  // +X "right" face
  texture(tex);
  vertex(pos.x+dim.x, pos.y, pos.z+dim.z, 1, 0);
  vertex(pos.x+dim.x, pos.y, pos.z, 1, 1);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z, 0, 1);
  vertex(pos.x+dim.x, pos.y+dim.y, pos.z+dim.z, 0, 0);   
  endShape();

  beginShape(QUADS);  // -X "left" face
  texture(tex);
  vertex(pos.x, pos.y, pos.z, 0, 0);
  vertex(pos.x, pos.y, pos.z+dim.z, 1, 0);
  vertex(pos.x, pos.y+dim.y, pos.z+dim.z, 1, 1);
  vertex(pos.x, pos.y+dim.y, pos.z, 0, 1);
  endShape();

  popMatrix();
}

