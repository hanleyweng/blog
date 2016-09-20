
size(800,450);

int diam=width/100;
int squareState=0;
int squareX=0;
int squareY=250;
background(random(255));
for (int ix=0; ix<(width/diam); ix++) {
  for (int iy=0; iy<(height/diam); iy++) {
    fill(random(255),random(255),random(255));
    stroke(random(255),random(255),random(255));
    strokeWeight(random(2));
    ellipse(diam/2+ix*diam,diam/2+iy*diam,diam,diam);
  }
}
while (squareState==0) {
  strokeWeight(squareX/height*5);
  fill(random(50)+205,random(50)+205,random(50)+205,random(55)+200);
  quad (squareX,squareY,squareX+diam,squareY,squareX+diam,squareY+diam,squareX,squareY+diam);
  int squareXoY=round(random(1));
  if (squareXoY==1){
  squareX+=diam;
  } else {
  squareY+=diam*(round(random(2)-1));
  }
  diam *= 1.15;
  if (squareX>width){
    squareState=1;
  }
}

