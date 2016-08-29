---
layout:	post
title:	"Encoding Sign Language (Benefits & Hurdles)"
start-date: 	2016-08-28
date:	2016-08-29
tags:	[signlanguage, ASL, SignWriting, Research]
---

## Intro

There are millions of signers out there. ASL, the American Sign Language is used by half a million people, whilst LiBraS, the Brazillian Sign Language is used by 3 million. [wiki](https://en.wikipedia.org/wiki/List_of_sign_languages_by_number_of_native_signers)

In America, Standards for Teaching and Learning American Sign Language [[PDF]](https://aslta.org/wp-content/uploads/2014/07/National_ASL_Standards.pdf) have become further refined over time. However, written components of this curriculum suggest English rather than a written form of Sign language. 

Historically, sign language communities have evolved without a written form - a legacy of historic attempts to educate signers in conforming with hearing-based-education such as oralism likely hasn’t helped.

Written Sign Language can be extremely beneficial to native and non-native signers – for legal, technological, and cultural reasons. For further readings to the benefits of written Sign Language, see:

- [“The Official Sign Language Writing Textbook”](http://aslized.org/learningsi5s/)
- [Symbol font for ASL: Writing in American Sign Language - ASLFont](https://aslfont.github.io/Symbol-Font-For-ASL/index.html)
- Unicode Thread Comment on ‘[Re: Writing a proposal for an unusual script: SignWriting - by Stephen Slevinski](http://unicode.org/mail-arch/unicode-ml/y2010-m06/0279.html)
- [ASL Writing](http://www.aslian.com/) - (aslian) RW Arnold
- _“Writing is an ancient technology that survived centuries of testing. It can be put on any surface with a minimum of material!” – [ASLWrite](http://www.aslwrite.com/about_aslwrite/)_


Imagine having a dictionary that can translate sign languages between different countries whilst traveling, or having cg cartoons, and games adopt native sign language when they’re internationalized. How about having the signing equivalent of existing mobile virtual voice assistants such as Siri, Cortana, or Google Now - to do your bidding.

Written Sign Languages can, encourage official language status (for languages yet to reach it like ASL), promote it as a secondary language, and offers the ability to read and write in a native signer’s first language - without the internal hassle of translation.

## Written Sign Language

There are multiple ways to write a sign language such as ASL. Many have been detailedly documented under [ASLFont’s article on ‘Ways to Write’](https://aslfont.github.io/Symbol-Font-For-ASL/ways-to-write.html).

To date, there is no official written form for ASL. However the most promising systems appear to be SignWriting and ‘si5s / ASLwritten’.

_It should also be noted that it appears to be important that written sign languages can be ‘flipped’ in the case of left-handed users._

### si5S / ASLwritten – Cool but Uncertain

![ASLwritten image](_posts_assets/aslwrite-bob.png)

One of the most promising forms of written ASL is si5s or ASLwrite - based on SignWriting. It appears to be very easy and elegant to write, in comparison to the older SignWriting system. It was devised in 2003 and presented publicly in 2010.

Though [si5s](https://en.wikipedia.org/wiki/Si5s) looked promising, it has since fallen quiet in the last couple years. It’s [official website no longer runs](http://www.si5s.com/), and the founders had appeared to have a bit of a falling out with [ASLwrite splitting off from si5s](https://www.quora.com/Why-did-ASLwrite-split-from-si5s). The [textbook can still be found on ASLized](http://aslized.org/category/si5s/).

[ASLwrite’s official blog](http://www.aslwrite.com/) hasn’t recieved an update since 2014-08, though the twitter and facebook groups have been updated this year 2016-01. Andrean Clark (host of ASLwrite) also has some Written ASL drawings that can be found in the definitions of [HandSpeak (e.g. cat)](http://www.handspeak.com/word/list/index.php?abc=ca&id=334)

The language itself is also constantly evolving - as the handshapes of Andrean Clark’s first book on “How to Write ASL” first edition differed significantly from the second edition.

It has been stated that “Incoming students at Gallaudet University will be required to learn si5s starting in 2012.” – [[ASLfont]](https://aslfont.github.io/Symbol-Font-For-ASL/ways-to-write.html). However it is uncertain if this is still the case in 2016, if so, it would certainly lend this written form validity. 

### Sign Writing – Tried and True

![SignWriting Image - Jack and Jill in SignWritten:ASL](_posts_assets/Jack_and_Jill.gif)

[Sutton SignWriting](https://en.wikipedia.org/wiki/SignWriting) has been around since 1974 as an international system for writing sign languageS. If ASL is to English and LiBraS is to Portugese, then SignWriting is to the International Phonetic Alphabet (\|ˈalfəbɛt\|).

SignWriting is used in every inhabited continent. In Brazil, the SignWriting has been in use with the Brazilian Sign Language [LiBraS](https://en.wikipedia.org/wiki/Brazilian_Sign_Language) since at least 1997, in required courses at University of Santa Catarina at Florianopolis (UFSC), the preffered method of transcribing LiBraS as of 2001 - and recommended to all Deaf schools.

SignWriting is a 2-Dimensional Graphical interpretation of 3-Dimensional Sign Languages, it is written vertically and from the point of view of the signer. (Traditionally it was written horizontally, and from the point of view of the viewer). Most publications also assume the right hand is dominant.

_(P.S. When reading SignWritten words with faces, I find the perspective a bit confusing, but perhaps I just need to take some time to become accustomed.)_

_(P.S. 2. Also find it a bit odd that the ASL alphabet is usually presented from the viewer-perspective. Here’s a [drawing from the signer-perspective](https://au.pinterest.com/pin/107523509827901705/) ._ )

The disadvantages of SignWritings is that as a 2-Dimensional Language, with infinite potential layouts, it requires specialised software to type, and its detailed glyphs makes it unsuitable for rapid note-taking.

SignWriting has already made huge leaps into being encodable by computers, with the [Sutton SignWriting (Unicode Block)](https://en.wikipedia.org/wiki/Sutton_SignWriting_(Unicode_block)) a part of Unicode Version 8.0 released June 2015.

_(P.S. If you are having trouble viewing the unicode blocks in the above link, your Operating System - System Fonts may not support it yet, you can download a font with the Unicode Blocks here - then reload your browser: [SignWriting 2010 TrueType Font](https://cdn.rawgit.com/Slevinski/signwriting_2010_fonts/master/fonts/SignWriting%202010.ttf) + [SignWriting 2010 Filling TrueType Font](https://cdn.rawgit.com/Slevinski/signwriting_2010_fonts/master/fonts/SignWriting%202010%20Filling.ttf)

However, Unicode only supports 1-Dimensional characters - and as such; only the individual components of SignWriting have been accepted.

From a personal point of view, the state and evolution of SignWriting appears quite analagous to other pictorial languages such as early chinese, japanese, korean or malay. In these written languages’ infancy, there were no gridded rules for placing glyphs - much like SignWriting. They were written vertically; some evolving to adopt horizontal writing with time, but eventually all were somewhat forced to adopted horizontal alternatives with the adoption of digital technology originating from the western world. In any one of these languages, thousands of possible words could be composed with glyphs, but only a subset of the most common 10Ks words or so were selected to be Unicoded [(such as Chinese,Japanese,Korean - as part of Unicode CJK Unified Ideographs Packs)](https://en.wikipedia.org/wiki/CJK_Unified_Ideographs).

Though pictorial characters like Japanese are character-encoded (meaning one Unicode character always has the same meaning), the act of Typography means that self-expression through is not lost. (Yes, like english, asian characters also have many different ‘Fonts’, their own equivalents of ComicSans, Helvetica, Times New Roman, etc.). SignWriting could also have its own ‘Fonts’, such as ‘SignWriting Blocks, SignWriting Handwriting, ASLwritten, etc.’)

Similar to CJK characters, I believe SignWriting could benefit from having a Horizontal Writing option. However, unlike these other languages; modern algorithms can also be used to help identify common SignWritten words - even with variable glyph placement, and, like CJK, help form a set of SignWriting Unified Ideographs for submission to Unicode. Paving the way towards official recognition of Individual Sign Languages in tech, culture, and government.

## Conclusions

Presently, SignWriting is the closest we have to an official written form of ASL. Upon rough preliminary research, it is also the closest thing signers from phonetic-language countries have to a written signed language.

Focusing on making SignWriting easier to write and read can make it more prevalent and help all Sign Languages. New variations of SignWriting such as ASLwritten could potentially initially be expressed as a typeset of SignWriting - along their road to becoming official languages independent of SignWriting. _It is still important to promote other written sign languages for different cultures - as common actions signed by one country may be significantly different to another._

SignWriting has made huge leaps in recent years, in allowing Sign Languages to be encoded. However there is still a lot much to do. One additional problem that will need to be tackled is the evolving nature of 1. SignWriting, and 2. Individual Signed Languages - however I strongly believe that modern technologies have the capabilities to support such dynamic languages.

