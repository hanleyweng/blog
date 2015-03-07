---
layout:	post
title:	"DataVis – Exploring DeviantArt Categories (Report)"
start-date:	2012-07-01
end-date:	2012-12-01
date:	2012-12-01
tags:	[UCSD, University of California San Diego, ICAM130, Lev Manovich, Data Visualization, Visualisation, Mondrian, Data, DeviantArt, Processing]
---

_ICAM130 Data Visualization Series: This is a series of visualizations created during related courses and independent research at UCSD._

_Exploring DeviantArt Series: A series of visualisations exploring art, an expression of human creative skill and imagination in varying mediums, through the lens of the online deviantArt community._

---

_This is a report on the findings made from exploring the categories of deviantArt._

<p class="c0 c2"><img height="534" src="images/image06.jpg" width=
	"344"></p>

---

<!-- Override own styling -->
<style type="text/css">
	div.google-report img {
		display: inline;
		max-height: none;
	}
</style>
<!-- Use Google Report Styling -->

<style type="text/css">
	div.google-report ol {
	margin:0;
	padding:0;
	}

	div.google-report .c4 {
	max-width:468pt;
	background-color:#fff;
	padding:72pt;
	}

	div.google-report .c3 {
	font-style:italic;
	}

	div.google-report .c0 {
	direction:ltr;
	}

	div.google-report .c2 {
	text-align:center;
	}

	div.google-report .c6 {
	font-size:8pt;
	}

	div.google-report .c1 {
	height:11pt;
	}

	div.google-report .c5 {
	text-align:right;
	}

	div.google-report .title {
	padding-top:24pt;
	line-height:1.15;
	text-align:left;
	color:#000;
	font-size:36pt;
	font-family:Arial;
	font-weight:700;
	padding-bottom:6pt;
	}

	div.google-report .subtitle {
	padding-top:18pt;
	line-height:1.15;
	text-align:left;
	color:#666;
	font-style:italic;
	font-size:24pt;
	font-family:Georgia;
	padding-bottom:4pt;
	}

	div.google-report li {
	color:#000;
	font-size:11pt;
	font-family:Arial;
	}

	div.google-report p {
	color:#000;
	font-size:11pt;
	font-family:Arial;
	margin:0;
	}

	div.google-report h1 {
	padding-top:24pt;
	line-height:1.15;
	text-align:left;
	color:#000;
	font-size:18pt;
	font-family:Arial;
	font-weight:700;
	padding-bottom:6pt;
	}

	div.google-report h2 {
	padding-top:18pt;
	line-height:1.15;
	text-align:left;
	color:#000;
	font-size:14pt;
	font-family:Arial;
	font-weight:700;
	padding-bottom:4pt;
	}

	div.google-report h3 {
	padding-top:14pt;
	line-height:1.15;
	text-align:left;
	color:#666;
	font-size:12pt;
	font-family:Arial;
	font-weight:700;
	padding-bottom:4pt;
	}

	div.google-report h4 {
	padding-top:12pt;
	line-height:1.15;
	text-align:left;
	color:#666;
	font-style:italic;
	font-size:11pt;
	font-family:Arial;
	padding-bottom:2pt;
	}

	div.google-report h5 {
	padding-top:11pt;
	line-height:1.15;
	text-align:left;
	color:#666;
	font-size:10pt;
	font-family:Arial;
	font-weight:700;
	padding-bottom:2pt;
	}

	div.google-report h6 {
	padding-top:10pt;
	line-height:1.15;
	text-align:left;
	color:#666;
	font-style:italic;
	font-size:10pt;
	font-family:Arial;
	padding-bottom:2pt;
	}
</style>

