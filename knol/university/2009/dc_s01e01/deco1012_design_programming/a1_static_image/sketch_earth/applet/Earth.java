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

public class Earth extends PApplet {
  public void setup() {//Earth\\

//START

size(400,400);
background(0); // background black - space-like
translate(width/2, height/2); //centre the origin
rotate(PI*3/2); //rotate the stage by 90degrees anticlockwise; so points start off there, an aesthetically more pleasing central point
smooth(); //smooth made things look Alot better
// the random size of Earth's radius - simulated the varying viewing distances from Earth -- rendering different levels of easily observable details 
// (such as humans at a close distance and the extended ines - constraints - at a further distance )
float radius=random(75,200); 
float minEarthR=random(radius*2); // the minimal stage at which the gradient towards Earth's core is white
float earthF=255+minEarthR;
//create the radial gradient for Earth through a series of concentric ellipses of changing colours
for (float earthR=0; earthR<=radius*2; earthR++) {
  noStroke();
  fill((earthR)/(radius*2)*earthF);
  ellipse(0,0,radius*2-earthR,radius*2-earthR);
}
//
float e=2.72f; // the required value to work with logs in maths

//star/graph initial variables
float xInterval=0.1f; // the accuracy of the pixels (the more accurate, the longer the render times)
float yInterval=0.1f;
float yMax=0; //setting up the use of y values in creating the log graphs (will call them stars)
float yCur=0;
float cMax=50; //minimum and maximum colours used within the stars
float cMin=0;

float starCur=0; //setting up current star float and maximum amount of stars with a minimum of 1
float starMax=round(random(19))+1;

//star characteristics; a tail and a head, two tips of the star, the width of the star is tangential to the circe and vice versa for the hight of the star
float minHeadWidth=5;//the minimum headWidth of a star
float starXcut=round(abs(random(radius*2-50)-50)); //a random value for where there is a secondary translucent layer
float headHeight, headWidth, tailHeight, tailHeightMax, headSpace; //headSpace, is the maximum headWidth obtainable by a star, similarly for tailHeightMax and tailHeight

//starXcut -- setting out the outline for the secondary translucent layer which will be under the stars
strokeWeight(20);
stroke(255*0.9f,255*1.0f);
fill(250,255*0.0f);
ellipse(0,0,starXcut,starXcut);
strokeWeight(1);


//midFlower -- setting up a flower
float petalMax, petalCur, petalWidth, petalRadius, petalX, petalY;
noFill();
strokeWeight(1);
stroke(round(random(155))); //random dark stroke colour
petalWidth=random(20)+1; // the width of a petal, which must be 1 or larger - determines maximum and radius of petals as well
petalMax=round(random(petalWidth*2))+3; // maximum petals, must be 3 or larger
petalRadius=petalWidth*(random(5)+3); // radius/height of petals based on petalWidth
petalX=random(petalWidth)-petalWidth/2; // random placements of the petals for occasionally multilayered systems
petalY=random(petalRadius)-petalRadius/2;
pushMatrix();
//rotating the petals around to create a flower-like symbol
for (petalCur=0; petalCur<petalMax; petalCur++) {
  ellipse (petalX,petalY,petalWidth,petalRadius);
  rotate(PI*2/petalMax);
}
popMatrix(); //return to original rotation

//Earth Atmosphere blends well with the edges of stars and places a definitive boundary of the Earth
stroke(100);
strokeWeight(2);
noFill();
ellipse(0,0,radius*2,radius*2);
strokeWeight(1);

float xpplInterval, shoulderRad, shoulderOffset, headRad; 
//setting up variables for humans; 
//xpplInterval= the space between each person, shoulderRad=radius of a shoulder; 
//shoulderOffset=distance of shoulder from head; headRad=radius of a head;

//Creating the stars; log graphs
for (starCur=0; starCur<starMax; starCur++) {
  //determining maximum occupiable space of a star
  headSpace=sqrt(2*pow(radius,2)-2*radius*radius*cos(radians(360/starMax)))/2;// a2=b2+c2-2bcCosA } 
   //setting up headWidth
  if (headSpace<(radius/2)) { //the maximum obtainable headSpace should always be less than radius/2 or else the headHeight is far too great and not aesthetically pleasing, abstracting the shape of the graph
    headWidth=random(headSpace-minHeadWidth)+minHeadWidth;
  } else {
    headWidth=random(radius/2-minHeadWidth)+minHeadWidth;
  }
  if (starMax==1){//headspace formula redundant at starMax==1, hence a special case if statement
    headWidth=random(radius/2-minHeadWidth)+minHeadWidth;
  }
  //determining head heights and tail heights of the star
  headHeight=pow((headWidth/radius),1.1f)*radius*2;//+random(headHeightMore);//headWidth; // needs to conform to headWidth
  tailHeight=random(radius-headWidth/4);
  //determining the maximum tail height gives the radial offset of the star, its distance from the centre
  tailHeightMax=sqrt(pow(radius,2)-pow(headWidth,2));
  
  //drawing the tail
  stroke(cMax); //setting the initial colour
  line(tailHeightMax-tailHeight,0,width,0); // creating a line, symbolising constraints outward from the star
  for (float x=0; x<=tailHeight; x+=xInterval) {
    //calculating y value of graph
    yMax=(pow(e,x*log(headWidth+1)/tailHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(abs(yCur/yMax)*(cMax-cMin)+x/(tailHeight+headHeight)*(cMax-cMin)); // setting the colour of the points that change in relation to its co-ordinates
      point (x+tailHeightMax-tailHeight, yCur); // positioning the point
    };
  }
  //drawing the head -- code similar to that of the tail
  for (float x=tailHeight; x<=(tailHeight+headHeight); x+=xInterval) {
    yMax=(pow(e,(x-tailHeight-headHeight)*log(headWidth+1)/-headHeight)-1);
    for (yCur=-yMax; yCur<=yMax; yCur+=yInterval){
      stroke(abs(yCur/yMax)*(cMax-cMin)+x/(tailHeight+headHeight)*(cMax-cMin));
      point (x+tailHeightMax-tailHeight, yCur);
    }
  }
  //Humans
  for (float x=0; x<=(tailHeight+headHeight); x+=xpplInterval) {
    //person
    strokeWeight(1);
    stroke(100);
    fill(255,255*0.75f); // semi transparency
    //determining headRadius
    headRad=10*abs((tailHeight-x))/tailHeight;//head radius of person depdent on its closeness to the Earth's centre
    if (tailHeight<x) {
      headRad=headRad/4;
    }
    if (headRad>10) { //limiting head size
      headRad=10;
    } else {
      headRad+=1;//make inner heads slightly bigger
    }
    //setting the shoulders
    shoulderRad=headRad*6/10;
    //setting the space taken by person
    xpplInterval=headRad+1;
    //setting the space taken by shoulders
    shoulderOffset=shoulderRad*2/3;
    //drawing the person
    ellipse(x+tailHeightMax-tailHeight,-shoulderOffset,shoulderRad,shoulderRad);
    ellipse(x+tailHeightMax-tailHeight,+shoulderOffset,shoulderRad,shoulderRad);
    ellipse(x+tailHeightMax-tailHeight,0,headRad,headRad);
  }
  //progress Report // [idea of render time ]
  //println(round((starCur+1)*100/starMax)+" % Complete");
   rotate (PI*2/starMax); // rotate the stage each time in order to fit all the stars on at regular intervals
}

//starXcut -- drawing the secondary, translucent, layer ellipse that is penetratable by the stars and humans, being produced after their code
strokeWeight(3);
stroke(5,255*0.0f);
fill(250,255*0.6f);
ellipse(0,0,starXcut,starXcut);

//tree - a series of concentric cirlces for the representation of a pine-like tree
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

//END

saveFrame("Earth.jpg");


  noLoop();
} 
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Earth" });
  }
}
