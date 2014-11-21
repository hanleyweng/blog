---
layout:	post
title:	"Visualizing Temporal Networks (Summary)"
date_begun: 2014-02-01
status: in progress
date:	2014-11-21
tags:	[data visualisation, network, animation]
---

# [DRAFT] Summary

---

# [DRAFT] Design and Implementation of Techniques

This project's intent was to create renders of temporal networks. 

## Overall Process

Overall, the process of this project ran through these rough steps:

- The blueprinting / drafting of animations
- An exploration of technoilogies for the render; looking into Unity, 3D, and other Graph programs before deciding on Gephi and Processing.
- The search for temporal expansive scale-free network data using generative, scraping, and mining methodologies.
- The generation and improvement of a rendering system to visualise such networks.
- The choosing of three core data sets: a custom 10-node case scenario, a biological dataset, and a personal email network.
- The refinement of the rendering system with the chosen data sets.

---

## Data

A visualisation can not be created without data. For our visualisations, a search was undertaken for temporal scale-free network data that were sufficiently large (above 100 nodes). 

Early attempts involved the generation of such a network with the Barabasi-Albert model. However, such artificial generation of a temporal network didn't appear organic enough, as it lacked desired metrics that could be expected from real world networks such as higher k-core values.

Mining for realworld data was undertaken as an alternative to the artificial approach above. The search involved data from conferences, academia, machine learning, cultural brands, Twitter, NSW Australia Statistics, and various movie databases.* In searching for network data that was expansive, temporal, and potentially scale-free. Of the datasets explored, Movie data appeared to fit the criteria best, with IMDB lists being the most flexible. 

In the end, the following three data sets were used:

1. A custom-made 10-node temporal network useful for demonstrating visual effects.
2. A biological dataset from NCBI.*
3. A personal email network. 

---

## Visual Treatment

### Progression

In the early stages of visual development, blueprints and animation drafts were quickly created to convey the type of effects and speed desired. These early drafts were created with animation and video software; Adobe Flash and Adobe After Effects.

[ Media ]

In creating a rendering system that could actually generate a visualisation, a few different software packages were explored. Unity (with C#) was considered when the visualisation was possibly in 3 dimensions, however Unity didn’t result in the smoothest of interactions for networks. In future, interactive 3d alternatives such as Cinder or openFrameworks should be considered. Houdini was also considered - however that would shut the door on the potential for an interactive system. The selected package: the Processing library for Java, was a viable option for 2 dimensional visualisations (though it is capable of 3D), and it worked well with the Gephi Toolkit. 

A variety of network programs were explored before deciding to use Gephi for network calculations. The reason Gephi was selected was due to its relative modernity, documentation, more refined handling of temporal data, its java toolkit, plugins, and its user friendly GUI component.*

As different data sets were introduced, the rendering system added new features and improved on existing ones. 

### Features

Visual features are ammended to the temporal network and its elements. 

Elements can be nodes, edges, or groups of nodes and edges.

The following features are combined under different parametres for different datasets to produce different understandings of the data.

Metrics and Visual Attributes are predominantly node-focused. 

#### Layout

There are many different types of layouts networks could be represented with. Two-dimensional layouts were consistently favoured three-dimensional layouts due to their smaller cognitive footprint. It was the minimisation of cognitive load that also lead to the use of static layouts above dynamic network layouts (layouts where the positions of elements can change over time).

Particular layouts included: Sugiyama, Frutcherman-Reingold, Force Atlas, Yifan Hu, Radial Axis, Circular, Multi-Circular layouts. Layouts were generated using existing graph programs Gephi or VisLab.

The rendering system was embedded with graphical user interface (GUI) elements such as timelines and control toggles to allow for rapid switching between different visualisations of a network. However, even with this functionality, it was found that comparisons were made more easily between visualisations when they were layed out next to one another in the form of collages.

#### Visual Attributes (of elements)

The elements of a network can be imbued with a variety of visual attributes. In the rendering system, nodes often contained the predominant visual attributes, often determining the visual attributes of the remaining elements. Visual attributes include an element's colour, size, halos (or hulls / outlines / ghosts of a single or group of nodes), and additional attributes in the form of nearby text labels or symbols. 

A Node's colour is usually pulled from a colour palette which maps to a particular metric of the node. An edge's colour is a gradient determined by the colours of its nodes.

Halos around a node or group of nodes and edges can vary their visual emphasis depending on the associated metric.

Text labels are often tied to nodes and, when enabled, can have a size relative to that of the node or a constant size. Like the other visual attributes, its use is determined by the network and its purpose. Certain networks where the focus is greater on the structure itself rather than specific content would benefit from no labels. If the analysed metric has only a few top values than the labels at relative sizes can be informative.

Other symbols such as crosses, rings, and arrows can serve to highlight a particular node or represent a node's metric.


#### Metrics (of elements)

- Degree
- Betweenness
- KShell
- Dynamic Modularity / Community <- developed from (static) global modularity
- (All above elements are dynamic.)

- Visual attributes can be mapped to a metric, as well as the amount a metric changes between steps.

#### Mapping

- Visual attributes are mapped to metrics or the change in a metric. One metric can be mapped to more than one visual attribute. Not all metrics are always displayed in one go. The variations of mappings leads to different understandings of the network with varying effectiveness.

#### Timeline

- overall: intertimeline, intratimeline, effects timeline
	- early on noticed discrete fx preffered (1. blueprint) - less cognitive load
- linear warping
	- ...
- propagation
	- hops
		- number of hops (1,4,8)
	- highlights


---

### Rendering System

The rendering system takes in a gexf network file, calculates various network metrics, and offers a range of visual parametres for rendering.

- Data
	- pre-requisite
	- pre-treatment
	- treatment

- Features (where they are in code and how they're implemented)


---








































## [DRAFT] Case Study: Email Network

As a case study of the limitations and benefits of the above technqiues we can look to an email network.

This dataset was my own email network:

- duration: 
- time period: 
- underwent linear warping
- time range: 
- nodes were ...
- edges were ...

Observing and analysing it:

- ...

--- 
