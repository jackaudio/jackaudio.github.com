---
layout: page
title: "How do I route audio from Phonon applications to JACK?"
---

# How do I route audio from Phonon applications to JACK?

Phonon is a "thin" layer used by many KDE applications to play and record
audio. It actually doesn't contain any implementation itself, but instead uses
another software library to get stuff done. The most common backend for this
is GStreamer, and so to get Phonon to route audio via JACK you should
generally just follow the [instructions for GStreamer](gstreamer_via_jack.html). If you use Phonon
with the Xine backend instead of GStreamer, there's no information for you
here yet.

