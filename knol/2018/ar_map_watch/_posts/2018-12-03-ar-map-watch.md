---
layout: post
title:  "AR Maps with Apple Watch control"
date:   2018-12-02
tags: [Augmented Reality, AR, Apple Watch, Stereo, Merge VR, Interaction Design, Prototype, POC]
---

Been thinking about how to browse and edit maps in Augmented Reality. Since I just got an Apple Watch, thought I'd start by testing out the Apple Watch as a controller for headworn AR using an iPhone.

![animated gif of a circular map in augmented reality](media/ar-map-giphy.gif)

Swiping and dragging on the Apple Watch controls the panning of the map. Scrolling the Haptic Crown controls zoom. (The haptic crown is a joy to feel.)

The latency is surprisingly good between the Apple Watch and iPhone. Roughly 50-100 milliseconds, whilst noticeable, is easily smoothed out with basic lerping.

In an earlier version, I had the points of interest (POIs) much significantly elevated above the map with a line connecting them. Whilst this looked cool, it was less useful, so POIs were brought towards the ground.

The Apple Watch also seems to be able to send motion data (accelerometer, gyroscope) at high rates. However, swiping felt more comfortable when it was attached to the wrist (different if holding the watch like a joystick 🕹).

<iframe width="769" height="433" src="https://www.youtube.com/embed/Ui2wxBJ04CA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>