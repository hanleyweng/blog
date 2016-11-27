---
layout:	post
title:	"Apple TV Game Design Possibilities"
date:	2016-07-30
tags:	[AppleTV, interaction, game, tvOS10]
---

These are learnings on what interactions are possible with the Apple TV 4, with tvOS 10. 📺

## Notes

Platforms of user-input:

- Controlling TV with Siri Remotes.
- Controlling TV with Apple TV Remote iOS Apps.
- Controlling TV with Gamepads.
- Mirroring iDevice to TV.
- Multipeer Connectivity between iDevices and TV.

Apple TV can support multiple remotes (GCSupportsMultipleMicroGamepads = YES). tvOS10 allows Four simultaneous controllers. 

All listed platforms have access to a touch area besides the gamepads. 

Note TV only receives joysticks as binary (you're either moving right, or not - there's no "moving right at 65% tilt".)

For all intents and purposes, the Apple TV Remote iOS Apps perform the same functions as Siri Remotes (Microgamepads). There is no siri/dictation/microhpone dev access. No gyroscope access on Siri remotes. This means no real Wii-like interactions (Magnetometre/Yaw/Compass is required for 6DOF). Interactions are hence restricted to, for example: only use two dimensions of tilt, temporary quick accelerations, using slow 'attitude' movement (on Apple TV remote apps only).

Note also that no more than one AppleTV-App/Siri remote

The restriction of two-dimensions of tilt heavily informs the type of game designs possible (XZ (top-down), XY (back-front), YZ (side-scroller, weird mental model though)).

## Therefore

For the most accessible group-games (guests just taking out their phones), then interactions are restricted to GCMicroGamepad (https://developer.apple.com/reference/gamecontroller/gcmicrogamepad) - with 2 buttons and a D-Pad for up to 4 maybe 6 people. Microhpone and motions can't be used.

For the most possible interactions and people, the traditional methods still hold:

- everyone visits a website / downloads an app (Multipeer App preferable if latency is important)
- this provides access to all available motion data, microphone, secondary screen, force touch, taptic engine, etc.

## Overall

Creating a simple multiplayer game that only needs a MicroGamepads? Use tvOS 10 and Keep things simple. 🕹

For anything more novel, like spell-casting 👉✨, use the traditional methods (sites, apps).

