PImage tex, tex2;
PVector camPos;
ArrayList<Plinth> plinths;
Plinth p;


PVector room;
void setup() {
  size(899, 600, P3D); 
  background(0);
  noStroke();

  tex = loadImage("1.png");
  tex2 = loadImage("2.png");

  textureMode(NORMAL);
  
  camPos = new PVector(width/2, height*2, 180);
  room = new PVector(300, 300, 300);  
  plinths = new ArrayList<Plinth>();
  plinths.add(new Plinth(new PVector(-40, 0, 0), new PVector(40, 40, 110), 45));
  plinths.add(new Plinth(new PVector(40,0,0), new PVector(40, 40, 110), 45));
  plinths.add(new Plinth(new PVector(100,60,0), new PVector(40, 40, 110), 45));
  plinths.add(new Plinth(new PVector(-100,60,0), new PVector(40, 40, 110), 45));

}

void draw() {
  tex = mapping();
  //tex2 = new PImage();
  background(0);
  directionalLight(126, 126, 126, 1, 0, 0);
  directionalLight(126, 126, 126, -1, 0, 0);

  ambientLight(125, 125, 125);  
  
  /*
   pushMatrix();//ground rectangle
   translate(width/2,height/2);
   rotateX(radians(180));
   rectMode(CENTER);
   translate(0,0,10);
   rect(0, 0, width, height);
   popMatrix();
   */

  camera(map(camPos.x, 0, width, width/2-(room.x/2), width/2+(room.x/2)), map(camPos.y, 0, height, height/2-(room.y/2), height/2+(room.y/2)), camPos.z, width/2, height/2, 100, 0.0, 0.0, -0.1);

  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2, 0);
  camPos.x = mouseX;
  //translate(0, -height/2+(mouseY*2), 0);
  fill(255);
  rect(0, 0, room.x, room.y);
  for (Plinth a: plinths) {
    pushMatrix();
    translate(0, 0, a.dim.z);
    a.display();
    popMatrix();
  }
  popMatrix();

  camera();
  floorPlan(room.x/6, room.y/6, room.x/3, room.y/3);
}

void floorPlan(float x, float y, float w, float h) {

  fill(20, 0, 100);
  rect(x, y, w, h); 
  rectMode(CENTER);
  fill(255);
  translate(0, 0, 1);

  for (Plinth a: plinths) { //draw plinths
    pushMatrix();
    translate(map(a.pos.x, 0, room.x, x, x+w), map(a.pos.y, 0, room.y, y, y+h));
    rotateZ(radians(a.r)); //arbitrary bounds, "width" and "height" mean nothing in 3d space.
    rect(0, 0, map(a.dim.x, 0, room.x, 0, w), map(a.dim.y, 0, room.y, 0, h));   
    popMatrix();
  }

  fill(200, 0, 0);
  translate(-w/2, -h/2);
  rect(map(camPos.x, 0, width, x, x+w), map(camPos.y, 0, height, y, y+h), map(50, 0, room.x, 0, w), map(50, 0, room.y, 0, h));
}

