import wblut.hemesh.modifiers.*;
import wblut.geom.frame.*;
import wblut.hemesh.composite.*;
import wblut.core.processing.*;
import wblut.hemesh.tools.*;
import wblut.hemesh.simplifiers.*;
import wblut.hemesh.subdividors.*;
import wblut.geom.nurbs.*;
import wblut.core.random.*;
import wblut.geom.triangulate.*;
import wblut.hemesh.creators.*;
import wblut.geom.tree.*;
import wblut.hemesh.core.*;
import wblut.geom.grid.*;
import wblut.core.structures.*;
import wblut.core.math.*;
import wblut.geom.core.*;

HE_DynamicMesh dynMesh;
WB_Render render;
HEM_Lattice lattice;

void setup() {
  size(800, 800, P3D);
  //HE_Mesh cube=new HE_Mesh(new HEC_Cube().setEdge(600));  
  //HE_Mesh cube=new HE_Mesh(new HEC_Cube(200,2,3,2));  
  HEC_Sphere s = new HEC_Sphere();
  s.setRadius(200);
  s.setVFacets(12);//default 6
  s.setUFacets(2);//default 12
  HE_Mesh sphered=new HE_Mesh(s);  
  //a dynamic mesh is called with the base mesh as argument
  dynMesh = new HE_DynamicMesh(sphered);

  //subdividors can be added implicitely, to be applied more than once it should be added again
  dynMesh.add(new HES_CatmullClark());

  //modifiers can be added implicitely
  dynMesh.add(new HEM_Extrude().setDistance(0).setChamfer(0.05)); //0.5));
  //However adding implicitely is not useful as the parameters can no longer be changed.
  //It is better to apply fixed modifiers to the base mesh before passing it through to
  //the HE_DynamicMesh. This way their overhead is avoided each update().

  //Modifiers or subdividors that are to be dynamic should be called explicitely.
  lattice=new HEM_Lattice().setWidth(10).setDepth(5);
  dynMesh.add(lattice);
  //All modifiers and subdividors are applied on a call to update()
  dynMesh.update();
  
  colorMode(HSB,100);

  render=new WB_Render(this);
}

void draw() {
  background(0,0,100);
  lights();
  translate(400, 400);
  rotateX(0.5f);
  rotateY(0.5f);
  float d=-80.0+mouseY*160.0/height;
  float w=1.0+mouseX*60.0/width;
  lattice.setWidth(w).setDepth(d);
  dynMesh.update();
  noSmooth();
  noStroke();
  
  int h = 20;
  
  fill(h,100,100);
  render.drawFaces(dynMesh);

  smooth();
  stroke(0);
  render.drawEdges(dynMesh);
}

