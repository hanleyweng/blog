//Snake\\
//Initial States
size(800,450);
int diam=width/100; //diameter
int squareState=0; //gives the ok to produce more squares
int squareX=0; //the xPosition of the square
int squareY=250; //the yPosition of the square
//Background of Colourful Circles
background(random(255));
//rows
for (int ix=0; ix<(width/diam); ix++) {
  //columns
  for (int iy=0; iy<(height/diam); iy++) {
    //random colour values for stroke and fill
    fill(random(255),random(255),random(255));
    stroke(random(255),random(255),random(255));
    strokeWeight(random(2)); // random outline widths
    ellipse(diam/2+ix*diam,diam/2+iy*diam,diam,diam);
  }
}
//Snake
while (squareState==0) {
  strokeWeight(squareX/height*5); // stroke weight increases with squareX
  fill(random(50)+205,random(50)+205,random(50)+205,random(55)+200); // random Light colours
  quad (squareX,squareY,squareX+diam,squareY,squareX+diam,squareY+diam,squareX,squareY+diam); //drawing the squares, who's size relate to diameter value 
  int squareXoY=round(random(1)); // decides wheter the next square will be up or down, producing 0 or 1
  if (squareXoY==1){
    squareX+=diam; //increases squareX, moves it right by a diameter unit
  } 
  else {
    squareY+=diam*(round(random(2)-1)); //moves the next square either up or down by one diameter unit
  }
  diam *= 1.15; // diameter unit increases each time; hence squares get bigger towards the right
  if (squareX>width){
    squareState=1; // stops producing squares
  }
}

saveFrame("Snake.jpg");

