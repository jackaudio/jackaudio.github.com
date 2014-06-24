---
layout: page
title: "Does using JACK add latency?"
---

# Does using JACK add latency?

There is **NO** extra latency caused by using JACK for audio input and output.
When we say none, we mean absolutely zero. The only impact of using JACK is a
slight increase in the amount of work done by the CPU to process a given chunk
of audio, which means that in theory you could not get 100% of the processing
power that you might get it if your application(s) used ALSA or CoreAudio
directly. However, given that the difference is less than 1%, and that your
system will be unstable before you get close to 80% of the theoretical
processing power, the effect is completely disregardable.

