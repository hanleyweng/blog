size(400,400);
background(255);
float flowerMax=6;
float flowerCur=0;
noFill();
float petalMax, petalCur, petalWidth, petalRadius, oX, oY;
for (flowerCur=0; flowerCur<flowerMax; flowerCur++) {
  pushMatrix();
  translate(random(width),random(height));
  petalMax=random(10)+2;
  petalCur=0;
  petalWidth=random(50)+10;
  petalRadius=random(100)+50;
  for (petalCur=0; petalCur<petalMax; petalCur++) {
    ellipse (0,0,petalWidth,petalRadius);
    rotate(PI*2/petalMax);
  }
  popMatrix();
}