<div class="google-report">
	<p class="c0 title"><a id="h.uomq0e2u9s5r" name=
	"h.uomq0e2u9s5r"></a><span>EXPLORING DEVIANTART CATEGORIES</span></p>

	<p class="c0 c5"><span class="c6">by Hanley Weng</span></p>

	<h2 class="c0"><a id="h.3qp5xyn8jmnd" name=
	"h.3qp5xyn8jmnd"></a><span>INTRODUCTION</span></h2>

	<p class="c0"><span>Art is the expression of human creative skill and
	imagination. It incorporates many traditional creative practices, such as
	painting, literature, sculpting, and many more recent digital forms from 3d
	artworks to film and pixel art. The web has allowed artists an even greater
	domain to express themselves to a larger audience. Not only that, the web
	connects artists amongst their peers and viewers, and carries with it memes
	and cultural influences that effect, and are affected by,
	artists.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>DeviantArt, or dA as it is known by its online
	community of 19 million artists, was first launched in 2000, and has since
	grown to be the 13th largest social network (as of July 2011). It receives
	over 100,000 daily uploads of original artworks, spanning it&rsquo;s vast
	tree of categories and subcategories (over 1700), from stock art of aquatic
	animals, to silkscreen printing, and comedic films.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>Our core dataset was provided by Lev Manovich&rsquo;s
	Software Studies lab, it consists of a sampling of deviantArt artworks and
	their associated metadata (such as an artist&rsquo;s artwork, date of
	publication, title, etc.).</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>Artworks are organized in a hierarchical tree structure
	of categories, represented in the form: &ldquo;/Stock
	Art/Animals/Aquatic&rdquo;. With this dataset, we can filter, explore, and
	perform algorithms on this multi-layered data in order to generate
	visualisations that can reveal cultural patterns.</span></p>

	<p class="c0 c1"><span></span></p>

	<h2 class="c0"><a id="h.rr3cmwyrz0m8" name=
	"h.rr3cmwyrz0m8"></a><span>PROCESS</span></h2>

	<p class="c0"><span>In the path to a visualisation of the categorical
	structure of deviantArt, many iterations were progressed through. The
	visualisation developed from the exploration of the most suitable
	parameters (age, population, gender, etc.), to the improvement of
	aesthetics, and the discovery of narratives. What follows is a series of
	iterative designs that were undertaken during this process with
	descriptions and critiques.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0 c2"><img height="263" src="images/image02.png" width="38"></p>

	<p class="c0 c2"><span class="c3">Figure 1. An early, nested representation
	of the hierarchical structure of deviantArt traditional sub-categories. The
	ratio of female to male is mapped by hue over the entire colour spectrum,
	whilst age is mapped using brightness. This mapping results in complex
	mental models of the data as two complex keys are overlayed over one
	another. In order to achieve this visualisation, deviantArt data was
	parsed, and individual artworks placed in a generated tree-based data
	structure depending on their stated categories. A nested structure was
	chosen, as the initial attempt at a circular structure revealed that leaf
	nodes were imperceptible at A4 size.</span></p>

	<p class="c0 c2 c1"><span class="c3"></span></p>

	<p class="c0 c2"><img height="328" src="images/image11.png" width=
	"343"></p>

	<p class="c0 c2"><span class="c3">Figure 2. The nested representation
	(figure 1) of the structure was replaced with a clearer, horizontal
	expansion of subcategories. This allowed for a much wider representation of
	all categories of deviantArt. Female to male ratios are now colored as pink
	and blue correspondingly. Though the equal column widths maintains balance
	in the graph, it loses readability as subcategories reach deeper states.
	Also, this graph simply plots categories in an alphabetical manner - a
	sorting that is not reflective of the parameter (male-to-female-ratio)
	being depicted.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="99" src="images/image08.jpg" width=
	"231"><img height="140" src="images/image09.png" width="182"><img height=
	"190" src="images/image16.png" width="105"></p>

	<p class="c0 c2"><span class="c3">Figure 2.a.b.c. Regardless of the issues
	with figure 2, zooming in onto such categories as film (a), resources (b),
	and contests (c ), reveals some overall trends. Film and Resources are the
	polar opposites in terms of the genders of their contributing artists.
	Contests reveals the expansion of subcategories throughout time, and the
	transition from a heavily dominated social network to a more
	female-dominated one.</span></p>

	<p class="c0 c2 c1"><span class="c3"></span></p>

	<p class="c0 c2"><img height="215" src="images/image15.jpg" width="86"></p>

	<p class="c0 c2"><span class="c3">Figure 3. An exploratory visualisation of
	logarithmic population over a hue spectrum.</span></p>

	<p class="c0 c2 c1"><span class="c3"></span></p>

	<p class="c0 c2"><img height="178" src="images/image04.jpg" width=
	"242"></p>

	<p class="c0 c2"><span class="c3">Figure 4. A comparison of literature and
	digital art categories across the parametres of gender (left) and age
	(right). In comparing different parameters such as gender, age, and
	population (depicted in figure 3), it is found that gender tends to tell
	the most interesting stories, hold the greatest variance and outliers, in
	this visualisation of categories. Hence, gender is chosen as the core
	parameter for subsequent categorical visualisations.</span></p>

	<p class="c0 c2 c1"><span class="c3"></span></p>

	<p class="c0 c2"><img height="515" src="images/image12.jpg" width=
	"399"></p>

	<p class="c0 c2"><span class="c3">Figure 5. In an attempt to better
	visualise the categories of deviantArt, they were split into their
	top-level categories in this visualisation. A bar-chart is formed by
	grouping top-categories of similar female-to-male ratio and stacking them
	next to one another. This visualisation however requires an uncomfortable
	amount of zooming to grasp it.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="487" src="images/image03.jpg" width=
	"283"></p>

	<p class="c0 c2"><span class="c3">Figure 6. Following minimalistic
	inspiration from visualisation designers such as Nicholas Felton and Lev
	Manovich&rsquo;s primer on visual design, a gridded structure was
	undertaken to compare two specific categories with the goal of formulating
	a comparative narrative. In this graphic however, there are some
	conflicting colour schemes, and unclear and irrelevant information (e.g.
	average age across both categories have insignificant differences). Most
	importantly, the graphic holding the most potential information is
	diminished to the bottom of the visualisation.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="223" src="images/image01.jpg" width=
	"401"></p>

	<p class="c0 c2"><span class="c3"><br>
	Figure 7. A more aesthetically finalised visualisation depicting the
	difference in subcategories between film and cartoons. Categories are
	colored by the female-male-ratio indicated to the left of the graph. The
	location of these two categories in the entire deviantArt tree is indicated
	on the left key. Column charts are used to represent the rate of uploads to
	each category, followed by observed notes, and icons of the most popular
	artworks within these categories throughout time.</span></p>

	<p class="c0 c2 c1"><span class="c3"></span></p>

	<p class="c0"><span>Throughout this design process, much inspiration was
	taken from other artists and teachings. Small algorithmic improvements were
	also made to improve the visual accuracy of the information. Throughout the
	process, the concept of narrative was developed as small findings were
	noticed throughout the visualisations.</span></p>

	<h2 class="c0"><a id="h.w8vyldzachzo" name=
	"h.w8vyldzachzo"></a><span>DEVIANTART CATEGORIES</span></h2>

	<p class="c0 c1"><span></span></p>

	<p class="c0 c2"><img height="534" src="images/image06.jpg" width=
	"344"></p>

	<p class="c0 c2"><span class="c3">Figure 8. A visual representation of the
	hierarchical structure of the categories of deviantArt. Children categories
	are horizontally nested to the left of their parent categories. Each
	category is colour-coded to their female-to-male ratio of uploaders (more
	pink symbolises a heavily female dominated category and vice versa, as
	indicated by the vertical key on the left of the visualisation). Children
	categories are sorted from highest female-ratio to the least.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="254" src="images/image00.png" width=
	"163"><img height="254" src="images/image14.png" width="165"><img height=
	"254" src="images/image05.png" width="163"></p>

	<p class="c0 c2"><span class="c3">Figure 9. a. b. c. Visualisations were
	generated of certain subcategories; a. Digital Art, b. Traditional Art, c.
	Literature. These categories were chosen as they reveal much information in
	their comparison. Similar to their parent; Figure 8, a female-to-male-ratio
	key is indicated to the left. Figure 8 is also added, with the zoomed area
	outlined, followed by the visualisation of the category (and subsequent
	categories) itself. To the right, there are observed notes of the graphic.
	This is followed to the bottom by a histogram of monthly uploads, and then
	by an aesthetic icon representation of the most popular artworks of the
	categories.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>The finalised visualisations of deviantArt categories
	are depicted and described above in figures 8 and 9. Specific categories
	were chosen for extended visualisation as they told interesting
	narratives.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>To name a few findings; figure 9a &amp; 9b reveal a
	male dominance in vehicle, abstract, surreal and science-fiction works. A
	higher female dominance is also observed in drawings than in paintings.
	Though the high female dominance in mixed media, drawings, paintings and
	sculpture is expected in Traditional Art (figure 9b) game art has a
	surprisingly large number of female contributors. The non-visual medium of
	literature, depicted in figure 9c, can also reveal interesting information,
	such as the observation that under romantic fictional prose, tawdry and
	erotic works hold a male-majority, whilst under romantic poetry, tawdry and
	erotic works have the highest female ratios.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>These zoomable visualisations can be explored -
	facilitating the discovery of trends and patterns across different types of
	artworks and categories.</span></p>

	<p class="c0 c1"><span></span></p>

	<h2 class="c0"><a id="h.4c13xftslq52" name=
	"h.4c13xftslq52"></a><span>FUTURE WORK &amp; CONCLUSIONS</span></h2>

	<p class="c0"><span>Though a visualisation of the categorical structure of
	deviantArt allows us to understand this complex network a fair bit better,
	it addresses only a fraction of the potential of this data. There are many
	different ways of exploring many different subsets and aggregations of such
	data.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0 c2"><img height="204" src="images/image07.jpg" width=
	"244"></p>

	<p class="c0 c2"><span class="c3">Figure 10. A visualisation of the
	DeviantArt uploads by the global hour (GMT 0) from the countries with most
	deviantArt artists.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="137" src="images/image13.png" width=
	"206"></p>

	<p class="c0 c2"><span class="c3">Figure 11. A visualisation of the paths
	of the ten most heavy deviantArt uploaders. The progression of a point
	along an artist&rsquo;s path is dependent on the difference in their
	artworks.<br>
	- done in collaboration with Bradley Schnell.</span></p>

	<p class="c0 c2 c1"><span></span></p>

	<p class="c0 c2"><img height="199" src="images/image10.png" width=
	"407"></p>

	<p class="c0 c2"><span class="c3">Figure 12. An image plot of traditional
	artworks, clustered predominantly by their top-level categories, followed
	by various image-features such as entropy.<br>
	- done in collaboration with Teenah Eco.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>From geolocated uploads (figure 10), to the abstracted
	behavior of individual artists (figure 11), to the clustering of similar
	artworks (figure 12), much knowledge can be gained from this dataset. Upon
	the acquisition of more findings, these processes can lead to the creation
	of books, and predictive findings of future memes - derived from the
	analysis of past trends.</span></p>

	<p class="c0 c1"><span></span></p>

	<p class="c0"><span>The deviantArt dataset holds much potential. It is
	reflective of cultures and demographics from niche cliques to global
	phenomenons. As peaked at in this visualisation and its&rsquo; process,
	visual exploration of this data can allow for temporal, cultural and
	demographic revelations.</span></p>

</div>