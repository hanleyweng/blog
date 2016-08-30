---
layout:	post
title:	"Common Written ASL Symbologies"
date:	2016-08-30
tags:	[signlanguage, ASL, SignWriting, Research]
---

In thinking more about a SignWritten-ASL Keyboard, I've been taking inspiration from Chinese and Japanese Keyboard input systems on iOS, especially the 9-button keyboards.

_(Update 2016-08-31: I mistakingly thought that these iOS keyboards change their layout dynamically, they in fact do not, something I've taken into account in my next post.)_

If we're going to develop a keyboard with only 9-keys, the keyboard will have to be dynamic, changing with each press - in order to cover a pictorial language like SignWriting. With this in mind, it's important to look into the 'thinking-order' of written ASL.

With the primary aid of [ASLFont's article on Ways to Write](https://aslfont.github.io/Symbol-Font-For-ASL/ways-to-write.html) the following analysis was made of the following written ASL forms: [Stokoe Notation, International Sign Writing Alphabet, HamNoSys, SignFont, ASLphabet, ASL Orthography, si5s, ASLSJ, and SignScript].

## Common ASL Symbol Categories Order

The most common descriptive categories of symbols in written ASL are:

1. Handshape / Location / Movement.
2. Orientation.
3. Other: e.g. Quality / Repetition / Descriptions of Non-Dominant Hand / Contact-Region.

Most of the elegible forms (7 of 8), ordered the most common motions as such:

**1. Handshape, Location, Movement.**

Only Stoke Notation put location first. Four of the forms adhering to this common order used Orientation, with the most prominent (3 of 4) ordering:

1. Handshape, 2. ~Orientation, 3. Location, 4. Movement

## Common ASL Search Categories

LifePrint and SignSavy are English-to-ASL dictionaries and irrelevant here.

[Handspeak's](http://www.handspeak.com/word/asl-eng/) search categories include:

- Handshapes (36)
- Movement (4)
- Location (13)
- N-Handed/Timing (3)

[Signwritten:ASL Sign Puddle](http://www.signbank.org/signpuddle2.0/index.php?ui=1&sgn=4) allows search by Symbol (filtered by Symbol Group, Frequency, or specific Symbol). This means it can not search by 'N-Handed/Timing', or 'Relative-Location'.

## Handshape Hierarchies

Most written ASL evidences prioritising Handshape as the first, and therefore, critical symbol category. However, the number of ASL handshapes used are many {20,50,80 ~distribution}. Some help provide order to these symbols with hierarchy:

| ASL Form.                       | Top Category Count. | ~ SubCategory Distribution. | Total | 
|---------------------------------|---------------------|-----------------------------|-------| 
| SignBank ASL Picture Dictionary | 5                   | -                           | -     | 
| ASLFont : Quote                 | 7                   | -                           | -     | 
| ASLFont : Handshapes            | 5                   | 6,10,10,12,13               | 51    | 
| HamNoSys                        | 6                   | 3 >> 4                      | 32    | 
| HandSpeak                       | 12                  | [1,4,6]                     | 36    | 
| SignPuddle                      | 10                  | [10,20,60] >> …             | 100+  | 
| SLIP                            | 26                  | -                           | 55    | 
| Stokoe Notation                 | -                   | -                           | 19    | 
| SignFont                        | -                   | -                           | 21    | 
|                                 |                     |                             |       | 


_Extra Sources for DataTable:_

- _"Researchers have determined that 7 basic handshapes tend to be used in signed languages around the world." - [ASLFont on handshapes](https://aslfont.github.io/Symbol-Font-For-ASL/asl/handshapes.html)_
- _SignFont [[Web-Archive]](http://web.archive.org/web/20010220205256/http://members.home.net/dnewkirk/signfont/charchrt.htm)_
- _[HamNoSys - Beautifully documented and described](http://www.sign-lang.uni-hamburg.de/dgs-korpus/index.php/hamnosys-97.html)_

Though most Handshapes range far beyond a reachable limit for a dynamic keyboard with only 9 keys, it is foreseeable that a mental model exists to support the multiplication of 5-10 basic handshapes with 4-10 modifiers to cover the ASL handshapes. HamNoSys is an excellent source of inspiration in its elegance.

## Summary

Mental Ordering for common written ASL symbols can be estimated as:

**1. Handshape, 2. (Optional) Orientation, 3. Location, 4. Movement**

Accessing all Handshapes with a small dynamic 9-button keypad appears viable!

---

## Extra Links:

- [SignWriting-Forums-Linguistics](http://signwriting.org/forums/linguistics/ling001.html) - good for comparing different written sign language systems look
- [SLIPA](http://dedalvs.com/slipa.html#intro) - very thought out methodology to encoding an existing sign language (with consideration to Placement, and valid critiques of existing systems)
- [Hidden ASLFont Page on Handshapes](https://aslfont.github.io/Symbol-Font-For-ASL/asl/handshapes.html) - great resource for basic Handshapes written in other forms
- [Hidden ASLFont Page on Elements of ASL](https://aslfont.github.io/Symbol-Font-For-ASL/elements-of-asl.html)
- [Wiki - American Sign Language Phonology](https://en.wikipedia.org/wiki/American_Sign_Language_phonology)
- [CASLI](http://www.casli.org) - offers a comprehensive list of official-looking study materials for those curious about the rigour of Certified Interpreters


## Misc. Tidbits I found out whilst making this post

- _"ASL shares more with spoken Japanese than it does with English" [[Wiki - SL #30]](https://en.wikipedia.org/wiki/Sign_language#cite_note-30)_
- _"ASL users face stigma due to beliefs in the superiority of oral language to sign language, compounded by the fact that ASL is often glossed in English due to the lack of a standard writing system." [[Wiki - ASL]](https://en.wikipedia.org/wiki/American_Sign_Language)_












