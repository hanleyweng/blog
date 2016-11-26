---
layout:	post
title:	"Designing Air-Gestures. Designing future interactions, today."
date:	2016-11-01
tags:	[process, air-gestures, deep learning]
---

<style>
	img.small-image {
		max-width: 50px;
	}

	div.side-note {
		background-color: #EEE;
		font-size: 0.8em;
		border-radius: 5px;
		margin: 10px 20px;
		padding: 10px;
	}
	div.side-note p {
		margin: 1em;
	}
	div.side-note img {
		max-width: 300px;
		max-height: 200px;
		margin-bottom: 1em;
	}
	div.side-note p.image-caption {
		margin-top: 0;
		font-style: italic;
		margin: auto;
		max-width: 500px;
	}
</style>

_This post is about designing future interactions for the present day. It uses the design of Air-Gestures as a case study, and touches on a Design Process, Technological Capabilities, and Design Considerations._

<div class="side-note">
	( Throughout this post I have side-notes. You don’t have to read them. They simply let me geek out with as many design & technology buzzwords as I want. 😀 )
</div>

![hands controlling music](_posts_assets/play-forward-optim-1.gif)

## The Why

We live in an age of chatbots, contextual user interfaces, autonomous vehicles, deep learning, and drones. Yet somehow our interaction paradigms are still performed through touchscreens and cursors.

Somehow, we are still glued to our screens. The only interaction paradigm we have for controlling a device without giving it our visual attention 🙈 is voice. Whilst I love voice dictation and assistants, they can be inconsistent, slow, and fail in noisy environments. 

For decades we’ve been fascinated with using hand-gestures, however these have been horrendously unuseable in commercial applications*. Deep Neural Networks have the capability to improve accuracy and recognition to an unrecognisable quality.

<div class="side-note">
	<p>
	* See the horrifying 😱 unreliability of classical template matching in Samsung Smart TVs, or the Kinect which can only sense your hand positions at best - ignorant of the articulations of each finger. No wonder In-Air Gestural interfaces and research was centred around tiring hand movements, gorilla arm, and performing the most simple of commands. (Nicely enough, the Leap Motion uses Machine Learning, though it relies on infrared-sensor-friendly environments.)
	</p>
</div>

Now, hand-gestures actually have the capability to reliably perform power-commands, much faster than using voice. This has strong implications in Virtual Reality, Mixed Reality (like Magic Leap), AR, smartwatches, and television interfaces. So, are you ready for real Minority Report interfaces? *

<div class="side-note">
	<p>
	* Granted, there would be a steeper learning curve, however we can always fall back on replicating a cursor (with better accuracy than predecessors:TVs, Kinect). (Copying via “CMD+C”, versus, “Menu > Edit > Copy”.) And unlike voice-commands, we have a visual interface to support the learning curve of hand-gestures. 
	</p>
</div>

## Design Process

Ok, so we’ve established our beliefs that modernised hand-gestures are going to rock this world. However, without prototypes and deeper research, this new interaction paradigm is just a nice blissful concept. So what do we do? We start building prototypes, researching, and testing with users to inform our design!

This case study was written at a specific stage of the design process. Overall, it is transitioning from the Holistic to Detailed Design Phase. *

<div class="side-note">
	<p>* In design and agile processes, iterative cycles are commonly used like the one below (image via Zdeněk Lanc):</p>

	<img src="_posts_assets/design-cycle.jpg">
	<p class="image-caption">* Speaking of the Users / Testing / Validation phase. A friend of mine made a cool note that this should be the “Disprove” stage. Like the scientific method, you do your best to DISPROVE your hypotheses – if it holds up to rigorous testing, only then are the designs valid.</p>

	<p>These cycles are fine when you’re dealing with comfortable mediums, but can be easily forgotten when dealing with the unknown. When faced with this dilemma, some methods utilise an initial “General Planning / Concept / Feasibility” phase. This is often a illy-defined and non-iterative phase. For this project, A Holistic Phase and Detailed Phase is proposed in place of it.</p>

	<img src="_posts_assets/design-process.jpg">
	<p class="image-caption">* Holistic Design here refers to a consideration of the project, users, and build capabilities. For example, knowing we can have pixels, motion, sound design, haptic feedback. Detailed Design/Build covers what those pixels, animations, clips, and textures actually are.</p>

	<p>* Each project is different. As such, the design process for each project will vary.</p>
</div>

For this project: During the Holistic phase, user research (using flashcards, Wizard of Oz methods) unveiled the types of gestures that are most natural to users, and activation actions that are naturally performed. User research proved adequate demand to greenlight movement to the Detailed Design phase. Technological research and build experiments have revealed quite a few design considerations (detailed below). Build is almost at the stage where live interactive prototypes can be tested with users, greenlighting movement to the Detailed Design Phase. 

![Design Process Position](_posts_assets/design-process-position.jpg)

## Leveraging Technologies

