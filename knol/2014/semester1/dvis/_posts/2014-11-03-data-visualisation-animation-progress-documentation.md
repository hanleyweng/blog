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

All datasets seen here are available.

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

<iframe width="560" height="315" src="//www.youtube.com/embed/bqQjNg07cBM?rel=0" frameborder="0" allowfullscreen></iframe>

Unfortunately with this implementation the maximum kcore value is only 2. We're presently interested in networks with higher kcore numbers.

A modified version with higher preferential probability constant was also generated that resulted in higher maximum kcore [[12 video]](https://www.youtube.com/watch?v=RyfisGn8_IE&feature=youtu.be).

---

## 13. Custom rendering of kshell.

29th March 2014

Starting to write a program to visualise temporal networks. 

Data Set: Generated Scale Free Network.

Highlighting the maximum kcore (KShell) with halos (following the earlier prototype (3)). 

<iframe width="420" height="315" src="//www.youtube.com/embed/ugURtFdas7k?rel=0" frameborder="0" allowfullscreen></iframe>

Or color nodes based on kshell.

<iframe width="420" height="315" src="//www.youtube.com/embed/_hGUdnSb9JY?rel=0" frameborder="0" allowfullscreen></iframe>

18. A different version with fading edges was also later generated. [[Youtube Video]](https://www.youtube.com/watch?v=xEleMt859pg)

---

## 16. 911 Network Data

30th March 2014

As part of the search for more network data - 911 network data was also explored. [[Youtube Playlist]](https://www.youtube.com/playlist?list=PLFdSJeh0yOsmqnwU870y06oaD8bZq888-)

[[Pajek: Reuter Terror news network data]](http://vlado.fmf.uni-lj.si/pub/networks/data/CRA/terror.htm)

---

## 17. Immersion Email Data

31st March 2014

Coming across [MIT's Immersion](https://immersion.media.mit.edu) visualisation of email networks, I used it to mine my own email network to visualise.

![Email Network before Filtering](17 immersion data experiment - temporal data compressed incorrectly/Screen Shot 2014-03-31 at 8.45.43 pm.png "Email Network before Filtering")

It required some cleaning, for example, the removal of nodes that were predominantly one way communications (low in-degree) such as mailing lists.

<iframe width="560" height="315" src="//www.youtube.com/embed/OLC23rWu8uw?rel=0" frameborder="0" allowfullscreen></iframe>

---

## 19. Immersion Email Data Visualisation

19th April 2014

Taking a subset of the immersion email data, a series of renders were made that varied the metrics (kshell, betweenness, degree, global modularity) of a node and the visual attributes it mapped too (color, size, outline).

<iframe width="560" height="315" src="//www.youtube.com/embed/L5gLw3uiR2M?list=PLFdSJeh0yOsnlK-oXVuA5GpivU1E48NAL" frameborder="0" allowfullscreen></iframe>

Videos

- A - Color-kcoremax ~.mov
- B - Size-Betweenness, Color-KCoreMax.mov
- C - Color-Betweenness, Size-Degree.mov
- E - Color-globalModularity, Size-kcoremax.mov
- F - Color-kcoremax, Size-degree, Hull-globalModularity.mov
- G0 - Color-kcoremax.mov
- G1 - Color-kcoremax, Size-kcoremax.mov
- G2 - Color-kcoremax, Size-kcoremax, Staging-1Edges2Nodes.mov

Notes:

- B. Tried a different dark themed color palette with this one - actually looks nicer - though potentially not as clear as the rest. 
- G0. G1. Visual comparison of mapping just color to kshell, or both color and size.
- G1. G2. Differences in the Staging of elements was also played with (comparing version G1 and G2).

---

## 20. Movie Datasets Exploration

25th April 2014

### 0. IMDB GD05

Looked into the [IMDB dataset of Graph Drawing 2005](http://www3.ul.ie/gd2005/dataset.html). However this was later discarded as it had been previously analysed.

### 1. 2010s SciFi. 

Science Fiction films from 2010 were gathered from [wikipedia](http://en.wikipedia.org/wiki/List_of_science_fiction_films_of_the_2010s) and transformed into networks.

A bipartite network of actors and movies.

![Actors and Movies - 2010 Science Fiction](20 movie dataset exploration/1 2010s scifi/Screen Shot 2014-04-26 at 11.19.07 pm.png "Actors and Movies - 2010 Science Fiction")

Which could also be transformed into a unipartite network of actors.

![Just Actors - 2010 Science Fiction](20 movie dataset exploration/1 2010s scifi/Screen Shot 2014-04-26 at 11.36.40 pm.png "Just Actors - 2010 Science ")


### 2. American Actors / Movies

2nd May 2014

An additional movie dataset of [american actors were found via freebase](http://graphlab.com/learn/gallery/notebooks/graph_analytics_movies.html). 

![American Actors - Freebase](20 movie dataset exploration/2 american_actors_movie_years - data/2 freebase.jpg "American Actors - Freebase")

<iframe width="560" height="315" src="//www.youtube.com/embed/qxjGX6WG8sc?rel=0" frameborder="0" allowfullscreen></iframe>

### 3. Science Fiction - IMDB

Began exploring [a list of science fiction films on IMDB "Genre: Sci-Fi, 1500 Titles: 1970-2013"](http://www.imdb.com/list/ls051626175/).

[Playlist of process videos.](https://www.youtube.com/playlist?list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy)

#### 3.2 Early look at the first page of data

30th April 2014

[[Youtube Video]](https://www.youtube.com/watch?v=-p4xFohwgnw&feature=youtu.be)

#### 3.3 Looking a bit further (up to item 301 of the list).

2nd May 2014

At this point in time I was also trying out import.io as a web scraping tool. It's a bit clunky, but it is fairly user friendly - taking out any of the coding required in traditional web scrapers.

![import io snapshot](20 movie dataset exploration/3 scifi imdb - tesb b - first page/3 more pages - up to 301 view - made dynamic/3 Screen Shot 2014-05-02 at 6.58.00 pm.png "import io snapshot")

A few video snapshots of the network during this time:

- [static layout](https://www.youtube.com/watch?v=EyJHvj5W1lM&list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy&index=3)
- [static fruchterman layout](https://www.youtube.com/watch?v=-rUoNdjBE_A&list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy&index=4)
- [live force atlas 2 layout](https://www.youtube.com/watch?v=k2c7saU0dsE&list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy&index=5) 

#### 3.4 Adventure & Action exploration

3rd May 2014

Sticking with the SciFi Genre of the IMDB list. Films were then further filtered for Feature Films, ordered by IMDB Rating, and made after 1990. Adventure was initially selected as a sub-genre.

![adventure scifi films](20 movie dataset exploration/3 scifi imdb - tesb b - first page/4 adventure exploration/4 adventure1.jpg "adventure scifi films")

However, the 'Adventure' subcategory in this list proved quite small (only up to 3 pages to potentially pull from, with lower pages being significantly bad ratings), hence the 'Action' subcategory was tried instead.

![action scifi films](20 movie dataset exploration/3 scifi imdb - tesb b - first page/4b static - different data - action123/4b - action123main - 2 .jpg "action scifi films")

A custom layout was built with concentric circles representing the kshell value of a node. The inner the circle, the higher its maximum kcore value.

![action scifi network with concentric kshell circles](20 movie dataset exploration/3 scifi imdb - tesb b - first page/4c - dynamic/4c kcoreConcentric.jpg "action scifi network with concentric kshell circles")

Here is that same layout animated [[Youtube Video]](https://www.youtube.com/watch?v=XXv6wAj04xw&feature=youtu.be).

And a different representation of the network, with a dynamic force atlas layout, accumulating over time. [[Youtube Video]](https://www.youtube.com/watch?v=sZFyOg1mGjM&list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy&index=7)

#### 3.5 Unipartite Network

5th May 2014

A few different methods were attempted to transform this bipartite actor-movie network into a unipartite network. There's even a gephi plugin for doing this, however, that plugin doesn't retain the temporal nature of the edges - hence, more manual methods would have to be considered

![film-film unipartite action scifi network](20 movie dataset exploration/3 scifi imdb - tesb b - first page/5 making bipartite & unipartite/5c snaps.png "film-film unipartite action scifi network")

#### 3.6 Custom Rendering

23rd May 2014

Finally, a version of the bipartite movie network was plugged into the custom rendering program to see what it would look like. Here both size and color of nodes are mapped to its kshell value.

<iframe width="560" height="315" src="//www.youtube.com/embed/LFpPHHZucJU?list=PLFdSJeh0yOslfgBtEdgX4XtRlcYSEkBWy" frameborder="0" allowfullscreen></iframe>

---

## 21. NCBI May Renders

9th June 2014

I had previously received some NCBI network datasets in late April. New ones were received in May. After processing this data into a GEXF format, a few renders were made.

The applied layout was force-directed.

The renders explore the NCBI network with various metrics (betweenness, degree, kshell, static modularity) mapped too the color or size of a node.

Here is the playlist of renders: 

<iframe width="560" height="315" src="//www.youtube.com/embed/tLDrf2Z5Vgo?list=PLFdSJeh0yOsnPJVa-NIZjG0u_T7sf5Dfh" frameborder="0" allowfullscreen></iframe>

Videos

- A betweenness,kshell.mov
- B degree,kshell.mov
- B2 kshell, degree.mov
- C betweenness, degree.mov
- D statmod, kshell.mov
- D2 statmod, kshell, hulls.mov
- E statmod, degree.mov
- F statmod, betweenness.mov
- NCBI render 1 - colorAndSize-kcoreMax - withText - staged.mov

---

## 22. Immersion Spells

11th June 2014

Looking back at the email network and processing it so graph elements are temporal i.e. giving them 'spells'.

<iframe width="560" height="315" src="//www.youtube.com/embed/1pjnhUWUDEw?rel=0" frameborder="0" allowfullscreen></iframe>

17th June 2014

Colored the nodes by KShell and mapped size to degree.
Compared two variations of the animation with different time intervals (10% left, and 100% right). It appears the 10% one on the left appears as if it's more detailed. 

<iframe width="560" height="315" src="//www.youtube.com/embed/Sg99b4UOcKc?list=PLFdSJeh0yOslA8ju-gNpAHi3UG0R5Pin9" frameborder="0" allowfullscreen></iframe>

---

## 23. Exploring Propagation

21st June 2014

As part of this project, an attempt is being made to visualise the propogation of metrics within a network. For example, when an edge is added or deleted - how that effects adjacent nodes, and how those effected nodes in turn effect nodes adjacent to them and so on.

### 23.0 Staging Propagation

A series of initial animations were done to explore these different propagation (or hop levels) within the network under the metrics of, and visualising, kshell, betweenness or both. It should be noted that 'degree' does not propagate as a node's degree is only directly effected by its own edges. 

[Process Playlist of a visual check of Propogation Staging](https://www.youtube.com/playlist?list=PLFdSJeh0yOskwPhyNTwxnWnh61W6J_Tub)

A clearer visualisation of the hops involved in a network. (Here the maximum number of hops visualised was increased from 3 to 5. Betweenness was also the more visually obvious propogating metric compared to kshell.)

<iframe width="420" height="315" src="//www.youtube.com/embed/LNmKLDJSpdU?rel=0" frameborder="0" allowfullscreen></iframe>

### 23.2

A visual comparison was made of how many maximum hops were visualised 1, 2, or 4. Youtube playlist below.

<iframe width="560" height="315" src="//www.youtube.com/embed/BuGrviDT2_M?list=PLFdSJeh0yOsmCILrrEAjHHn1tLWToFZ9t" frameborder="0" allowfullscreen></iframe>

The differences are a bit more obvious when comparing 1 (left) and 2 (right) maximum hops - towards the very end of the video 'prop1 vs prop2'. The latter appears to be faster and more incremental in its changes.

Comparing Prop4 to Prop2 however; Prop2 appears to show more as few propogations reach the prop4 level and since all increments are currently of equal duration, prop4 has larger periods where nothing visually happens as a result.

---

## 23b. Propagation for NCBI dataset

21st June 2014

Exploring propagation on the NCBI dataset.

[[Youtube Playlist]](https://www.youtube.com/playlist?list=PLFdSJeh0yOsl60sqXkvwoEzfFYgwXcEl7)

Comparing maximum visualised propagations at 1, 4, and 8.

<iframe width="560" height="315" src="//www.youtube.com/embed/uQSX-NB0rNk?list=PLFdSJeh0yOsl60sqXkvwoEzfFYgwXcEl7" frameborder="0" allowfullscreen></iframe>

---

## 24. NCBI Renders

21st June 2014

Having agreed that a propagation level of 4 looked decent, a few additional renders of the NCBI bio network were created of it exploring different mappings and metrics.

Video playlist below:

<iframe width="560" height="315" src="//www.youtube.com/embed/oEzHJVxVwV0?list=PLFdSJeh0yOsk7EoOFzYLCUop_JeVfAsc5" frameborder="0" allowfullscreen></iframe>

Videos:

- combo (a montage of videos within the playlist)
- 0 singleVar - general
- 1 singleVar - degree
- 2 singleVar - betweenness
- 3 singleVar - kshell
- 4 singleVar - staticModularity
- 5 degree, betweenness
- 6 mod, betweenness
- 7 mod, kshell
- 8 mod, degree
- 9 kshell, degree
- 10 kshell, betweenness

---

## 25. Twitter Dataset Exploration

4th July 2014

As a brief detour - a quick program was written to mine for some basic twitter data such as the most recent 100, or most popular tweets that involved #tech .

![twitter subnet](25 twitter dataset exploration - quicki/1 twitter tech popular using max-id/6 staticGexf - removedCommonWords.png "twitter subnet")

A few hundred nodes certainly wasn't enough to form a connected network of words. However, the skeleton of the network program is now written and available for future use.

--- 

## 27. Rendering Dynamic Untracked Modularity

6th July 2014

Gephi is currently being used to compute the metric modularity. However, it can't do dynamic modularity - for that, often custom applications or algorithms are built. There are two predominant methods when calculating dynamic modularity: either consider the network one timestep at a time, computing static modularity that accumulates into dynamic modularity, or consider the whole longitudinal network during the computation. The latter method is more refined but takes longer to accomplish. Since dynamic modularity isn't a high priority in this project, the easier method (using slices of static modularity) is preffered. 

Here is an animation of the email network with 'hulls' (outlines around groups of nodes) showing the changing modularity of the network.

<iframe width="420" height="315" src="//www.youtube.com/embed/DAKFk6eytfM?rel=0" frameborder="0" allowfullscreen></iframe>

---

