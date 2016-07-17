---
layout:	post
title:	"Magic Torch: Designing for Mobile Interaction with Augmented Objects"
date:	2012-03-01
tags:	[USYD, ACM, Design Lab, Magic Torch, Interaction Design, Kinect, Research, Academia, Paper, Installation, Projection]
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/QLsyivPv8K4" frameborder="0" allowfullscreen></iframe>

## About

Have you ever been in a bookshop and pulled out your phone to check its online reviews? What about when you're shopping for wine, or admiring a museum piece?

"Designing for Mobile Interaction with Augmented Objects" is a research project that initiated by Dr Martin Tomitsch that involved creating, testing, and evolving interactive prototypes of an augmented reality interface, evaluating a range of user gestures.

The findings were turned into a paper for the proceedings of the 2012 International Symposium on Pervasive Displays. 

![Hand Projection-Activated Proximity](_posts_assets/hand-projection-proximity.png)

## Team & Role

As a Creative Coder, Interaction Designer & Animator, I prototyped different live gestural interfaces throughout the project in addition to the planning and setup of the technological environment for user tests. Meanwhile, Mark C Mitchell iteratively worked on the beautiful visuals. Martin Tomitsch mentored us with his experience in the field, and covered the academic aspects of the project.

![lone book](_posts_assets/lone_book.JPG)

## Process

With the idea of a mobile phone communicating wirelessly with a projection powered by another computer, the first thing done was to build a basic feasibility test. 

After a few trials, this was accomplished with OSC Messages sent from the phone via the Touch OSC app, to the computer where it was parsed via a simple Processing sketch (translating continuous to discrete values), which were then forwarded to a projected Flash Animation - also via OSC. The Computer was also later connected to a Kinect for additional gestures.

	[Phone:TouchOSC] -osc-> [Computer:Kinect+Processing] -osc-> [Flash_Animation]

![visual projected elements](_posts_assets/visual_elements.JPG)

With the viability of the concept ticked off, we moved on to working on the visuals. Mark worked on a few different visual concpets for feedback from us. In iterative cycles, we would animate the visuals, incorporate them into the system, evaluate them, and re-iterate. 

![20111215_0935_buttons](_posts_assets/20111215_0935_buttons.gif)

![DSCF1425_trimmed](_posts_assets/DSCF1425_trimmed.gif)

Multiple forms of mobile interactions were attempted including buttons, sliders, twisting & rotating the phone, and other air-gesture-based interactions. 

![media_proximity_loopable](_posts_assets/media_proximity_loopable 2.gif)

![media_turn_loopable](_posts_assets/media_turn_loopable 2b.gif)

A selection of interactions were chosen for user testing and are published in the following paper.

## Paper

### Abstract

Handheld projectors represent an emerging type of pervasive display that can provide situated, personalised access to digital information. Beyond the projection of content such as photos or websites they can be used to augment physical everyday objects with digital information. This approach has several advantages compared to other augmented reality (AR) technologies. For example handheld projectors eliminate the need to wear head-mounted displays and provide a true integration of the virtual overlay with the physical environment. Yet little is known regarding user interaction with projection-based AR interfaces. The work described in this paper aims to fill this gap through an explorative comparison of four interaction techniques. The techniques were evaluated with two iterations of a projection-based interface that augments physical books with digital information. The interface was prototyped with a fixed projector and a depth-camera sensor to simulate handheld projection. The paper provides a discussion of the techniques along with insights regarding the interface design of projection-based AR interfaces.

[Tomitsch, M., Mitchell, M. C., & Weng, H. (2012). Designing for mobile interaction with augmented objects. _In Proceedings of the 2012 International Symposium on Pervasive Displays - PerDis ’12 (pp. 1–6). New York, New York, USA: ACM Press._](http://dl.acm.org/citation.cfm?id=2307803)

![Book In Orange Glow](_posts_assets/book_orange_glow.JPG)