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

public class Spider extends PApplet {
  public void setup() {//Spider\\
//initials
size (400,400);
background(255);
translate(width/2,height/2); // centre of the stage
float mRad=0; //ellipses x value
float mRadD=2; // the interval taken by ellipses' x value
float sizez=3;
float transM=6;//maximum translation in either x or y directions
// produces random translation interval for x and y
float transx=random(transM*2)-transM;
float transy=random(transM*2)-transM;
//empty circle
fill(0);
noStroke();
//Spider
//multiple rings of circles
for (int i=0; i<50; i++) {
  //a circle of circles
  for (int r=0; r<16; r++) {
    fill(0,80);//black with some alpha so can see through to any previous circles, more sense of depth
    ellipse(mRad,0,sizez,sizez);
    rotate(PI*2/16); //rotates stage as coherent to the amount of circles in a ring (16)
  }
  mRad+=mRadD; //radius from centre increases
  scale(1.1f); // stage gets bigger, hence circles + grid get bigger too
  translate(transx,transy); // translates grid at set intervals
}
saveFrame("Spider.jpg");



  noLoop();
} 
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Spider" });
  }
}
