---
layout:	post
title:	"ASL Keyboard Possibilities"
date:	2016-08-31
tags:	[signlanguage, ASL, SignWriting, Research]
---

Previously we established that it is feasible to categorise ASL Handshapes so that the full gamut can theoretically be accessed with 5-10 base shapes x 6-10 modifiers (i.e. button-presses). Let's now look at existing systems to see how a SignWritten-ASL keyboard could potentially be designed.

## Drawing Inspiration

The iOS system keyboards are a nice place to draw inspiration as they encourage bare minimalism and function. In investigating the various Chinese and Japanese keyboards, some key notes were made.

In the 9-button Chinese (Pinyin-10key, Stroke) and Japanese (Kana) keyboards - the Keys never change, they don't even have alternative views in their native tounge such as 'numbers-section' (which are printed in english).

The only alternatives are a QWERTY based keyboard with the english-alphabet, for typing phonentic-versions of these pictorial languages (Chinese:PinYin) (Japanese:Romanji).

All keyboard variations are Static (their keys don't ever change to accomodate more native characters), and include auto-suggestions for entered characters. Auto-Suggestions are how a variety of words can be accessed with just a few button-taps.

## Importance of a Static Keyboard

In hindsight, it makes sense that keyboards should be static, so as to allow rapid touch typing and ease of learning. This perhaps might lend reason to why the SignWriting Keyboard is so difficult to use currently - perhaps due to its ever-changing nature - and its added intention to create SignWritten words. My focus, by comparison, is that the primary goal of this keyboard is to input existing SignWritten Words (btw, creating new signs would be made easier if we could search for an existing one and simply edit it).

_(As the keyboard is now dynamic, we no longer need to worry about the order that symbols are entered.)_

With the combination of a few static strokes (9 only), the Chinese Keyboard manages to access 10s of 1000s of characters. I'm sure a SignWriting based keyboard could achieve something similar.

## Possible Keyboards

The keyboard to be designed will be Static.
We will stick with QWERTY layout for now, giving us 26 keys, instead of 9. _(More intelligent or custom keyboards, such as Japan's Flick-based Kana Keyboard, theoretically giving access to 45 base symbols instead of 9 (the Chinese-Stroke one doesn't have flicking), can be considered after the QWERTY version has an opportunity to mature)._

Keyboard Options:

- Translating Native Words to writtenSign - as its typed
- 26 Symbol Keyboard - where we replace the alphabet with descriptors of SignWriting, and utilise Automatic-Suggestions.


## Keyboard with ASL-English Input

This system would be akin to the existing Chinese "pinyin" and Japanese "Romaji" input methods - where a roman alphabet is used, we can have "ASL English" or "LiBraS Portuguese" instead.

This is relatively straightforward, substituting a pictographic SignWritten-ASL-word when an ASL-English-word matching it is typed.

Simply requires a database of 'SignWritten-Words, and their ASL-English definition'.

_(Tidbit: It appears there is concern that many Chinese youth are loosing the ability to write due to a reliance on the pinyin method over stroke. The same concern exists less so in Japan. This I believe is due to the disconnect between their written and visual language - however imo signers are already comfortable with this disconnect, so the connection should only improve with a native-keyboard.)_

## Keyboard with Signed Attributes as Input

### SignWritten-Word Attribute Detection

Looking at the most prominent categories for written ASL (Handshape, ~Orientation, Location, Movement). All are relatively easy to detect on SignWritten-Words (as the words are usually encoded with a data-sequence that describes them). Location is an exception, relative-position of symbols aren't straightforward to detect, though there are location-symbols (like cheeks), the user-generated dataset may be unreliable in regards to this attribute - use with caution.

### Viability Check

SignWriting lists a lot of symbols in use. At the Highest level we have Handshape (10), ~Orientation (3 palm-directions * 8 rotations), Location (6-basic), Movement (10). In total SignWriting officially lists 28 top-categories (orientation and rotation not amongst them).

Based on a gut-estimate from existing research, these are the potential number of keys required for each category:

- Hands (5-10)
- Orientation+Rotation (6-10)
- Location (5-7)
- Movement (4-10)
- Special (2-8) - _Special Attributes could include computed attributes like 'Number-Of-Hands' in SignWritten Word'_

### Determining Which Keys should be on the Keyboard

- Assuming we have: A database of SignWritten Words, with their unique encoding, and (Optional) the frequency of the Word in everyday ASL.
- We can analyse them for specific attributes (e.g. right-rotation, number-of-fingers-raised, number-of-hands) - attributes that would become a candidate for a key on the keyboard

Next we need an algorithm for determining what keys should be used, it algorithmically speaking:

- Continuously attempts to halve a set of attributed-words by slicing all previously-cut-slices along the existence of an attribute.
- OR (alternative definition attempt): Creates a balanced decision tree to select an item with boolean-attributes, where each Decision is defined by the Level of the Tree.

[[Pseudocode of the Algorithm was written]](_posts_assets/Refinement of the keyboard-keys-determination algo.swift)

_NOTE: This algorithm is solely for the purposes of identifying Candidate Keys for the keyboard. It is in no way re-adaptable to 'Auto-Complete' or 'Search' functions. Such algorithms should be straightforward enough._

## Summary

- A Static Keyboard with fixed keys is important.
- We'll require some data first.
- An English-To-SignWrittenASL keyboard is straightforward. (though i like the idea of a Signing-Symbol Keyboard better).
- The Signing Keyboard appears very feasible, though a bit more work. 

- _(Reminder: Supporting the dynamic and evolving attributes of SignLanguages is still very improtant.)_



