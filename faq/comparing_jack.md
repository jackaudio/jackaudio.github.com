---
layout: page
title: "How does JACK compare to ..."
---

# How does JACK compare to ...

## How does JACK compare to...?

Please mail the jackit-devel mailing list if you have any concerns about the
answers to these questions. Also, no disrespect to any effort is intended,
only a recognition of different goals and design principles.

### Other Linux-centered systems

  * ALSA: both a HAL and a user-space library for audio under Linux. ALSA is used to provide the default audio i/o driver for JACK. ALSA is a very powerful audio API, but it does not provide a callback-based API or offer any solutions for inter-application communication, though it has been discussed and is theoretically possible. 
  * aRts, a streaming media architecture: aRts was not designed from the ground up with low-latency in mind. Not a fault, but a design decision. A jack output element could be written for aRts, though, as far as I can tell. Note: aRts is not really used anymore by any Linux systems. 
  * GStreamer, another streaming media architecture: GStreamer is designed for in-process construction of media pipelines, and is not used to link applications. JACK elements for GStreamer are under available. 
  * LADSPA, LV2: LADSPA is an internal plugin API for DSP routines, not a way of linking external applications together. 
  * Phonon 
  * Canberra 

### Cross-platform systems

  * PortAudio: a "cross platform, open-source, audio I/O library" offering both callback- and blocking I/O-based APIs. PortAudio backends exist for various Windows, Mac, and Unix HALs. It is mainly focused on hardware I/O rather than a general concept of ports and connections. The callback-style API used by both projects makes it relatively easy to port between the two (no pun intended), and there is a JACK backend for PortAudio so porting is not always necessary. 
  * SDL: 
  * SFML: 
  * OpenAL: 

### MacOS- and/or Windows-centered systems

  * CoreAudio, the Mac OS X audio API: Very similar to JACK in some the sense of being centered on a synchronous-execution-via-callback API, but does not include inter-application audio routing. CoreAudio also includes a hardware-level abstraction layer, whereas JACK uses higher-level drivers for that purpose. The first JACK driver was based on ALSA, but others are available for the OSS and PortAudio interfaces. 
  * ASIO: a HAL for both Windows and MacOS that replaces the native device driver model with something much cleaner. It supports hardware-level latencies, but it does not connect applications to each other. Also, it is subject to license restrictions, and does not exist for Linux (though it would not be impossible to implement it on top of ALSA). 
  * ReWire, an inter-app communications API for Windows and MacOS from PropellerHeads and Steinberg, ReWire is similar in that it provides inter-application audio routing, but does not allow for fully independent processes, and has silly restrictions ("up to 64 channels", etc). JACK also comes without silly license restrictions. 
  * VST, AudioUnits, DirectX, MAS, RTAS: these are all Windows/MacOS audio plugin APIs. None of them permit inter-application data sharing. Some plugin hosts can make this possible by using some other system such as ReWire. These APIs also require that the callback you write to process/generate data be executed in the context of the plugin host; JACK allows your callback to be executed within the context of your own application (if you wish to). 