The iPhone 7 series is the target platform for this work.

Why? By targeting a specific phone, our designs are concrete and realistic, not theoretical. By not targeting every platform (phone, OS, etc.) we’re drastically expanding what we can have fun designing for. The belief is that the capabilities of today’s most adept phones will soon become ubiquitous. 

So by targeting the iPhone 7 series, we now know that we can design refined textures using the taptic engine, do 3D sound design, and can leverage incredibly fast processes for Deep Learning and Computer Vision tasks in real-time.*

<div class="side-note">
	<p>* Metal Shaders from iPhone5S, Performance Shaders from iPhone6, Deep Learning Magnitude Improvement in iPhone6S CPU, iOS10 BNNS.</p>
</div>

## Build Feasibility Check

Though there were brief periods of academic and online research. The bulk of the feasibility checking was done by *:

1. Training networks to recognise hands with sufficient accuracy.
2. Ensuring such a neural net could be run on iOS in real time.

<div class="side-note">
	<p>* My prototype dataset involved me doing a bunch of different hand gestures in videos, under different lighting conditions. Handshapes tested were the ASL number signs 0-6, including a base video where no hand was present. </p>

	<p>⚠️ During my first few networks, I was ecstatically getting 99% accuracy. Turned out this was because I didn’t separate my training and validation data-sets came were shuffled from the same time-range of video-frames, rather than being explicitly separate videos 😝. </p>

	<p>MNIST was a great hello-world dataset across platforms. Initially used Digits and Caffe to get a sense of network performance, using default networks (GoogLeNet, AlexNet, LeNet, CIFAR-10-NIN etc.). For iOS, tried using DeepLearningKit, and looked into SwiftAI and Espresso – but in the end, the best way to transfer a net over was by referencing the many iOS10 examples using BNNS and TensorFlow. </p>
</div>

The top accuracy on the dataset was promising (89% – AlexNet). This is on an unedited network, and with a dataset that contains examples a user would not perform in the real world (or can be designed against – more on that below). I believe a proper deep neural network professional can achieve real-word user-interaction accuracy greater than 97%.

![network performance](_posts_assets/training-performance.png)

Keep in mind that this was on a large network, smaller performant networks didn’t fair so well on the iPhone – but these prototypes have left me very confident that more reliable and fast interactions * can be achieved by a senior iOS software developer. 

<div class="side-note">
	<p>* By fast, I mean less than 0.1s response time (and we can use Interaction Design tricks to achieve this for the user, like activation signals and other temporal data). </p>
</div>

## Music Player Mockup

<iframe width="560" height="315" src="https://www.youtube.com/embed/yRhRlkYhs0o?rel=0" frameborder="0" allowfullscreen></iframe>

Hands “2” and “3” for example could be used to quickly “play” and “skip-forward” music - all without needing to look at the screen. 

_(Note: No Actual Design Considerations are noted in this video. More on that below.)_

## Design Considerations

Wooh! Now for the really fun part (imo). Learnings applicable to the detailed phase of interaction and interface design.

From initial prototypes, it seems that it’ll be useful for a user to see themselves (perhaps the UI could be designed more like it’s on a front-facing mirror). Presenting a zoomed view of users, naturally encourages hands to be far enough from the camera (which is important for the system to recognise a hand). 

Unlike voice, there is great opportunity here to surface **visual signifiers** in the interface. (e.g. if a “5” 🖐 hand activates a touchable button on screen like “Play”, then that can be incorporated into the visual element). 

Non-Visual feedback is super important for an interaction paradigm that doesn’t require our visual attention. 

- **Tactile Design** needs to be distinguishable for each user-intent, it also needs to work in conjunction with sound to enforce a user’s mental model. 
- 3D **Sound Design** needs to consider a user’s dimensional model of the interface, working in conjunction with animation. It also needs to be considerate of the orientation of stereo speakers, and if a user is listening via wireless earphones. 
- It’s may also be worthwhile to explore visual and motion designs for peripheral vision.

<img src="_posts_assets/taptic-engine.jpg" alt="taptic engine" style="max-width:150px;">

Additional design considerations needs to be considered regarding usability, and addressing privacy concerns. *

<div class="side-note">
	<p>* Handshapes need to be carefully selected to improve usability (whilst keeping in mind natural interactions and mental models). 
	For example: the "4" hand might get misclassified as a "5" hand, especially when a user's hand is partially obscured.</p>
	<img src="_posts_assets/confusion-matrix.png">

	<p>In addition to usability, camera privacy concerns need to be evaluated. And potential discomforts alleviated through design (e.g. through activation actions, trustworthiness). </p>
</div>

## Overall

We are living in exciting times, no longer limited to mobile interfaces and touchscreens. Old unreliable paradigms like In-Air gestures have become supercharged almost overnight. It’s time to re-assess our designs, our mediums, and our interaction paradigms.

![sci-fi interface](_posts_assets/firefly.jpg)