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

A graphs' elements have a variety of metrics: these include measures of centrality (indicators that identify a nodes' importance) and structure.

The system computes the centrality measures; Degree and Betweenness. In terms of structural metrics, we also compute KShell and Dynamic Modularity (also known as communities or clusters). 

KShell is computed as the maximum level of k-degenerate graph a node belongs too. *

Modularity was initially visualised as a global (hence static) metric. To calculate dynamic modularity, static modularity was computed via the Gephi Toolkit for every time window of the network. Matching, similar, and dissimilar modules were then computed with Jarcadian distances between neighboring timewindows, represented as evolving vectors, normalized as angles, which were mapped as colors. *

All of the above metrics are dynamic throughout the temporal network. These metrics, as well as the rate of change of these metrics, are selected for mapping to the visual attributes of the rendered network.

#### Mapping

Visual attributes are mapped to metrics or the change in a metric. For example; a visualisation may map nodes' colors to the rate of change in Betweenness Centrality, whilst mapping their size to KShell. One metric can be mapped to more than one visual attribute. Not all metrics are always displayed in one go. The variations of mappings leads to different understandings of the network with varying effectiveness.

#### Timeline

Temporal networks consist of dynamic nodes and edges. These dynamic elements can be introduced and removed from the network at any point in time. The addition and deletion of these elements effect the metrics of other elements within the network. Temporal networks can be viewed as a series of static snapshots (timewindows) of the network. These snapshots are not representations of the network at a singular point intime, but rather a certain time window from one point in time to another. This is similar to photography where an (often very short) exposure time is required to capture a sufficient amount of information. 

[ external reference image ]

The sequence of snapshots (or timewindows) taken of these networks have a start point, end point, and a duration (which is the time from end to start point). There is a duration gap between each snapshot, often of a consistent duration - this means that snapshots may or may not overlap with one another. The chosen duration of, and duration between, each snapshots is dependent on the chosen data and purpose of visualisation.

The rendering system deals with four types of nested timelines. From parent to child, these are the: inter-snapshot, intra-snapshot, propagation timeline.

The inter-snapshot timeline is the overall timeline of the entire network from beginning to end. It consists of all snapshots taken of the network. The duration between each snapshot is often kept constant, however, temporal networks with sparse events can have their data compressed so there are no snapshots in which no element has changed. This warping of the timeline is done by looking at each unique timestamp of the network's elements and remapping it into sequential integers (e.g. 1,2,3,...), playback would then occur at 0.5 increments (e.g. 1.0, 1.5, 2.0, ...) with a duration of 1.0 .

The intra-snapshot timeline exists between two adjacent snapshots and determines what visuals occurs as one snapshot transitions to the next. This timeline is often set with a 10-20% buffer period at both ends of the timeline, giving users time to observe a static view of the snapshot before any animations occur. Discint bugger periods could be set for nodes and edges, however, it appeared that the animation was easier to comprehend when both were set to the same periods. A few visual effects can be tied to this timeline; such as the fading in and out of rings around nodes that denote a change in metric value, or the fading in and out of edge halos that represent their addition or deletion. Most effects however are more appropriately applied to the propagation timeline.

Changes in metrics can propagate throughout a network, beginning with the addition or deletion of an element. The ordering of elements in this propagation can be represented as the number of hops they are from the change. For example, consider the propagation of the betweenness centrality metric if an edge is added between two significant clusters of nodes, the edge and its adjacent nodes would be the first to be updated, having a hop-level and order of 0, the unclassified nodes adjacent to these would be next, having a hop-level and order of 1 from the event, and so on. Elements that undergo minimal change do not carry on the process. 

This propagation of change in the network can be visually represented through the use of animated thick edges that gradually extend from the point of change to other elements affected by the initial structural change in the network.

The propagation timeline denotes the order in which nodes and their edges are animated through their changes between snapshots. This order often follows the propagation order of events, however, other orderings have been used. An alternative ordering is elements being ordered depending on their layout, with top elements ordered first - this is especially useful with the Sugiyama layout where parent nodes are placed higher up, resulting in an animation that suggests a parent-to-child significance in metric changes. There can also be no ordering at all, where all elements are animated simultaneously. The number of distinct orders in this timeline can also be used to denote the duration of the parent timeline; the intra-snapshot timeline - meaning events with more changes can be observed longer. The rendering system can also artificially cap the maximum number of orders rendered independently, choosing to collate the remaining orders together. With the datasets explored, it appears that 50% of the maximum distinct order is a good cap - allowing for the representation of propagation, and cutting out many sparse propagations as it is rare for propagations to reach their maximum. 

Within the propagation timeline, core visual transitions occur such as the change in a node's color and sizes. Significant elements may be additionally highlighted with symbols to emphasize them or certain metrics they possess.

Similar to its parent, the propagation timeline also utilises a small buffer period between animating different orders of elements. 

The timing of visual effects, whether within the intra-snapshot timeline or the propagation timeline, appeared to incur less cognitive load when they are slower and discrete from one another. 

---

### Rendering System

The rendering system is a workflow to create renders of temporal networks. It consists of three stages: data manipulation, metric calculation, and visual rendering.

Data is manipulated and cleaned into a temporal network in the form of a GEXF file. Data is often cleaned and transformed into this format using spreadsheets or custom programs to parse and rearrange the data. Any labelling of the data is also done at this stage along with the generation of different visual layouts for the network represented as different files. Likewise, any global (static) metrics are calculated at this stage. The optional warping of a networks timeline to reduce non-events between snapshots is also done during this stage. 

Dynamic metrics are then calculated upon a single gexf network file. This is done using the Gephi Java Toolkit 0.8.5. Once snapshot duration, gap, and overall timeframe are chosen, metrics are calculated for each snapshot. Centrality metrics such as Degree and Betweenness can be directly calculated using the toolkit. KShell is calculated as the maximum K-Core value of a node via the toolkit. Dynamic Modularity is custom calculated with the help of the toolkit's static modularity calculation. These dynamic metrics are then compressed and written to a new version of the gexf network file.

The program responsible for visually rendering the gexf network file is written in java, with the aid of the Processing framework and the Gephi Toolkit. It offers a range of visual parameters for rendering the network. Snapshot durations must be set to match that used for the calculation of dynamic metrics. 

The program features:

- the ability to quickly switch between:
	- what metrics map to which visual attributes | if mapping absolute or relative metric
	- the display and style of text labels
	- toggling the display of highlights:
		- node rings
		- change in value : change in value method of display (relative, absolute)
		- crosses
		- thick transition lines
	- toggling color palette (which is quite significant given the data and metric for color mapping)

- GUI:
	- zooming
	- panning
	- timeline browsing
	- //could be an interactive system

To allow for browsing and fine-tuning of the network and program, GUI functions were added including zooming, panning, and browsing of the timeline.

The program outputs the temporal network as a series of images. These are then compiled with After Effects, and can accompany other series of images to offer an animated collage comparing different renders of networks.


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
