---
layout:	post
title:	"DataVis – Exploring DeviantArt (Summary)"
start-date:	2012-01-01
end-date:	2012-07-01
date:	2012-07-01
tags:	[UCSD, University of California San Diego, ICAM130, Lev Manovich, Data Visualization, Visualisation, Mondrian, Boids, Data, DeviantArt]
---

_ICAM130 Data Visualization Series: This is a series of visualizations created during related courses and independent research at UCSD._

_Exploring DeviantArt Series: A series of visualisations exploring art, an expression of human creative skill and imagination in varying mediums, through the lens of the online deviantArt community._

---

<style>
	.cta {
		-moz-box-shadow:inset 0px -3px 7px 0px #29bbff;
		-webkit-box-shadow:inset 0px -3px 7px 0px #29bbff;
		box-shadow:inset 0px -3px 7px 0px #29bbff;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #2dabf9), color-stop(1, #0688fa));
		background:-moz-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
		background:-webkit-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
		background:-o-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
		background:-ms-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
		background:linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#2dabf9', endColorstr='#0688fa',GradientType=0);
		background-color:#2dabf9;
		-moz-border-radius:3px;
		-webkit-border-radius:3px;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;
		padding:9px 23px;
		text-decoration:none;
		text-shadow:0px 1px 0px #263666;
	}
	.cta:hover {
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0688fa), color-stop(1, #2dabf9));
		background:-moz-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
		background:-webkit-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
		background:-o-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
		background:-ms-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
		background:linear-gradient(to bottom, #0688fa 5%, #2dabf9 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0688fa', endColorstr='#2dabf9',GradientType=0);
		background-color:#0688fa;
	}
	.cta:active {
		position:relative;
		top:1px;
	}
	.cta:visited {
		color:#ffffff;
	}


	img.small, iframe.small {
		max-width: 200px;
		display: inline-block;
		margin: 20px;
	}

	img, iframe {
		-webkit-box-shadow: 0px 2px 16px 2px rgba(179,179,179,1);
		-moz-box-shadow: 0px 2px 16px 2px rgba(179,179,179,1);
		box-shadow: 0px 2px 16px 2px rgba(179,179,179,1);
	}

	img.default-style {
		max-height: 300px;
		max-width: 100%;
		margin: auto;
		display: block;
	}
</style>

# Exploring DeviantArt

![icam cover image](Ω_overall/icam_cover_image.png){: .default-style}

## Summary

Art is a vast and ever-intriguing phenomenon. There are many ways to explore artistic creations and the communities surrounding the endevour. As a collective, it can be visualised with time, as constellations of clusters, as abstracted agents, and via human-defined categories. This project is an attempt to gleam some insight from artistic works when considered within the creative community that is DeviantArt. 

![da collage](Ω_overall/DataVis-DA-Collage.png){: .default-style}

## By Country and Time

One of the DeviantArt explorations involved looking at when different countries posted artworks. Early explorations were quite abstract. Gradually it moved onto something more functional and informative.

In order of process:

![01](2_hw1_horizontalvis/0a hw1v1 treemap and country-by-hour/3 draft visualisations/0 exploring country-upload-by-hour/screenshots/cropped/1.png){: .small}
![02](2_hw1_horizontalvis/0a hw1v1 treemap and country-by-hour/3 draft visualisations/0 exploring country-upload-by-hour/screenshots/cropped/2.png){: .small}
![03](2_hw1_horizontalvis/0a hw1v1 treemap and country-by-hour/3 draft visualisations/0 exploring country-upload-by-hour/screenshots/cropped/3.png){: .small}
![v1 country](2_hw1_horizontalvis/0a hw1v1 treemap and country-by-hour/4_final/da - Country (by Longitude) vs UploadHour.png){: .small}
![v2 country](2_hw1_horizontalvis/3a country_by_hour/2 v2/weng.hw1.vis1.v2.png){: .small}
<!-- ![v3 country](2_hw1_horizontalvis/3a country_by_hour/5 v3 final/weng.hw1.vis1.v3.jpg) -->

## Abstract Agents

A few trials were made at more abstract representations of the data. Whilst interesting, they were paused in favour of being more easily lead by the constraints offered by slightly more functional visualisations.

![cone trail](1_agent_exploration/cone_trail/figure11.10 paths.full.png){: .small}

<iframe width="420" height="315" src="https://www.youtube.com/embed/CFi97Wujayo" frameborder="0" allowfullscreen></iframe>{: .small}

<iframe width="420" height="315" src="https://www.youtube.com/embed/jxXk4cY7j1k" frameborder="0" allowfullscreen></iframe>{: .small}

## Artwork Clusters

DeviantArt Artworks were also clustered by visual characteristics. The full report can be read [here](/knol/university/2012/ucsd/quarter2_spring/icam130_data_visualization/creation/2_deviantart_project/3_final_imageplot/3%20report/2%20final_wengeco_documentation_/DataVis-Clustering-dA-Clustering-Artworks-Report.html){: .cta}.

![digital](media/duplicates/plot_digital.png)
![traditional](media/duplicates/plot_traditional.png)

## Artwork Categories

DeviantArt Categories also proved very interesting, especially along the axis of gender ratio and their evolution over time. The full report can be read [here](/knol/university/2012/ucsd/quarter2_spring/icam130_data_visualization/creation/2_deviantart_project/2_hw1_horizontalvis/4%20documentation/icam130_da_category_writeup/DataVis-Exploring-dA-Categories-Report.html){: .cta}.

![overall](media/duplicates/cat_overall.jpg)

![traditional](media/duplicates/cat_traditional.png){: .small}
![lit](media/duplicates/cat_lit.png){: .small}
![digital](media/duplicates/cat_digital.png){: .small}

## Conclusions

The wealth of insights that can be mined from human and cultural collections such as DeviantArt are invaluable - allowing us to identify and weave stories about the society they represent. 

In addition to DeviantArt data, it has also been great to simultaneously explore other visual datasets such as Marvel Comics and the Cooper Hewitt Museum data. 

This work was presented at the 'Best of ICAM'. [[PDF Slides]](Ω_overall/BestOfIcam Presentation Image Sequence LOW.pdf)

I've learnt so much from this time in Data Visualisation. It truly is a beautiful union between the technical side of data mining and processsing, and the synthesis of information into comprehensive and aesthetic visualisations. Visualisation is one of the rare few fields that offer a perfect union between the technical, cognitive, and aesthetic. 

<!-- Future work: It would be lovely to do some timelapses showing the progression of each work - for future projects.  -->

### Thanks

Many thanks to Lev Manovich, Jay Chow, Bradley Schnell, and Teenah Eco - whom have been invaluable mentors and amazing collaborators. 

