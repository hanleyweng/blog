import peasy.*;

PeasyCam cam;

int edgeNumber = 3;
int heightNumber = 8;
int totalLength = 300;
int totalHeight= 200;
float lightSize = 3;
int rootFrame = 0;

void setup() {
  size(1000,800,OPENGL);
  cam = new PeasyCam(this, totalLength);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
  
  smooth();
}
void draw() {
  
  rootFrame++;
  
  background(30);
  
  lights();
  //sphereDetail(8);
  
  pushMatrix();
  
  //initial positioning
  float cx = totalLength/2;
  float cy = totalHeight*0.5f;//*0.5f;///2;
  translate(-cx,-cy,-cx);
  
  boolean lightOn = true;
  
  int lightId = 0;
  for (int x=0; x<edgeNumber; x++) {
    for (int z=0; z<edgeNumber; z++) {
      
      // draw lights
      for (int y=0; y<heightNumber; y++) {
        
        lightId++;
        /*
        if (lightId==rootFrame%(edgeNumber*edgeNumber*heightNumber)) {
          lightOn = true;
        } else {
          lightOn = false;
        }
        */
        
        if (lightOn) {
          fill(100,100,255);
        } else { fill(50); }
        
        noStroke();
        
        pushMatrix();
        float rx = map(x,0,edgeNumber-1,0,totalLength);//x*totalLength*1.0f/edgeNumber;
        float ry = map(y,0,heightNumber-1,0,totalHeight);//y*totalHeight*1.0f/heightNumber;
        float rz = map(z,0,edgeNumber-1,0,totalLength);//z*totalLength*1.0f/edgeNumber;
        translate(rx,ry,rz);
        //box(lightSize);
        sphere(lightSize);
        popMatrix();
        
        if (y==0) {
          // draw vines
          float cury = 0;
          float ty = totalHeight;
          stroke(125,30);
          strokeWeight(1);
          line(rx,cury,rz,rx,ty,rz);
        }
      }
    }
  }
  
  popMatrix();
  
  // Interaction (reset camera with spacebar
  if (keyPressed) {
     if (key == ' ') {
        cam = new PeasyCam(this, totalLength);
     } 
  }
}

