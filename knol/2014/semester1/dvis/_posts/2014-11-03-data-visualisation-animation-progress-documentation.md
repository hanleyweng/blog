---
layout:	post
title:	"Data Visualization of Temporal Networks - Progress Documentation "
date:	2014-02-01
tags:	[data visualisation, network, animation]
---

![network cover image](post_content/cover_image.jpg "network cover image")

## About

Beginning in 2014, I took up a research project to visualise temporal networks.

This is a detailed archival post on the processes undertaken during the project.

Supervised by Seokhee Hong, at the School of Information Technologies, University of Sydney.

---

Note: Videos on youtube can be adjusted to up to 2x their normal speed which may be appropriate for some of the screen recordings here to overcome the lag within them. Most videos are simple links, the more significant videos will be embedded in this post.

---

## 0. Early tests.

Observing how a program like Gephi represents temporal networks. Datasets tested was a basic Java Repo that's part of Gephi's collection and Gephi's own Dynamic Network generator. 

With Gephi's Dynamic Network Generator, it usually follows the pattern of generating new nodes and edges, changing the edge weights, then removing themselves.

It also seems that when saving Gephi files - it is better to export them as GEXFs rather than save the .gephi file itself.

Video "DNA Java Tryoud d" shows toggling dissuading hubs in the forceAtlas2 layout of gephi can provide an interesting breathing effect which can help distinguish graph elements (nodes and edges).

[[Videos: 0 Early Tryouts of temporal graphs]](https://www.youtube.com/watch?v=o2wc_7phtOM&list=PLFdSJeh0yOslVnj2Vr-ZGjCAqbgJlyZbW)

---

## 1. First Blueprint

The following blueprint was created as an early draft of how network events could be represented with animated effects.

<video controls>
  <source src="1 blueprint/0 blueprint alpha/NetworkAnim-alpha.mov" type="video/mp4">
  Your browser does not support the video tag.
</video>

[[Source: FLA]](1 blueprint/0 blueprint alpha/NetworkAnim-alpha.fla)

A slower version was then requested, resulting in a less elastic, but more 'step-by-step' animation.

<video controls>
  <source src="1 blueprint/1 blueprint slower/NetworkAnim-alpha-2-slowedDown (Converted).mov" type="video/mp4">
  Your browser does not support the video tag.
</video>

[[Source: FLA]](1 blueprint/1 blueprint slower/NetworkAnim-alpha-2-slowedDown.fla)

---

...

