---
layout:	post
title:	"Intel Torch UI"
start-date: 2013-08-26
end-date: 2013-09-25
date:	2013-09-25
tags:	[Intel, Challenge, Magic Torch, Pico-Projector, Projector, UI]
collaborators:	[Self]
---

'Magic Torch UI' is an entry into the Intel Perceptual Computing Challenge that contextualises information into the real world using projection and camera technology.

"The Intel® Perceptual Computing Challenge is a contest to create innovative applications using natural human interfaces such as gestures, voice, and facial tracking."

![Screenshot](submission/screenshot.png)

## The Idea

The application 'Intel Magic Torch UI' utilises pico-projection in conjunction with perceptual computing technologies to provide a user with a projected interface which is determined by context and controlled by gestural interactions. Akin to a user shining a magical torch onto objects, that reveals different interact-able aspects of it.  It is an extension of the idea represented in the supporting links, augmenting the gestural recognition provided by a mobile device (and hence the range of design applications) with stable or moving cameras in the environment.

The application is an extension of the following paper [[Designing for mobile interaction with augmented objects]](http://dl.acm.org/citation.cfm?id=2307803) , [[Video]](https://www.youtube.com/watch?v=QLsyivPv8K4).

Though the framework established by the application can be extended to multiple use cases, from cultural experiences, to gaming and productivity. It will currently focus on the specific scenario of immersive experiences, as found in scenarios such as interactive museum exhibits or art installations that can educate kids on Australia’s Endangered Animals.

## Outcome

A projected interface was created with automatic keystoning and panning correction. This allows a user to browse the interface holding a projector like a magic wand. 

<iframe width="560" height="315" src="//www.youtube.com/embed/mivZyRZyk7s" frameborder="0" allowfullscreen></iframe>

As noted below, there is much room for growth and improvement with the progression of projection and vision hardware.

## Reflection

During development, the Intel SDK was only available on Windows and the primary OS for development was on Mac. Therefore, quite a bit of time was wasted switching between the two operating systems. In future projects, projects that require multiple development requirements should be much more carefully evaluated before undertaking.

A decent amount of time was dedicated to creating the video. However, not enough time was allocated for creating a contextual interface - conceptual or otherwise. This project could've benefited from an even greater focus on presentation rather than development.

---

### Running the Program

For archival purposes, the program and instructions are attached here.

This application was designed to work in conjunction with a pico projector, though one is not required to view it in action.

With PicoProjector:

- place the Intel Gesture Camera directly above the pico-projector's bulb.

Dependencies:

- The Processing IDE is required.
- Intel's PCSDK Processing Library is required.
- Available memory in Processing should be increased to at least 512m in Processing's preferences.

To run the application:

- Open the .pde (processing) file.
- Select 'Run'.
- Point the Intel Gesture Camera at a blank surface.
- You can navigate by adjusting the angle you're pointing at.

[[Program (Zip)]](submission/1 Intel_MagicTorch PDE.zip)