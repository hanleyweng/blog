---
layout: post
title:  "Vivid 2015 - Monster World (Art Installation, Process)"
date:   2015-05-01
tags: [Vivid, Sydney, Monster World, Interactive, Art, Installation]
---

![Monster World Monsters](post_media/images/static_image.jpg)

Monster World is a portal into another realm, an alternate dimension inhabited by a curious collection of creatures. As people approach the installation, the monsters curiously follow their movements, occasionally mimicking their gestures in surprising and delightful ways. If participants wave or dance, the monsters may decide to wave back or do a dance of their own! When more people approach, new monsters appear from the colourful ether, bringing about a charming party of moving and dancing forms. 
This interactive art installation was part of the [Vivid Sydney Light Festival](http://www.vividsydney.com/) 2015 where art, technology and commerce intersect.

![Crowd Waving](post_media/images/crowd_waving.jpg)

## Team

Core Team: David Collien, Emila Yang, Mark C Mitchell, Hanley Weng

_Special Thanks to: Emma Chee (Animation), Melody Wang (Animation), Blake Hourigan (Sound design), Ingrid Lenert (Animation), Jenna Fox (Camera calibration and 3D printing)._
_Also Thanks to our Sponsors: USYD Design Lab, Project Station for their advice and manufacturing of the theatre, and Hitachi for offering advice and two of their ultra-short throw projectors._

_Role: This work was unique in that there was no single role where most of my time went, instead my time was spread across different gaps, from logistics, animation, design, to code._

Blake Hourigan created some great atmospheric audio compositions for the installation such as [Dusk](post_media/audio/Dusk.mp3), [Woodlands 2](post_media/audio/Woodlands-Two.mp3).

![Twirling person](post_media/images/person_twirl.gif)

## Process

![Mockup Proposal Image](post_media/images/Mockup_Blue_version.jpg)

Starting off, was the Vivid Application process where we conceptualised multiple ideas and submitted one with the idea of a window into another world, inhabited by spirits that could also see into our reality. 

_Disclaimer: Usually we'd do a lot of prototypes and iterations, this particular project had a few time constraints though – so we instead chose to refine the execution of the idea with polish whilst doing core user and technical tests throughout._

A few artworks were moodboarded, from which Emila later created mock ups.

![Moodboard](post_media/images/moodboard.png)

We decided on Unity early on (C#), an engine that we believed would make prototyping and collaboration easier in this setup than Processing or OpenFrameworks. Various Unity tests were conducted first, including lighting and atmospherics.

![Unity Scene WIP](post_media/images/unity_purple.png)

Unity's Animation State Machines became quite helpful. Especially as we investigated 2D and 3D methods for animating creatures.

In the 3D realm, we tested out motion-capture data, 3d rigged models, as well as creating finger puppets controlled by a Leap Motion.

![Leap Motion Finger Puppet Rig](post_media/images/finger-puppet - snippet - gif.gif)

In consideration of time constraints, we went with 2D creature assets and animation. This worked well for enlisting others whom kindly offered to help out with our animations: Emma Chee, Ingrid Lenert, & Melody Wang.

![Creatures Move Fog Test](post_media/images/constant-bg-fg-transition-visual-test 2.gif)

Many international emails were sent researching and sourcing projection materials that would be perfect for the outdoors environment of our installation, as well as our budget. In addition to this, we sourced two ultra short throw projectors from Hitachi, rented hardware (tools, computers), and worked with ProjectStation on the design and build of the weatherproof cubby-like house to host our installation.

![Technical Drawing](post_media/images/TechnicalDrawings_v03_p1.jpg)
[(Technical Drawings PDF (4 pages))](post_media/TechnicalDrawings_v03.pdf)

We initially considered using Kinects for the installation, but opted to build our own system with rgb cameras, infrared cameras, infrared lights, python & opencv - as we thought it'd be more exciting. David Collien oversaw this task and the [code can be found on github](https://github.com/dcollien/EyeSocket).

![cvis](post_media/images/cvis.png)

We conducted user and technical tests of the build throughout.

![Projected Archway](post_media/images/projected_archway.jpg)

To get the software presenting its best across the two ultra-short-throw projectors on a not-completely-flat surface, we utilised Syphon, Quartz, MadMapper, as well as some OSX Terminal Commands and Plist editing. Such methods had to work across macOS' as old as Snow Leopard to cover our bases for the hardware we could source.

![Structure Inside](post_media/images/inside_structure.jpg)

The software had to be wrapped in a way that could be easily switched on/off by the Vivid Light festival volunteers. We covered the 'off' part, by creating timed scripts to turn the projectors and computer off near midnight. With scripts and timers, all that had to be done was the single press of an 'on' button whilst the festival ran. 

![Kids Playing](post_media/images/kids_jumping.gif)

Many people were involed in this project, and my thanks goes out to everyone that helped us through. In the end, it was nice to see the final installation and kids of all ages (from 3 to 83+) having fun with the artwork.

![Goodbye](post_media/images/goodbye.jpg)

