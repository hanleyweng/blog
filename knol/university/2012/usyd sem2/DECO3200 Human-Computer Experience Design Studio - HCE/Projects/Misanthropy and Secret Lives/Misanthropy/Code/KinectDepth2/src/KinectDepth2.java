import processing.core.*;
import processing.serial.*;
import SimpleOpenNI.*;
import cc.arduino.*;

public class KinectDepth2 extends PApplet{
	
	public SimpleOpenNI context;
	public int[] dmap;
	public int base_presence;
	public int cur_calib_frame;
	public int total_colab_presence;
	public boolean in_calib;
	public PFont pres_font;
	
	public Arduino arduino;
	public int servoPin = 9;
	
	public void setup() {
		background(200,0,0);
		
		context = new SimpleOpenNI(this);
		//context.setMirror(true);
		context.enableDepth();
		
		size(context.depthWidth()*2, context.depthHeight());
		
		dmap = context.depthMap();		
		base_presence = 0;
		
		pres_font = createFont("Arial", 60);
		
		//arduino = new Arduino(this, Arduino.list()[0], 57600);
		//arduino.pinMode(servoPin, Arduino.OUTPUT);
		
		//println(Arduino.list());
	}
	
	public void draw() {
		background(255);
		context.update();
		//image(context.depthImage(),0,0);
		dmap = context.depthMap();
		context.setDepthImageColor(200, 100, 100);
		
		//drawDepth(2);
		image(context.depthImage(),context.depthWidth(),0);
		
		calibratePresence(2, 10);
		
		printPresence(getAdjustedPresence(2));
		
		//doServo();
		
	}
	
	public void delay(int time) {
		int delay_start = millis();
		while(millis() - delay_start < time) {
			//Wait around....
		}
	}
	
	public void doServo() {
		for(int i = 0; i < 180; i++) {
			arduino.analogWrite(servoPin, i);
			delay(15);
		}
		for(int i = 180; i > 1; i--) {
			arduino.analogWrite(servoPin, i);
			delay(15);
		}	
	}
	
	public void numZeros(int[] d) {
		int num = 0;
		for(int i = 0; i < d.length; i+=3) {
			if(d[i] == 0) {
				num += 1;
			}
		}
		println("ZEROES: " + num);
	}
	
	public void printPresence(int p) {
		textFont(pres_font);
		fill(200,0,0);
		text("Presence: " + p, 100, context.depthHeight() - 60);
		
	}
	
	public void drawDepth(int s) {
		
		PVector[] realWorldMap = context.depthMapRealWorld();
		PVector realWorldPoint;
		
		pushMatrix();
		
		translate(context.depthWidth()/2, context.depthHeight()/2);
		rotate(radians(180));
		
		for(int i=0; i < context.depthHeight(); i+=s) {
			for(int j=0; j < context.depthWidth(); j+=s) {
				int index = i*context.depthWidth() + j;
				if(dmap[index] > 0) {
					realWorldPoint = realWorldMap[index];
					strokeWeight(2);
					point(realWorldPoint.x,realWorldPoint.y);
				}
			}
		}
		popMatrix();
	}
	
	public void calibratePresence(int s, int f) {
		
		if(mousePressed && mouseButton == LEFT) {
			in_calib = true;
			total_colab_presence = 0;;
			cur_calib_frame = 0;			
		}
		
		if(in_calib) {
			total_colab_presence  += getPresence(2);
			
			if(cur_calib_frame == f-1) {
				in_calib = false;
				base_presence = total_colab_presence/10;
				println("Base presence: " + base_presence);
			} else {
				cur_calib_frame += 1;
			}
		}		
	}
	
	public int getPresence(int s) {
		int num = 0;
		int total = 0;
		int presence = 0;
		for(int i=0; i < context.depthHeight(); i+=s) {
			for(int j=0; j < context.depthWidth(); j+=s) {
				int index = i*context.depthWidth() + j;
				if(dmap[index] > 0) {
					num += 1;
					total += dmap[index];
				}
				
			}
		}
		
		if(num > 0) {
			presence = total/num;
		}
		
		return presence;
	}
	
	public int getAdjustedPresence(int s) {
		if(!in_calib && base_presence > 0) {
			int adjusted_presence = base_presence - getPresence(s);		
			return adjusted_presence;
		} else {
			return 0;
		}
	}
	
}
