---
layout:	post
title:	"Data Visualization of Temporal Networks (Progress Documentation)"
date:	2014-02-01
tags:	[data visualisation, network, animation]
---

![network cover image](-post_content/cover_image.jpg "network cover image")

## About

Beginning in 2014, I took up a research project to visualise temporal networks.

This is a detailed archival post on the processes undertaken during the project.

Supervised by Seokhee Hong, at the School of Information Technologies, University of Sydney.

---

Note: Videos on youtube can be adjusted to up to 2x their normal speed which may be appropriate for some of the screen recordings here to overcome the lag within them. Most videos are simple links, the more significant videos will be embedded in this post.

---

## 0. Early tests.

3rd February, 2014

Observing how a program like Gephi represents temporal networks. Datasets tested was a basic Java Repo that's part of Gephi's collection and Gephi's own Dynamic Network generator. 

With Gephi's Dynamic Network Generator, it usually follows the pattern of generating new nodes and edges, changing the edge weights, then removing themselves.

It also seems that when saving Gephi files - it is better to export them as GEXFs rather than save the .gephi file itself.

Video "DNA Java Tryoud d" shows toggling dissuading hubs in the forceAtlas2 layout of gephi can provide an interesting breathing effect which can help distinguish graph elements (nodes and edges).

[[Videos: 0 Early Tryouts of temporal graphs]](https://www.youtube.com/watch?v=o2wc_7phtOM&list=PLFdSJeh0yOslVnj2Vr-ZGjCAqbgJlyZbW)

---

## 1. First Blueprint

9th February, 2014

The following blueprint was created as an early draft of how network events could be represented with animated effects. Created in Adobe Flash.

<iframe width="420" height="315" src="//www.youtube.com/embed/1ktsYmSXhKA?rel=0" frameborder="0" allowfullscreen></iframe>

[[Source: FLA]](1 blueprint/0 blueprint alpha/NetworkAnim-alpha.fla)

A slower version was then requested, resulting in a less elastic, but more 'step-by-step' animation. [[Youtube Video]](http://youtu.be/NKG2LLSlDE0)

[[Source: FLA]](1 blueprint/1 blueprint slower/NetworkAnim-alpha-2-slowedDown.fla)

---

## 3. Draft K-Core Animation

14th February 2014

Next an animation was created with a 'halo' representing a node's kshell (its maximum kcore value). KCore represents a node's resilience within a network. For more information on KCore see [wiki here](http://en.wikipedia.org/wiki/Degeneracy_(graph_theory)).

<iframe width="560" height="315" src="//www.youtube.com/embed/bLIb4cQ4YSM?rel=0" frameborder="0" allowfullscreen></iframe>

The darker the halo, the higher the kshell.
The colors of the individual nodes here represent their statically computed discrete modularity class.

Data Source: This was done using the java network from earlier (0). 

Process:

- Using Gephi, Nodes were filtered at kshell 2, 3, and 4 (the maximum in this network). The higher the kshell, the darker and smaller the node was represented as. 
- Each layer, including a base layer (kshell 0, colorful nodes) was played in Gephi and screen recorded.
- Using Adobe After effects; these layers were overlayed on top of one another. Color Key was used to make each layer transparent, and tinting was used to ensure the nodes (and their outlines) were all one color. The combination of color key and Tinting produced a nice glow effect around each layer.

---

## 4. Marvel Events Network

18th February 2014

Digging into some Marvel data, a temporal network of characters and their interactions with other characters was created. [[0 Network File GEXF]](4 marvel transformation files/0 MarvelEventsExport.gexf)

For a better view of the network, the network was layed out with 'Fruchterman-Reingold', colored by modularity, and node-sizes mapped to dynamic degree per year. [[2 Visually Modified GEXF]](4 marvel transformation files/2 MEventsGephiExport_withDynamicDegree.gexf)

<iframe width="420" height="315" src="//www.youtube.com/embed/2zVz9YPm5YI?rel=0" frameborder="0" allowfullscreen></iframe>

---

## 5. Network Visualisation with Unity

20th February 2014

A few explorations were done into visualising the Marvel Events Network with Unity.

- First the z-axis of a node was mapped to its dynamic centrality [[video 5]](https://www.youtube.com/watch?v=9GsG1o2uBTY)
- Next node size was mapped to degree centrality and edge thickness mapped to its weight [[video 6]](https://www.youtube.com/watch?v=fOdkvHYbCq8)
- Lastly smooth transitions were applied [video 7]

<iframe width="420" height="315" src="//www.youtube.com/embed/RpGsnxuak7M?rel=0" frameborder="0" allowfullscreen></iframe>

Unity didn't result in the smoothest of interactions for this network. In future, interactive 3d alternatives such as Cinder or openFrameworks should be considered. Houdini was also considered - however that would shut the door on the potential for an interactive system.

It was later decided that the project would opt for a more 2-dimensional route.

---

## 8. Movie Scripts Exploration

21st February 2014

Continuing the search for different temporal networks, movie scripts from [IMSDB](http://www.imsdb.com) were explored. 

The scripts for Lord of the Rings 1, Wall-E, Star Trek, and Futurama Season 1 were downloaded as html. A short java program was written to transform these scripts into a network of characters talking with one another. 

When visualised, we can see the progression of character interactions throughout a movie such as Star Trek:

- static layout [[2 youtube video]](https://www.youtube.com/watch?v=X9_tOv_mAec)
- dynamic layout: 

<iframe width="420" height="315" src="//www.youtube.com/embed/iP8FMSHJ6fQ?rel=0" frameborder="0" allowfullscreen></iframe>

---

## 9. RSiena Bunt Network Exploration

25th February 2014

Still searching for temporal scale free networks of significant sizes - [RSiena](http://www.stats.ox.ac.uk/~snijders/siena/) looked promising. Notably the student networks such as ['Gerhard van de Bunt students'](http://www.stats.ox.ac.uk/~snijders/siena/vdBunt_data.htm).

Students can be connected by the strength of their relationship to one another - with a certain threshold edge strength producing a nice Scale Free Network. Unfortunately this network didn't prove to be sufficiently large (in terms of number of nodes) for animation.

A video showing a snapshot of the Bunt network filtered at varying edge weights:

<iframe width="560" height="315" src="//www.youtube.com/embed/sVPcaY55lk4?rel=0" frameborder="0" allowfullscreen></iframe>

---

## 10. Unity Outline Experiment

27th February 2014

<iframe width="420" height="315" src="//www.youtube.com/embed/s5YqSAWcY6A?rel=0" frameborder="0" allowfullscreen></iframe>

Just playing a bit more with Unity hoping that different methods could produce a nicer looking network. It seems best to opt for an alternative tool.

---

## 11. Scale Free Network Generator

27th February 2014

Wrote a program to generate a Scale Free Network (SFN).

<iframe width="560" height="315" src="//www.youtube.com/embed/bqQjNg07cBM?list=PLFdSJeh0yOslpp85Q9BKwgbMm6sdxiOeo" frameborder="0" allowfullscreen></iframe>

Unfortunately with this implementation the maximum kcore value is only 2. We're presently interested in networks with higher kcore numbers.

---

---
