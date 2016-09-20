size(400,400);
//background(0);
translate(width/2, height/2);

float radius=150;
ellipse(0,0,radius*2,radius*2);

float e=2.71;
float xInterval=0.1;
float yInterval=0.1;
float yMax=0;
float yCur=0;
float cMax=100;
float cMin=0;

float starCur=0;
float starMax=random(10);

float headHeight, headWidth, tailHeight, tailHeightMax;

for (starCur=0; starCur<starMax; starCur++) {
  headWidth=random(radius*2/starMax)+10;
  headHeight=headWidth/1.5;
  tailHeight=random(radius-20)+20;
  tailHeightMax=sqrt(pow(radius,2)-pow(headWidth,2));

  line(tailHeightMax-tailHeight,0,width,0);
  for (float x=0; x<=tailHeight; x+=xInterval) {
    yMax=(pow(e,x*log(headWidth+1)/tailHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(cMax-abs(yCur/yMax)*(cMax-cMin)+cMax-x/(tailHeight+headHeight)*(cMax-cMin));
      point (x+tailHeightMax-tailHeight, yCur);
    }
  }
  for (float x=tailHeight; x<=(tailHeight+headHeight); x+=xInterval) {
    yMax=(pow(e,(x-tailHeight-headHeight)*log(headWidth+1)/-headHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(cMax-abs(yCur/yMax)*(cMax-cMin)+cMax-x/(tailHeight+headHeight)*(cMax-cMin));
      point (x+tailHeightMax-tailHeight, yCur);
    }
  }
  rotate (PI*2/starMax);
}





