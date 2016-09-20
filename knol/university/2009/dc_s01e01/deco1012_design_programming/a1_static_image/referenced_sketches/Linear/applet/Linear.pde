//Linear\\
//initials
size(400,400);
background(255);
translate(0,height/2);
smooth();
int starMax=round(random(8))+1; // random amount of stars, at least always 1
float e=2.71;
float totalHeight=width/starMax; //the total height, or baseline width each 'star' can occupy
float tailHeight=totalHeight*4/5; // a ratio of the tailHeight to headHeight of the star with regards to totalHeight
float headHeight=totalHeight-tailHeight;
float initHeadWidth=50; // starting width, [ actually height ] , of the graph
float headWidth=initHeadWidth; //setting up headWidth
float intHeadWidth=(height/1.5-initHeadWidth)/starMax; //changing intHeadWidth to conform with starMax when headWidth has been calculated
float xInterval=0.1; // the accuracy of the pixels in the image
float yInterval=0.1;
float yMax=0; //setting up y floats to be used later in drawing the ppoints
float yCur=0;
float cMax=random(100)+155; // the maximum colour of a star
float cMin=random(100)+0; // the minimum colour of a star
float cIntMax=(cMax-20)/starMax; // the amount the colours change with each star
float cIntMin=(cMin-0)/starMax;
for (float starCur=0; starCur<=starMax; starCur++) {
  //tail of star
  //covers x values
  for (float x=0; x<=tailHeight; x+=xInterval) {
    //calculate the y value of the graph with maths
    yMax=(pow(e,x*log(headWidth+1)/tailHeight)-1);
    //draw y points to fill in this graph, with changing colours
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(cMax-abs(yCur/yMax)*(cMax-cMin)+cMax-x/(tailHeight+headHeight)*(cMax-cMin)); // determines the colour
      point (x, yCur);
    }
  }
  //head of star
  //covers x values
  for (float x=tailHeight; x<=(tailHeight+headHeight); x+=xInterval) {
    //calculate the y value of the graph with maths
    yMax=(pow(e,(x-tailHeight-headHeight)*log(headWidth+1)/-headHeight)-1);
    //draw y points to fill in this graph, with changing colours
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(cMax-abs(yCur/yMax)*(cMax-cMin)+cMax-x/(tailHeight+headHeight)*(cMax-cMin)); // determines the colour
      point (x, yCur);
    }
  }
  translate(tailHeight+headHeight,0); //position the origin to the next position to draw a new star
  cMax-=cIntMax; //changing colours
  cMin-=cIntMin;
  headWidth+=intHeadWidth; //changing [height] of the tips of the stars
}

saveFrame("Linear.jpg");

