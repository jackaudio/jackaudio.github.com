---
layout: page
title: "How do I route audio to/from generic ALSA-using applications?"
---

# How do I route audio to/from generic ALSA-using applications?

If you use applications that use the ALSA API for audio I/O and not some
intermediate such as GStreamer or PulseAudio, you can still force most of them
to route their audio to/from JACK. There are two ways of approaching this.

## Using an ALSA Loopback device and JACK alsa_in/alsa_out clients

This more complex but probably more robust approach is well-documented in
[this
document](http://alsa.opensrc.org/Jack_and_Loopback_device_as_Alsa-to-Jack_bridge).

## Using the ALSA JACK PCM plugin

The simpler approach has its drawbacks: if an application stops playing audio,
it will disappear from the JACK world, which can be quite inconvenient. Some
people have also found it quite buggy or unstable in some situations. For
basic audio playback, it works quite well but when used with a more demanding
application or one with more of its own "quirks" (e.g. VirtualBox), this
approach isn't recommended.

It requires an ALSA "plugin" that is **not** installed by default on many
Linux distributions, and the name of the package containing it will vary from
distribution to distribution. On Fedora, the package is called "alsa-plugins-
jack"; on some Debian-related systems, it can be found in
"libasound2-plugins". You should install this using your system's normal
software install/update tool(s).

Once you have it installed, you can use it by editing the file `~/.asoundrc`
(this file may not exist when you start this, or it may already have some
content). You need to add the following text to it:

    
    
    pcm.rawjack {
        type jack
        playback_ports {
            0 system:playback_1
            1 system:playback_2
        }
        capture_ports {
            0 system:capture_1
            1 system:capture_2
        }
    }
    
    pcm.jack {
        type plug
        slave { pcm "rawjack" }
        hint {
     	description "JACK Audio Connection Kit"
        }
    }
    

This first PCM definition above example defines a virtual audio device called
"pcm.rawjack" that has 2 input channels and two output channels. Each channel
definition consists of a number (starting from zero), and a named JACK port
that it will be connected to (it is not possible to create a disconnected
channel). We have called the device "rawjack" because it reflects only the
capabilities of JACK itself - the sample rate, sample format and so forth must
all match JACK's. This is not normally very useful, so we add a second PCM
definition for a device called "pcm.jack". This has the same configuration but
when an application uses this device, ALSA will do whatever is needed to
convert between audio data formats.

Having done this, you can now use the name "pcm.jack" when using any
application that allows you to specify a device name (which in theory all ALSA
applications are supposed to do). The simplest test case to make sure that
things work is to use the ALSA `aplay` utility like this: `aplay -D pcm.jack
/path/to/some/non-compressed/audio/file`

If you wanted to make all ALSA applications use this device by default (i.e.
even when no explicit name is given) then your `~/.asoundrc` should also
contain this text:

    
    
    pcm.!default {
        type plug
        slave { pcm "rawjack" }
    }
    

You should check the rest of the file for other definitions of "pcm.!default"
- only the last one will have any effect and there should be preferably only
be one.

Note that this solution will create some latency: the ALSA JACK plugin has to
use a buffer between the data being sent by the application and JACK itself to
avoid clicks and dropouts.

