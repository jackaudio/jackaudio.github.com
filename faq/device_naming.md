---
layout: page
title: "How do I refer to a soundcard so that the name always works?"
---

# How do I refer to a soundcard so that the name always works?

The precise order in which a Linux system discovers any soundcards can vary
each time the machine is rebooted. This is particularly true of USB devices.
The device that used to be "hw:0" can become "hw:1" after a reboot, or vice
versa. Fortunately, you don't need to use names like this, and can instead use
a form that isn't dependent on the order that the Linux discovers your
soundcards.

First, in a terminal window, run this command: `cat /proc/asound/cards`.
You'll see output a bit like this:

    
    
     0 [SB             ]: HDA-Intel - HDA ATI SB
                          HDA ATI SB at 0xfcef8000 irq 16
     1 [DSP            ]: H-DSP - Hammerfall DSP
                          RME Hammerfall DSP + Digiface at 0xfcff0000, irq 20
     2 [NVidia         ]: HDA-Intel - HDA NVidia
                          HDA NVidia at 0xfe57c000 irq 32
    

The "name" of each soundcard is in square brackets.

With this information, you can now refer to a particular device as, for
example **hw:DSP** (for the RME Hammerfall DSP in the above example. Even if
the devices end up re-ordered for any reason, **hw:DSP** will still refer to
the same device.

The one case where this fails is if you have multiple instances of the same
type of soundcard. This is a much trickier situation to deal with and is
covered in detail [here](http://alsa.opensrc.org/Udev).

### Where do I use this name?

You can type it into the device name selector in the upper left of qjacktl's
setup dialog. You can use it as the argument to the -d flag of JACK's ALSA
backend (e.g. `jackd -d alsa -d hw:DSP`.

