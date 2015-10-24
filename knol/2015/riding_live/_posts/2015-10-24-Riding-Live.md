---
layout: post
title:  "Riding Live: An Immersive, Pedal Powered Installation - Process"
date:   2015-10-24
tags: [Installation, light projection, interactive, health, games, bike culture]
---

# Riding Live: An Immersive, Pedal Powered Installation - Process

<iframe width="560" height="315" src="https://www.youtube.com/embed/u3fd3sHLgro" frameborder="0" allowfullscreen></iframe>

## Description

Riding Live prompts participants to ride a stationary bicycle to control their journey through an immersive landscape. It aims to encourage the growth and recognition of bike culture. 

It was hosted at the Bespoke City Festival in October 2015 at UNSW Art and Design on a Friday night preceding the Sydney Rides Festival. 

The installation was projected onto a 12m x 8m wall overlooking the central courtyard, a courtyard filled with riding-centric aristic works across an approximate 830sqm area. This scale allowed the installation to create the feeling of a large public portal into another world.

## Collaborators and Thanks

Riding Live was created with Xavier Ho (fantastic advisor and GLSL supporter) and Laura Fisher (amazing festival director and artistic guide). Many thanks to Andrew Kurniawan and Eugenius Lai for their help sourcing materials and with setup on the day.

![bike-blue](media/select_images/bike-blue.jpg)

![ground-courtyard](media/select_images/ground-courtyard.jpg)

![bike-purple](media/select_images/bike-purple.jpg)

## Process: Conceptualization

This installation began following contact by Veloscape, an artistic research group, to create a large projected work for the cycling-oriented event, the ‘Bespoke City Art Festival’.

The initial idea was to project a real time visualization of cyclists riding past particular areas onto a wall with high visibility, a concept that won the international Media Architecture Biennale 2012 Student Design challenge held in the bike capital, Denmark. Following the acquisition and simulations (data and visual) of the City of Sydney cycling data, it was evident that a two- dimensional real time display would be visually too repetitious, quiet and lacks a narrative in the context of the evening festival.

Subsequently, the concept was pivoted to better promote the culture of city biking by immersing people in the work. The festival concept became an interactive visual system where passers-by could hop onto a provided bike and ride through an abstract landscape of large zooming visuals projected in front of them.

## Process: Creation

Software and hardware were developed iteratively in line with evolving logistical constraints in regards to the sourcing of materials.

Hardware involved a bike with an easily mountable frame suitable for diverse public use, a fitting bike stand, a magnet and reed sensor to detect bike speed connected to computer for processing.

Software drove the visuals and was comprised of GLSL shaders to warp textures into a zoom-based effect. Post-effect shaders were also used, such as bloom, chromatic aberration, and general hue shifting. [Processing](processing.org), a quick visual tool that supplements the agile process nicely, handled generic logic such as the controlling of GLSL shaders via speed of peddling and the loading of image textures. A procedural starfield was also generated, adding to the sense of movement.

The graphical representations were designed so that they were visually coherent at both slow and rapid speeds. By default, with no one riding, the visuals would take 40 minutes to loop. At average cycling speed it becomes a four minute loop.

## Files

[Working Repository of files](https://bitbucket.org/hanleyweng/astral-bikes-repo)

## User Experience & Future Work

Overall sentiment was very positive, from artists and non-artists, with many acknowledgements to the large abstract visuals and the works interactive attribute. 

A deep informal enquiry was conducted with ten people throughout the event. There appeared a desire for more thematic visuals further grounded in real-world metaphors, facilitating a stronger sense of storytelling and progress. Requests for procedural generation and steering were also repeated, alluding to a greater desire for control in one’s individual journey with the installation.

---

For more details about the process, check out this extended abstract [coming soon]().

![bird-courtyard](media/select_images/bird-courtyard.jpg)