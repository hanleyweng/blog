---
layout:	post
title:	"English to ASL Translator App (Quick Sketch)"
date:	2016-11-24
tags:	[idea, sketch, ASL, translate, app]
---

<style>
	div.side-note {
		background-color: #EEE;
		font-size: 0.8em;
		border-radius: 5px;
		margin: 10px 20px;
		padding: 10px;
	}
	div.side-note p {
		margin: 1em;
	}
</style>

Woke up on Wednesday and had an idea, so I spent a few minutes sketching and verifying it. An English to American Sign Language (ASL) translator. Geared towards English users learning ASL (Not for English speakers talking to ASL users).

## 💡 English to ASL App

The app allows you to look up words straight from your home-screen, translates text from camera feeds into ASL in real time, and allows the live translation of voice to ASL. 

[![Interaction Paradigms Sketch](ASL-words-sketch.jpg)](ASL-words-sketch.jpg)

We already knew, or quickly verified, that we could use Spotlight Search, iOS10 Live Dictation, and real-time text recognition (OCR) in videos. *

<div class="side-note">
	<p>* Using: CSSearchableItem, SFSpeechRecognizer, Google Cloud Vision API / Microsoft Computer Vision API.</p>
</div>

_Note: Currently only word translations are possible (Pidgin Signed English, PSE), not grammar (which would need more data and Neural Machine Translation, NMT)._

_Note: Translating English to ASL from real time Camera feeds may be costly - and the economics need to be considered. Translating text in photographs, or at a slow framerate should still be free._

## 🔨 Buildable in a few hours

Note: This was a quick sketch of design possibilities, not details (wireframes here show possible interactions, not UI nor visuals). Knowing we can do live dictation doesn’t necessarily mean we should. 

From this quick sketch, (and previous experience) – we know it would only take a few hours to build a releasable pilot that can be iteratively tested and designed upon. 

## 🤔 Ethics? Needs User Research

However, just because it’s easy to build, I’m uncertain if it should. This idea differs from the usual, in that there’s room for significant misuse and abuse. User research is needed to evaluate if such an app should be created, and if so, how design can minimize misuse.
