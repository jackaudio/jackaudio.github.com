---
layout: page
title: "Routing GStreamer audio via JACK"
---

# Routing GStreamer audio via JACK

Its relatively easy to get audio from GStreamer to flow via JACK:

  1. You need the GStreamer JACK audio plugin, which is currently (Fall 2009) part of the "bad" plugins collection. Most Linux distributions make this available through their normal software install/update systems. The name of the package containing this plugin will vary from distribution to distribution: on Fedora its called "gstreamer-plugins-bad-free-extra", on Ubuntu its called "gst-plugins-bad", etc. etc. 
  2. Next, you need to configure GStreamer to tell it to use this plugin for audio output. There are 3 methods available: 
    * Through the command line using gconf2 (you may need to install this first) 
    * Install/run gconf-editor, which is a general purpose utility for configuring many GNOME-centric applications 
    * Some systems may have the gstreamer-properties command available, which offers a graphical tool for configuring gstreamer 
  3. Your goal is set the value of: 
    * /system/gstreamer/0.10/audio/default/musicaudiosink
    * /system/gstreamer/0.10/audio/default/audiosink

to this value: `jackaudiosink buffer-time=2000000`. The exact value of
`buffer-time` doesn't matter too much, but higher values reduce the chance of
glitches/drop-outs in the audio stream. You might also choose to set
/system/gstreamer/0.10/audio/default/chataudiosink to the same value, but its
less likely to be useful to you.

The impact of this will vary depending on how much your system uses GStreamer.
On modern GNOME-based systems, it will effectively divert all system sounds
and all audio playback via JACK. On other systems (e.g. KDE-based systems) it
will have less of an effect, though it will still impact specific applications
that use GStreamer.

