//sin curve

size(640,480);
float slant=-500;
float y=0;
float x=0;
background(255);
stroke(0);
strokeWeight(10);
float finalheight=random(1,10);
float g=random(255);
float b=random(255);

for (x=slant; x<width; x++) {
  stroke((sin(x/100)+1)/2*255);
  line(x,0,x-slant,height);
}
for (y=0; y<height+width/2; y++) {
  stroke(y*255/(height+width/2),g,b);
  point (y,sin(y/20)*(y/finalheight)+height/2);
}


 
