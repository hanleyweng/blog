---
layout: post
title:  "Kinect Dance - Render Test"
date:   2015-05-12
tags: [Kinect, Dance, Processing, Cinema4D, C4D]
---

Inspired by videos of dancers rendered as abstract shapes, such as in the video [Asphyxia](https://vimeo.com/121436114), I decided to explore my own rendering of the human body with the aide of a Kinect and Cinema4D.

[Moullinex's own process](http://www.creativeapplications.net/processing/moullinex-catalina-processing-kinect/) in their music video was a tremendous help. 

After a while of navigating interesting glitches ...

![wip kinect c4d render](media/Screen Shot 2015-04-26 at 2.34.08 pm.png)

We have something!

<video autoplay controls loop mute>
  <source src="media/hand_grab_render.mp4" type="video/mp4">
</video>


The process went something like: using Processing with OpenKinect to record depth data to a sequence of text files. These files were then fed to Cinema4D, and processed by Moullinex's python script (with some minor adjustments), and then rendered. 

Overall quite fun to play with and great to see the final result. However, it would've been nice to have faster visual feedback throughout the process (though I guess that comes from experience with C4d, or alternatively other more real-time focused techniques & software).
