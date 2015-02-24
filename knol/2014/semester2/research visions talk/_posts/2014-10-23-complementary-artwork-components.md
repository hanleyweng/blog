---
layout:	post
title:	"Complementary Components of Digital Artworks (Presentation)"
date:	2014-09-26
tags:	[art, network, visualisation, Processing, Gephi, animation, presentation]
---

![Creators Project category network image](post_media/12 4.3.b 1k - the Creators Project, Category network.jpg)

At Research Visions 2014, I presented the "Complementary Components of Digital Artworks". These findings were formed from the longitudinal network analysis of 'The Creators Project' and the 'Creative Applications Network'.

## Slides

![Slides overview](post_media/slides collage.png "Slides overview")

Slides [[PDF]](content/final talk/Complementary Components of Digital Artworks.pdf)

## Process

The sites analysed were the creative-tech blogs [Creative Applications Network] and [the Creators Project]. 

Each article of the sites were mined with their title, tags, date, and author. For aquiring the data; kimonolabs was initially used, however, Google Sheets was later found to be more convenient. (UPDATE (2015-02-23): I currently use more system-level methods with curl, python, java which offers more control for mining).

Looking at trends over time, a binning period of 60-90 days at a frequency of 7 days was found to be a good balance between noise and over-smoothing for the data. In addition to 'date', exploration was begun with other low-hanging attributes such as 'author' and 'tags'.

Gephi and its java toolkit were utilised for network analysis. (Gephi has issues with newer versions of Java, and the issue and fix can be found [here](https://github.com/gephi/gephi/issues/748).) Quite a bit of data manipulation when exploring temporal data. It was found the best approach was to create custom GEXF files with spells.

![Creative Applications cover image network](post_media/8 7 6 betweenness of CA network.jpg)

Through temporaly network analysis, trends, important tags (i.e. components of artworks), and clusters were identified. Tags were grouped into 'Component categories', signifying their description-type of an artwork. These categories were: Input, Theme, Tool, Technique, Output, Tangibility, Entity (eg author), Recognition (eg awarded), Event, Blog, Place. The evolving definition of 'component categories' underwent three iterations as understanding of the data grew.

<iframe width="420" height="315" src="https://www.youtube.com/embed/atF4R2yk9W4?rel=0" frameborder="0" allowfullscreen></iframe>

With the artistic landscape represented as a temporal network of varying types of 'artwork components', indepth analysis could be undertaken. For example; shared or distinct themes or subgenres between art and design, the applications and recognition afforded to artworks created with the tool Processing as opposed to OpenFrameworks.

![Processing vs OpenFrameworks](post_media/10 9o - processing vs openFrameworks.jpg)

Overall, the significance of this analysable representation of the artistic landscape can be found in:

- the identification of trends and comparisons between varying components of artworks
- stimulating the initial stages of the creative process
- curation of complementary artworks
- solidifying objective definitions for terminology (which can often be vague in the creative domain)
- revealing the potential for collaboration between distinct fields


[Creative Applications Network]: http://www.creativeapplications.net

[the Creators Project]: http://thecreatorsproject.vice.com/