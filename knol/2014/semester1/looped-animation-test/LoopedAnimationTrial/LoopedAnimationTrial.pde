int swidth = 600;
int sheight = 400;

//DartingDotAnimation dart;// = new DartingDotAnimation();
//LoopingAnimation loop;// = new LoopingAnimation(dart,-2,0);
GroupedAnimations groupOfAnims = new GroupedAnimations();


void setup() {
  size(600, 400);
  colorMode(HSB,100);
  // Create multiple anims and add that to groupOfAnims
  int numDarts = 50;
  DartingDotAnimation dart;
  LoopingAnimation loop;
  for (int i=0; i<numDarts; i++) {
    dart = new DartingDotAnimation();
    // set a random offset
    int randomSpeed = 0;
    while(randomSpeed == 0) {
      randomSpeed = (int)random(-5,1);
    }
    loop = new LoopingAnimation(dart, randomSpeed, random(0.0,1.0));
    groupOfAnims.addAnimation(loop);
  }
  
}
void draw() {
//  background(0);
  pushStyle();
    fill(0,20);
    rect(0,0,swidth,sheight);
    noStroke();
  popStyle();
  stroke(50);
  float pct;
  pct = mouseX*1.0f/swidth;
  pct = frameCount % 30.0f / 30;
  groupOfAnims.drawSceneAtPct(pct);
  
  int frameNumber = (int)(frameCount % 30.0f);
  saveFrame("gen/animation-"+frameNumber+".jpg");
}

class Animation {
  Animation() {
  }
  void drawSceneAtPct(float pct) {
  }
}

class GroupedAnimations extends Animation {
  ArrayList<Animation> animations;
  GroupedAnimations() {
    animations = new ArrayList<Animation>();
  }
//  GroupedAnimations(ArrayList<Animation> _animations) {
//    animations = _animations.copy(); //~
//  }
  void addAnimation(Animation animation) {
    animations.add(animation);
  }
  
  void drawSceneAtPct(float pct) {
    for (Animation anim : animations) {
      anim.drawSceneAtPct(pct);
    }
  }
}

class LoopingAnimation extends Animation {
  // This assumes an animation that already loops from pct; 0.0 to 1.0 to 0.0
  // Animation - the animation to loop
  // speedMultiplier - 1,2,3,.. determines how much faster the animation goes, 0 shows a static animation, -1,-2,-3 determine how much the animation is slowed by (1/1,1/2,1/3), show multiple animations // i know, technically -negative should go in reverse
  // offset - the position of the starting position of the animation from 0.0 to 1.0
 Animation animation;
 int speedMultiplier;
 float offset;
  
  LoopingAnimation(Animation _animation, int _speedMultiplier, float _offset) {
    animation = _animation;
    speedMultiplier = _speedMultiplier;
    offset = _offset;
  }
  
  void drawSceneAtPct(float pct) {
    // speed up the animation
    if (speedMultiplier >= 0) {
      animation.drawSceneAtPct( (pct*speedMultiplier+offset)%1.0 );
    }
    // slow down and multiply the animation
    if (speedMultiplier < 0) {
      //e.g 3
      int numAnimations = -speedMultiplier;
      float pctIncrement = -1.0f/speedMultiplier;
      for (int i=0; i<numAnimations; i++) {
        animation.drawSceneAtPct( (pct/numAnimations + pctIncrement*i + offset)%1.0 );
      }
    }
  }
  
}

class DartingDotAnimation extends Animation {
  int randomy;
  DartingDotAnimation() {
    randomy = (int)random(sheight);
  }
  void drawSceneAtPct(float pct) {
    float r = 10;
    ellipse(swidth*pct, randomy, r, r);
  }
} 

