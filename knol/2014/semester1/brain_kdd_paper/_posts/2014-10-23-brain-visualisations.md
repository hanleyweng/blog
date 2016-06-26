---
layout:	post
title:	"Brain Co-activation Network Visualisations"
date:	2014-08-03
tags:	[brain, coactivation, network, kdd, Processing, animation]
---

![decreasing max-edge-weight-threshold - kshell, betweenness - triptic](media/4 _abc brainCoactivation-∂maximumEdgeWeight-Triptic.gif)

I recently had the chance to play with and visualise some brain coactivation network data.

This was for the paper: [Resilience of human brain functional coactivation networks under thresholding](http://arxiv.org/abs/1407.1549) by S. Sarkar, S. Chawla, H. Weng

There were many cool looking visualisations, and some insights, formed from the mapping of certain network metrics to the network of coactivating nodes representing the brain.

## Process Snapshots

Tools used included the network visualisation tool – Gephi, and augmenting my own custom Java application for 3D network visualisations. After Effects was used for compiling animations, and Numbers, Sheets, Excel, Python, R, Matlab, Java were utilised in processing data. 

The following are some of the images and animations of the brain coactivation network that were rendered during its investigation. 

_For those interested, I've annotated the content below with [Graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)) / [Network-Theory](https://en.wikipedia.org/wiki/Network_theory) terminology. Most metrics are [Centrality based](https://en.wikipedia.org/wiki/Centrality)._

During the early process of visualising this network, I applied a simple spring-layout algorithm to the network ('Force Atlas'), interestingly enough, the network began to resemble the side view of the cerebelum! Suggesting the topological aspects of the network reflect their physical structure!

![Freeform brain network looks like the physical brain](3 - 1 snapshots - archive/freeformBrainNetworkLooksLikeTheCerebelumSide.png "Freeform brain network looks like the physical brain")

Force Directed Network with increasing Minimum Edge-Weight Threshold:
![Force Directed Network with increasing Minimum Edge-Weight Threshold](media/1 gif (2 Increasing MINIMUM Edge Weight Threshold Exploration).gif)

[![Brain KDD - Connectivity vs Edge Weight Filtering - Stats](media/Brain KDD - Connectivity vs Edge Weight Filtering - Stats.jpg)](Brain KDD - Connectivity vs Edge Weight Filtering - Stats.jpg)

Continuing with explorations in 'increasing Minimum Edge-Weight Threshold', these are its effects on:
Degree Centrality:
![increasing min-edge-weight-threshold - degree](media/BrainKDD 2 3 1 5 networkImage 2 354 degree.gif)
Betweenness Centrality:
![increasing min-edge-weight-threshold - betweenness](media/BrainKDD 2 3 1 6A betweenness.gif)
KShell:
![increasing min-edge-weight-threshold - kshell](media/BrainKDD 2 3 1 6B kshell, cp3.gif)

KShell (node color) and Betweenness Centrality (node size):
![increasing min-edge-weight-threshold - kshell, betweenness - 3d](media/BrainKDD 2 4b 3 brainkdd kshell,betweenness.gif)

Exploring 'decreasing maximum edge-weight threshold' of the co-activiation network:
Triptic from back, top, side view of brain, with KShell (node color) and Betweenness Centrality (size):
![decreasing max-edge-weight-threshold - kshell, betweenness - triptic](media/4 _abc brainCoactivation-∂maximumEdgeWeight-Triptic.gif)

Here mapping Modularity/Community (t3) (node color) and Degree Centrality (node size).
![decreasing max-edge-weight-threshold - modt3, degree](media/8 1 degree,mod.gif)

Additional higher-resolution content can be found on these unlisted youtube playlists:

- [#2 Increasing Miniminum Edge-Weight Threshold](https://www.youtube.com/playlist?list=PLFdSJeh0yOsnwRwbYkfnkEz3E1PNMF5pI)
- [#3 Decreasing Maximum Edge-Weight Threshold](https://www.youtube.com/playlist?list=PLFdSJeh0yOsnrCpjNPLvaHIGrWk4aPOxd)
- [#4b 3D Coordinate Renders](https://www.youtube.com/playlist?list=PLFdSJeh0yOsntsfgEI99nQDQsFb9GCZ-A)
- [#8 Final Collection of Renders](https://www.youtube.com/playlist?list=PLFdSJeh0yOsng6LPtWgusur2IvP7Ep9A6)

---

The paper can be read on [arxiv: Resilience of human brain functional coactivation networks under thresholding](http://arxiv.org/abs/1407.1549).

## Abstract

_Recent studies have demonstrated the existence of community structure and rich club nodes, (i.e., highly interconnected, high degree hub nodes), in human brain functional networks. The cognitive relevance of the detected modules and hubs has also been demonstrated, for both task based and default mode networks, suggesting that the brain self-organizes into patterns of co-activated sets of regions for performing specific tasks or in resting state. In this paper, we report studies on the resilience or robustness of this modular structure: under systematic erosion of connectivity in the network under thresholding, how resilient is the modularity and hub structure? The results show that the network shows show strong resilience properties, with the modularity and hub structure maintaining itself over a large range of connection strengths. Then, at a certain critical threshold that falls very close to 0, the connectivity, the modularity, and hub structure suddenly break down, showing a phase transition like property. Additionally, the spatial and topological organization of erosion of connectivity at all levels was found to be homogenous rather than heterogenous; i.e., no "structural holes" of any significant sizes were found, and no gradual increases in numbers of components were detected. Any loss of connectivity is homogenously spread out across the network. The results suggest that human task-based functional brain networks are very resilient, where the whole network structure fails only when connectivity is almost fully removed from the network. The findings may help further the understanding of dynamics of and relationships between structural and functional brain networks._
