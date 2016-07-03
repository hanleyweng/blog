---
layout:	post
title:	"Golden Fleece - Hectic Games Jam 2014 Winner"
date:	2014-07-23
tags:	[golden fleece, interactive, installation, kinect, makeathon, game jam]
---

_Note: This is mainly a cross-post of my [portfolio piece "Golden Fleece"](http://www.hanleyweng.com/golden-fleece-page/) with a few extra tidbits._

---

<iframe width="560" height="315" src="https://www.youtube.com/embed/d0REWhthmRM" frameborder="0" allowfullscreen></iframe>

## About

Golden Fleece is a Projectile Kinect game created during, and winning, the 48 hour "Hectic Games Jam #2" at St Leonards Tafe (July, 2014).

In the game, armies of vikings are trying to steal your gold and you have to physically throw balls at them to make them go BOOM!

The game was specifically designed to allow for an abstracted form of human interaction beyond precise touch screens and keyboards, in this case, it used a Kinect to only register objects near a projected surface. This allowed for game designs where an unlimited amount of people could come join in on the fun, and for unexpected tactics and collaborations to emerge between players.

![Golden Fleece Cover Image](media/portfolio_images/cover.jpg)

## Team & Role

Our awesome artwork and animations were illustrated by Julian Wilton, whilst Xavier Ho worked on Game Logic and really cool interactive visual touches like explosions. We all crossed paths and helped each other, but it was largely modularised which allowed us individual autonomy and responsibility. I focused primarily on the design, user testing, debugging, and building of the physical interface of throwing projectiles at a wall – crossing over occasionally to assist in Sound Design and Game Logic.

_Beyond the creative jam, 'Golden Fleece' continues to be installed at different locations, something that's made possible only with the aid of amazing people such as: Callum Parker, & Hugo Santos._

## Download

Our [Source Code is on at bitbucket!](https://bitbucket.org/hanleyweng/hecticgamesjam_sketch/)
It requires a Kinect, and a Projector (though it can be configured for a Desktop setup).

<iframe width="560" height="315" src="https://www.youtube.com/embed/KbKw4ySpA5Q" frameborder="0" allowfullscreen></iframe>

## The Making

As part of the 48 hour "Hectic Games Jam #2" at St Leonards Tafe (July, 2014), we created the Kinect game Golden Fleece. Basically, a bunch of vikings are trying to steal your gold and you have to throw balls at them to make them go BOOM!

In preparation for the makeathon, I packed the following:

	- ipad, charger [not used]
	- keyboard [not used]

	- mouse (used somewhat)
	- laptop
	- projector & charger
		(projector controller would've been useful)
	- hdmi adapter [x 2]
	- apple tv and charger
	- kinect and charger
	- tripod
	- lil toy balls [4]
	- blank paper


Early on, we explored creating a more artistic interactive installation. We ended up adopting the novel input paradigm of 'ball chucking' provided by the Kinect.

Some preliminary tests were done with Unity and Kinect via services like ZigFu - however most of these proved to be immature implementations, and Unity proved difficult in working with raw depth data. So we moved on to Processing - had to refresh (i.e. Google) my Vector and 3D Maths - but the bespokeness of the interaction design was well worth it.

![Kinect Setup](media/portfolio_images/setup-kinect.png)

![setup projectiles](media/portfolio_images/setup-projectiles.png)

Our three person team worked really well with one kickass artist and two developers. At the very beginning, with the artist on preliminary static assets, the two devs worked on distinct tasks; one on setting up the software environment (game setup, assets), the other, on the hardware environment (kinect) and physical setup.

In terms of workflow, we were largely able to work in parallel on distinct portions of the project which really helped. We also coincidently ended up taking 'shifts', which minimised the time when all of us were asleep simultaneously (I'm not sure how exactly this benefited flow, but somehow it seemed to nicely help keep the momentum going).

![Julian Sketching](media/portfolio_images/earlySketches.jpg)

We had lots of fun building this, serendipitously finding interesting and unexpected features to leverage along the way.

<iframe width="560" height="315" src="https://www.youtube.com/embed/lCx3A-Rsf8A?autoplay=1&loop=1&playlist=lCx3A-Rsf8A" frameborder="0" allowfullscreen></iframe>

![Trail Image of Explosions](media/extra_images/glitchy-exploding-images.png)

<iframe src="https://vine.co/v/MYAT6TjrQOE/embed/simple" width="300" height="300" frameborder="0"></iframe><script src="https://platform.vine.co/static/scripts/embed.js"></script>

Things that worked well, and should try keeping in future:

- Synchronous workflow with distinct roles
- Don't have everyone sleep at the same time

Things to try differently in future:

- set up a source control environment early
- perhaps don't try to mix both processing and eclipse dev environments (if so, keep the functions distinctly separate)
- modularise unique functions (e.g. kinect input) to a separate program and use OSC for communication

Though the game is built for Kinect input, we've kept it modularised enough that porting it as a Desktop version is quite easy, and tablet and smartphone versions are possible.

![ball throw image](media/portfolio_images/ball-throw-image.png)

![kinect image](media/portfolio_images/kinect-image.png)

![setup tripod](media/portfolio_images/setup-tripod.png)

It a really fun experience creating the game, play testing with others greatly helped prioritise solutions to buggy experiences, and inspired us with new ideas along the way. 

Overall, it's very enjoyable watching players run, jump, shout, and hectically throw balls at our work. :)

![st leonards](media/portfolio_images/st-leonards.png)

![CSIRO](media/portfolio_images/xav-melb-csiro-golden-fleece.jpg)

![sentient 1](media/portfolio_images/sentient-1.jpg)

![sentient 2](media/portfolio_images/sentient-2.png)

![wilkinson](media/portfolio_images/wilkinson.jpg)

![arch gallery](media/portfolio_images/arch-gallery.png)

