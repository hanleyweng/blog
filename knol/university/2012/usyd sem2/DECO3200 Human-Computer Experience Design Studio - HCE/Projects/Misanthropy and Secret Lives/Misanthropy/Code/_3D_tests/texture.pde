PImage mapping() {
  
  
  PGraphics a = createGraphics(100, 100, P2D);
  a.beginDraw();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      colorMode(HSB,360,255,255);
      a.set(i, j, color(frameCount%360, 255,255-j*(sin(radians(frameCount%360))*-2)));
      colorMode(RGB);

    }
  }
  a.endDraw();

  PImage r = new PImage(100, 100);
  for (int i = 0; i < r.width; i++) for (int j = 0; j < r.height; j++) r.set(i, j, a.get(i, j));
  //  r = a;
  return r;
}

