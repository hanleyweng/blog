import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class sketch_apr05b extends PApplet {
  public void setup() {//initials + Earth
size(400,400);
background(0);
translate(width/2, height/2);
rotate(PI*3/2);
smooth();
float radius=random(100,200);

float minEarthR=100;
float earthF=255+minEarthR;
for (float earthR=0; earthR<=radius*2; earthR++) {
  noStroke();
  fill((earthR)/(radius*2)*earthF);
  ellipse(0,0,radius*2-earthR,radius*2-earthR);
}
stroke(100);
strokeWeight(2);
noFill();
ellipse(0,0,radius*2,radius*2);
strokeWeight(1);
float e=2.71f;

//star (graph)
float xInterval=0.1f;
float yInterval=0.1f;
float yMax=0;
float yCur=0;
float cMax=50;
float cMin=0;

float starCur=0;
float starMax=round(random(19))+1;

float minHeadWidth=5;
float headHeightMore=0;
float starXcut=round(abs(random(radius*2-50)-50));
float headHeight, headWidth, tailHeight, tailHeightMax, headSpace;

//starXcut
strokeWeight(20);
stroke(255*0.9f,255*1.0f);
fill(250,255*0.0f);
ellipse(0,0,starXcut,starXcut);
strokeWeight(1);


//midFlower
float petalMax, petalCur, petalWidth, petalRadius, petalX, petalY;
noFill();
strokeWeight(1);
stroke(round(random(155)));
petalWidth=random(20)+1;
petalMax=random(petalWidth*2)+3;
petalRadius=petalWidth*(random(5)+3);
petalX=random(petalWidth)-petalWidth/2;
petalY=random(petalRadius)-petalRadius/2;
for (petalCur=0; petalCur<petalMax; petalCur++) {
  ellipse (petalX,petalY,petalWidth,petalRadius);
  rotate(PI*2/petalMax);
}

//people
float xpplInterval, shoulderRad, shoulderOffset, headRad;

float count=0;
for (starCur=0; starCur<starMax; starCur++) {
  //l=r\u00e6
  headSpace=sqrt(2*pow(radius,2)-2*radius*radius*cos(radians(360/starMax)))/2;// need to do a2=b2+c2-2bcCosA
  headWidth=random(radius/2-minHeadWidth)+minHeadWidth;//random(radius/2-minHeadWidth)+minHeadWidth;//random(headSpace/2);//random(100)+10; // needs to conform to starMax
  if (headSpace<(radius/2)) {
    headWidth=random(headSpace-minHeadWidth)+minHeadWidth;
  }
  if (starMax==1){
    headWidth=random(radius/2-minHeadWidth)+minHeadWidth;
  }
  headHeight=pow((headWidth/radius),1.1f)*radius*2+random(headHeightMore);//headWidth; // needs to conform to headWidth
  tailHeight=random(radius-headWidth/4);
  tailHeightMax=sqrt(pow(radius,2)-pow(headWidth,2));

  stroke(cMax);
  line(tailHeightMax-tailHeight,0,width,0);
  for (float x=0; x<=tailHeight; x+=xInterval) {
    yMax=(pow(e,x*log(headWidth+1)/tailHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(abs(yCur/yMax)*(cMax-cMin)+x/(tailHeight+headHeight)*(cMax-cMin));
      point (x+tailHeightMax-tailHeight, yCur);
    };


  }
  for (float x=tailHeight; x<=(tailHeight+headHeight); x+=xInterval) {
    yMax=(pow(e,(x-tailHeight-headHeight)*log(headWidth+1)/-headHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(abs(yCur/yMax)*(cMax-cMin)+x/(tailHeight+headHeight)*(cMax-cMin));
      point (x+tailHeightMax-tailHeight, yCur);
    }
  }
  for (float x=0; x<=(tailHeight+headHeight); x+=xpplInterval) {
    //person
    strokeWeight(1);
    stroke(100);
    fill(255,255*0.75f);
    headRad=10*abs((tailHeight-x))/tailHeight;
    if (tailHeight<x) {
      headRad=headRad/4;
    }
    if (headRad>15) {
      headRad=15;
    }
    shoulderRad=headRad*6/10;
    xpplInterval=headRad+1;
    shoulderOffset=shoulderRad*2/3;
    ellipse(x+tailHeightMax-tailHeight,-shoulderOffset,shoulderRad,shoulderRad);
    ellipse(x+tailHeightMax-tailHeight,+shoulderOffset,shoulderRad,shoulderRad);
    ellipse(x+tailHeightMax-tailHeight,0,headRad,headRad);
    //person
    count++;
    println(count);
  }
  rotate (PI*2/starMax);
}

//starXcut

strokeWeight(3);
stroke(5,255*0.0f);
fill(250,255*0.6f);
ellipse(0,0,starXcut,starXcut);

//tree
float treeMaxRad=15;
stroke(155,255*0.5f);
strokeWeight(1.2f);
fill(0,255*0.2f);
ellipse(0,0,treeMaxRad*2,treeMaxRad*2);
fill(0,255*0.2f);
ellipse(0,0,treeMaxRad*1.5f,treeMaxRad*1.5f);
fill(0,255*0.2f);
ellipse(0,0,treeMaxRad*1,treeMaxRad*1);
fill(0,255*0.2f);
ellipse(0,0,treeMaxRad*0.5f,treeMaxRad*0.5f);
point(0,0);


  noLoop();
} 
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "sketch_apr05b" });
  }
}
