---
layout: page
title: "How do I route audio from Flash to JACK?"
---

# How do I route audio from Flash to JACK?

There are a couple of approaches here.

  1. systems that route audio from the web browser via ALSA: [routing ALSA audio
  via JACK](routing_alsa.html)
  2. systems that route audio from the web browser via GStreamer: [routing
  GStreamer via JACK](gstreamer_via_jack.html)
  3. systems that route audio from the web browser via PulseAudio: [routing
  PulseAudio via JACK](pulseaudio_and_jack.html)
  4. use the libflashsupport-jack library from Torben Hohn 

The first three solutions that are described via the linked pages. The final
one uses a little-known feature that Adobe provides in its browser Flash
plugin: the plugin will (optionally) attempt to load a software library and
use it for delivery audio data. There could be many different uses for this
library, but in our case we only care about the one implemented by Torben Hohn
which sends the audio onto JACK. Its probably the least-hassle, most reliable
way to get audio out of Flash and into JACK.

Unfortunately, at this point in time (Fall 2010), most Linux distributions do
not package this library, so if you want to use it you will need to build it
yourself. This is not that hard if you've used the command line a few times:

    
    
    git clone git://repo.or.cz/libflashsupport-jack.git
    cd libflashsupport
    sh bootstrap.sh
    make
    sudo make install
    

You need some tools installed for this build process to work:

  * ALSA development libraries 
  * JACK development libraries 
  * libsamplerate development libraries 
  * libssl development libraries 
  * basic software development package 
  * git-core 
  * autoconf 
  * automake 
  * libtool 
If you are on a 64-bit distribution that uses /usr/lib64, you may also need to
arrange a symbolic link:

    
    
    sudo ln -s /usr/local/lib/flashsupport.so /usr/lib64
    

On some versions of Linux that use a web browser that looks for things in
slightly different locations (Ubuntu Lucid is one example), you may also need
a command somewhat like this:

    
    
    sudo ln -s /usr/local/lib/libflashsupport.so /usr/lib/firefox-3.6.3/
    

After installation, quit any existing browser and then start a browser,
visiting some Flash-using URL. Assuming that JACK is running, things should
just work. Latency (the video/audio lag) is a little high - work might be done
in the future to address this.

