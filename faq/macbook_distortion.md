---
layout: page
title: "MacBook running Linux: audio via JACK is distorted, audio via ALSA is not"
---

# MacBook running Linux: audio via JACK is distorted, audio via ALSA is not

As of April 2012 there seems to be driver problem that affects the audio
interface on the Macbook when it is used in 24 or 32 bit mode. To avoid the
resulting distortion, use the -S flag to the ALSA backend to force it to use
16 bit sample data format.

