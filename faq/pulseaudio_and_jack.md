---
layout: page
title: "How use PulseAudio and JACK?"
---

# How use PulseAudio and JACK?

Many Linux systems now use PulseAudio as the default sound server, using it to
handle all sound playback (media players, desktop alerts, web browsers and
more). Here are a couple of basic observations about using JACK and PulseAudio
together:

  1. While PulseAudio is running, JACK cannot access the same soundcard that Pulse is using. Even though in theory ALSA provides mechanisms for this to be possible (e.g. "dmix" device access), they do not work well enough to support both of these systems reliably. 
  2. PulseAudio and JACK can appear to have similar goals to many people, and they wonder why its not possible to replace one with the other. However, beyond a very superficial similarity, they really do not have much in common: 
    * PulseAudio is focused on desktop and mobile audio needs. It doesn't try to address low latency usage, but does provide seamless device switching, network routing, global per-application volume control and lots more great stuff. 
    * JACK is focused on the needs of pro-audio and music creation users. It offers the lowest possible latency, complete routing flexibility between applications and audio hardware, and all audio is always sample synchronized - apps don't run ahead or behind of others. It doesn't provide the smooth desktop experience that PulseAudio is aiming at. 

Combining PulseAudio and JACK on the same machine can be problematic. There
are several options, some of which leave PulseAudio and JACK as entirely
separate systems with no audio flow between them. Others connect them so that
audio from one of them can be heard via the other.

## Option 1: don't use PulseAudio with JACK

The most experienced and demanding users of JACK do not attempt to link
PulseAudio and JACK. Many of them will not run PulseAudio at all, having
either never installed it, removed it from their systems, or disabled it. They
will generally route audio from other apps to JACK without using PulseAudio,
via the techniques described in the "How do I route audio to/from ..." section
of the
[FAQ](/faq/).

## Option 2: use two different soundcards

Many users of JACK have computer systems with more than 1 soundcard. Typically
there is the builtin soundcard, which is a cheap consumer grade device, often
with a variety of limitations that make it less suitable for use with JACK.
The user has subsequently added another audio device, either as an internal
(PCI) card or an external unit connected via FireWire or USB.

### Two ALSA-supported soundcards

All that is necessary in this case is to define the device that PulseAudio and
JACK will use. Run the following command in a terminal window: `cat
/proc/asound/cards` You will some output like this:

    
    
     0 [SB             ]: HDA-Intel - HDA ATI SB
                          HDA ATI SB at 0xfcef8000 irq 16
     1 [DSP            ]: H-DSP - Hammerfall DSP
                          RME Hammerfall DSP + Digiface at 0xfcff0000, irq 20
     2 [NVidia         ]: HDA-Intel - HDA NVidia
                          HDA NVidia at 0xfe57c000 irq 32
    

(This is from a machine with 3 soundcards: a builtin device, an additional 26
channel RME Hammerfall DSP device, and (unintentionally) an NVidia video
adapter that also has an HDMI audio output.)

Each of these cards can be accessed using its name, which is contained within
the square brackets ([]). Generally, the name will simply be the conjunction
of "hw:" and the card name. So for example, "hw:DSP" refers to the RME
Hammerfall DSP in the above list, and "hw:SB" refers to the builtin soundcard.
The names in your system will vary.

### Telling JACK which device to use

To tell JACK to use the RME Hammerfall DSP, you would typically do this either
via the upper right of QJackctl's setup dialog:

![screenshot of qjackctl's setup dialog](http://jackaudio.org/files/qjackctl_setup.png)

or on the command line, by passing `-d hw:DSP` to JACK's ALSA backend.

### Telling PulseAudio which device to use

## Option 3: route PulseAudio to JACK while JACK is running

Please see [this wikipage] 
(https://github.com/jackaudio/jackaudio.github.com/wiki/WalkThrough_User_PulseOnJack).

## Option 4: suspend PulseAudio while JACK is running

If you start JACK using QJackctl, then you should go into its setup dialog and
edit the field labelled "Server path". Insert `pasuspsender --` in front of
whatever is there (probably just something like `jackd`). So for example, if
you had "jackd" in the "Server path" field already, it should now say:

    
    pasuspender -- jackd

This will cause PulseAudio to suspend itself while JACK runs, and restart when
JACK exits (or crashes).

If you start JACK any other way, you will need to figure out how to make your
method use `pasuspender --` as the command that actually starts JACK.

