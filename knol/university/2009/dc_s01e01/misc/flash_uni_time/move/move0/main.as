﻿package {	import flash.display.Sprite;	import flash.display.Shape;	import flash.display.Graphics;	import flash.events.Event;	public class main extends Sprite {		//private vars		private var swidth=stage.stageWidth;		private var sheight=stage.stageHeight;		private var minSwidthSheight=Math.min(swidth,sheight);		private var maxSwidthSheight=Math.max(swidth,sheight);		//		private var xvel=0;		private var yvel=0;		private var xvelmax=10;		private var yvelmax=10;		private var xacc=1;		private var yacc=1;		private var xdec=0.9;		private var ydec=0.9;		private var numTrails=20;		private var ballTrailAirX=-3;		private var ballTrailAirY=0;		private var numBlocks=10;		private var ballBlocksRadMin=10;		private var ballBlocksRadMax=50;		private var ballBlocksVelMin=2;		private var ballBlocksVelMax=10;		//public vars		public var k:keys;		//		public var ball:Shape = new Shape;		public var ballTrails:Array=new Array;		public var ballBlocks:Array=new Array;		//inital function		public function main() {			stage.addEventListener(Event.ENTER_FRAME,on_enter_frame);			var keyboard_sprite = new Sprite();			addChild(keyboard_sprite);			k=new keys(keyboard_sprite);			//			//ballBlocks			for (var h:int=0; h<numBlocks; h++) {				var b:Shape = new Shape;				ballBlocks.push(b);				iDrawCircle(ballBlocks[h].graphics,1,0x6633CC,1,0x9933FF,0.7,0,0,10);				addChild(ballBlocks[h]);				ballBlocks[h].y=Math.random()*sheight;				var randomRadius=(Math.random()*(ballBlocksRadMax-ballBlocksRadMin)+ballBlocksRadMin);				ballBlocks[h].width=randomRadius*2;				ballBlocks[h].height=randomRadius*2;			}			//ballTrails			for (var i:int=0; i<numTrails; i++) {				var s:Shape=new Shape;				ballTrails.push(s);				//iDrawCircle(ballTrails[i].graphics,1,0x000000,0,0x0033FF,1,0,0,10);				iDrawCircle(ballTrails[i].graphics,1,0x000000,0,0xFFCC00,1,0,0,10);				addChild(ballTrails[i]);				var ballTrailIdPercentage=(numTrails-i)/numTrails;				ballTrails[i].alpha= ballTrailIdPercentage*0.9+0.1				ballTrails[i].height= ballTrailIdPercentage*18+2				ballTrails[i].width= ballTrailIdPercentage*18+2			}			//ball			iDrawCircle(ball.graphics,3,0xFF9900,1,0xFFCC00,0.8,0,0,10);			addChild(ball);			ball.x=swidth/2;			ball.y=sheight/2;		}		//Every Frame Function		public function on_enter_frame(event:Event) {			//Moving Ball Blocks			moveBallBlocks();			//Producing Trail			produceTrail();			//accelerating (keyboard)			var xvelfut=xvel+k.lor()*xacc;			var yvelfut=yvel+k.dou()*yacc;			if (Math.abs(xvelfut)<=xvelmax) {				xvel=xvelfut;			}			if (Math.abs(yvelfut)<=yvelmax) {				yvel=yvelfut;			}			//decelerating (standby)			/*if (k.lor()==0) {				xvel*=xdec;			}			if (k.dou()==0) {				yvel*=ydec;			}*/			xvel*=(1-xdec)*Math.abs(k.lor())+xdec;			yvel*=(1-ydec)*Math.abs(k.dou())+ydec;			//Displaying Movement			ball.x+=xvel;			ball.y-=yvel;			keepOnStage(ball);		}		private function moveBallBlocks() {			for (var i:int=0; i<numBlocks; i++) {				ballBlocks[i].x-=((ballBlocksRadMax-ballBlocks[i].width/2)/ballBlocksRadMax)*(ballBlocksVelMax-ballBlocksVelMin)+ballBlocksVelMin;				keepOnStage4ballBlocks(ballBlocks[i]);			}		}		private function keepOnStage4ballBlocks(mc) {			var radius=mc.width/2;			if (mc.x<(-radius)) {				mc.x=swidth+radius;				mc.y=Math.random()*sheight;				var randomRadius=(Math.random()*(ballBlocksRadMax-ballBlocksRadMin)+ballBlocksRadMin);				mc.height=randomRadius*2;				mc.width=randomRadius*2;			}		}		private function produceTrail() {			ballTrails[0].x=ball.x			ballTrails[0].y=ball.y			for (var i:int=(numTrails-1); i>0; i--) {				ballTrails[i].x=ballTrails[i-1].x+ballTrailAirX*i/numTrails;				ballTrails[i].y=ballTrails[i-1].y+ballTrailAirY*i/numTrails;			}		}		//////////////////////////////////////////////////////////////////////////////////////////		//Own Functions://////////////////////////////////////////////////////////////////////////		//////////////////////////////////////////////////////////////////////////////////////////		//animation functions		private function keepOnStage(mc) {			if (mc.x>swidth) {				mc.x=0;			}			if (mc.x<0) {				mc.x=swidth;			}			if (mc.y>sheight) {				mc.y=0;			}			if (mc.y<0) {				mc.y=sheight;			}		}		//Drawing Functions		private function iDrawCircle(target:Graphics, lineWeight:int, lineColor:int, lineAlpha:int, fillColor:int, fillAlpha, cx:int, cy:int, cr:int) {			target.lineStyle(lineWeight, lineColor, lineAlpha);			target.beginFill(fillColor,fillAlpha);			target.drawCircle(cx,cy,cr);//these are the co-ordinates INSIDE the shape, best not be moved.		}		//Calculation Functions		private function reflectionAngle(ox,oy,radius,angleInc,hitMc) {			//radius MUST be ≥ than VELOCITY			var angle=0;			var returnAngle;			var angleAlpha;			var angleBeta;			var firstAngle:Boolean=false;			var secondAngle:Boolean=false;			var curPosnHit:Boolean;			var prevPosnHit:Boolean;			for (var i:int=0; i<1; i++) {				if (angle==0) {					if (hitMc.hitTestPoint(orbitPosition(-1,ox,oy,radius,angle),orbitPosition(1,ox,oy,radius,angle),true)) {						curPosnHit=true;					} else {						curPosnHit=false;					}					prevPosnHit=curPosnHit;					trace("angle==0 has passed");				}				if (hitMc.hitTestPoint(orbitPosition(-1,ox,oy,radius,angle),orbitPosition(1,ox,oy,radius,angle),true)) {					curPosnHit=true;				} else {					curPosnHit=false;				}				if (!(curPosnHit==prevPosnHit)) {					if (curPosnHit==true) {						if (firstAngle==false) {							angleAlpha=angle;							firstAngle=true;							//returnAngle=angle;						}					}					if (curPosnHit==false) {						if (firstAngle==true) {							angleBeta=angle;							secondAngle=true;							//returnAngle=angle;						}					}					trace("alpha: "+firstAngle+" beta: "+secondAngle+" angle: "+angle);					prevPosnHit=curPosnHit;				}				angle+=angleInc;				//Returning Values				if (secondAngle==false) {					i--;				} else {					returnAngle=Math.PI+(angleAlpha+angleBeta)/2;					//for more accuracy and minimizing glitches:					//reduce radius until only one hitWall exists.					//increase angleInc					//smooth out 'hidden' hitTestingWall					return returnAngle;				}				//Precautionary Return				if (angle>(Math.PI*2*5)) {					return false;				}			}		}		private function halveIntervalSafePt(safeptx,safepty,hitptx,hitpty,minimalDistance,hitMc,plane) {			//safeptx,safepty MUST be correct, MUST be a safept, perform check beforehand before undertaking this funtion			var midptx;			var midpty;			while (minimalDistance<dist(safeptx,safepty,hitptx,hitpty)) {				midptx=(safeptx+hitptx)/2;				midpty=(safepty+hitpty)/2;				if (hitMc.hitTestPoint(midptx,midpty,true)) {					hitptx=midptx;					hitpty=midpty;				} else {					safeptx=midptx;					safepty=midpty;				}			}			if (plane==-1) {				return safeptx;			}			if (plane==1) {				return safepty;			}		}		private function dist(x1,y1,x2,y2) {			var distance=Math.sqrt(Math.pow(x2-x1,2)+Math.pow(y2-y1,2));			if (x2<x1) {				distance*=-1;			}			if (y2<y1) {				distance*=-1;			}			return distance;		}		private function orbitPosition(xiy,ox,oy,orbitRadius,angle) {			if (xiy==-1) {				var xposition=orbitRadius*Math.cos(angle)+ox;				return xposition;			}			if (xiy==1) {				var yposition=orbitRadius*Math.sin(angle)+oy;				return yposition;			}		}		private function calculateAngle(ox,oy,ix,iy) {			var angle = Math.atan((iy-oy)/(ix-ox));			if (ix<ox) {				angle=Math.PI+angle;			}			return angle;		}		private function calculateAnglePI(ox,oy,ix,iy) {			var angle=calculateAngle(ox,oy,ix,iy);			while (angle<=(-Math.PI)) {				angle+=2*Math.PI;			}			while (angle>(Math.PI)) {				angle-=2*Math.PI;			}			return angle;		}		private function calculateAngle2PI(ox,oy,ix,iy) {			var angle=calculateAngle(ox,oy,ix,iy);			while (angle<=0) {				angle+=2*Math.PI;			}			while (angle>(Math.PI*2)) {				angle-=2*Math.PI;			}			return angle;		}		private function calculateAngle180(ox,oy,ix,iy) {			var angle=calculateAnglePI(ox,oy,ix,iy);			var degree = angle*360/(Math.PI*2);			return degree;		}		private function calculateAngle360(ox,oy,ix,iy) {			var angle=calculateAngle2PI(ox,oy,ix,iy);			var degree = angle*360/(Math.PI*2);			return degree;		}		private function constrainTo180(degree) {			while (degree<=-180) {				degree+=360;			}			while (degree>180) {				degree-=360;			}			return degree;		}	}}