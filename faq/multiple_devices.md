---
title: "How can I use multiple soundcards with JACK?"
---

# How can I use multiple soundcards with JACK?

JACK is fundamentally designed to be a component in a pro-audio/music
creation environment and standard operating practice for such setups
involves using only a single digital sample "clock" (something counting
off the time between audio samples). This means that trying to use
multiple independent soundcards is problematic, because each soundcard
has its own sample clock, running independently from the others. Over
time, these different clocks drift out of sync with each other, and
cause glitches in the audio. You can't stop this drift, although in some
cases the effects may be insignificant enough that some people might not
care about them.

Thus in an ideal world you should not use multiple independent
soundcards but instead use a single device with a single clock and all
the inputs, outputs and other features that you need.

Of course, a lot of people don't live in an ideal world, and believe
that software should make up for this. Accordingly, JACK offers several
ways for you to use more than 1 device at a time.

### 1. Use the alsa_in and alsa_out clients (Linux & ALSA only)

If you are using JACK on Linux and want to use additional devices that
have ALSA driver support (i.e. most PCI, USB and Bluetooth devices),
then this is the best option.

`alsa_in` and `alsa_out` are two clients written by Torben Hohn that
make a single specified ALSA device appear as a set of JACK ports. They
both use Erik de Castro Lopo's libsamplerate library to do any
resampling required to keep the audio in sync as the clocks of each
device drift over time.

To use them, you start JACK as normal. Then you start an instance of
`alsa_in` or alsa_out for each additional device (and "direction") that
you want to use.  `alsa_out` will create a set of ports representing the
playback capabilities of the device, and `alsa_in` will represent the
capture/recording capabilities. These two clients must be run inside a
terminal window - there is no GUI for either of them. They both take
arguments very much like those of the JACK ALSA backend, with some
additional controls that affect the way that resampling is done. Full
details are available in the man pages for each client, which you can
read in a terminal window with the command `man alsa_in` (this page
covers both clients, since their arguments are identical).

Note that you can use these clients even if you are running JACK with a
FFADO- supported device. The requirement for ALSA support only applies
to the extra devices you want to use, not the one that JACK itself is
using.

### 2. Use the JACK2 audio adapter(s) (Jack2 only)

If your system has an integrated sound card and you want add two other usb sound card  one alternative you can chose is to start jackd as usual with the integrated soundcard and then load the audioadapter client plugin for the two additional sound cards.
Using the audio adapter client plugin (insted of alsa_in/alsa_out) avoids creating a new process for each additional device (and "direction"), since the audioadapter client will be loaded in the jackd process-space.

For example, if the two usb sound cards are of the same model, when they are plugged-in the system assigns them the names Audio (to the first inserted) and Audio_1 (to the second inserted). You can verify the names by issuing the command:
```shell
$ ls -l /proc/asound/
total 0
lrwxrwxrwx  1 root root 5 apr  2 09:18 Audio -> card1        # link to my first usb sound card
lrwxrwxrwx  1 root root 5 apr  2 09:18 Audio_1 -> card2      # link to my first usb sound card
dr-xr-xr-x 21 root root 0 apr  1 15:36 card0                 # my integrated sound card
dr-xr-xr-x  9 root root 0 apr  2 09:17 card1                 # my first usb sound card
dr-xr-xr-x  9 root root 0 apr  2 09:18 card2                 # my second usb sound card
-r--r--r--  1 root root 0 apr  1 15:36 cards                 # all soundcards in the system
-r--r--r--  1 root root 0 apr  1 15:48 devices
-r--r--r--  1 root root 0 apr  1 15:48 hwdep
-r--r--r--  1 root root 0 apr  1 15:48 modules
dr-xr-xr-x  4 root root 0 apr  1 15:48 oss
lrwxrwxrwx  1 root root 5 apr  1 15:48 PCH -> card0          # link to my integrated sound card
-r--r--r--  1 root root 0 apr  1 15:48 pcm
dr-xr-xr-x  6 root root 0 apr  1 15:48 seq
-r--r--r--  1 root root 0 apr  1 15:48 timers
-r--r--r--  1 root root 0 apr  1 15:48 version
```
or better:
```shell
$ cat /proc/asound/cards
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xb2428000 irq 140
 1 [Audio          ]: USB-Audio - USB Audio
                      Bluetrum USB Audio at usb-0000:00:14.0-1, full speed
 2 [Audio_1        ]: USB-Audio - USB Audio
                      Bluetrum USB Audio at usb-0000:00:14.0-2.4, full speed
```
In the above scenario, the commands to use to load the audioadapter clients for new usb sound cards (after jackd has already been started) are:

```
  $ jack_load myUsbSoundcard_0 audioadapter -i "-i 1 -o 2 -D -p 256 -n 2 -dalsa -dhw:Audio   -r 48000"
  $ jack_load myUsbSoundcard_1 audioadapter -i "-i 1 -o 2 -D -p 256 -n 2 -dalsa -dhw:Audio_1 -r 48000"
```
where
  - ``myUsbSoundcard_0`` and ``myUsbSoundcard_1`` are the names you will see in the qjackctl graph (they must be unique names in the jackd process space);
  - ``audioadapter`` (audioadapter.so) is the "so-name" of the "client module" to load in the jackd process space
  - the quoted options after the first ``-i`` are similar to jackd options

**If you use ``qjackctl``** to start jackd (possibly enabling JACK D-Bus interface), you can launch jack_load automatically:

go to Setup->Option tab, check "Execute script after startup" and write the commands to launch directly in the text-box. Using this method, in the textbox you can automatically get some options parameters from the main instance of jackd; for example:

 - ``%p`` will expand to the Frames/Period
 - ``%n`` will expand to the Periods/Buffer
 - ``%d`` will expand to the driver (for example alsa)
 - ``%r`` will expand to the sampling rate

The commands to write in the textbox could be (the two command are in the same line separated by ';' ):
```shell
jack_load myUsbSoundcard_0 audioadapter -i "-i 1 -o 2 -D -p %p -n %n -d%d -dhw:Audio -r %r" ; jack_load myUsbSoundcard_1 audioadapter -i "-i 1 -o 2 -D -p %p -n %n -d%d -dhw:Audio_1 -r %r"
```

### 3. Using OS facilities to merge devices into a single pseudo-device

Both OS X and Linux provide ways to configure your machine so that it
appears to have a new audio device that is actually a combination of one
or more real devices. You can use this approach to create the
configuration you want to use and then start up JACK using that new
"pseudo" device.

#### OS X

**You must perform these steps as a user with administrative
priviledges**.  The first thing to do is to open up Applications ->
Utilities -> Audio/MIDI Setup.  Go to the main menu bar, click on Audio
and then select Open aggregate device editor. Follow the simple
instructions to add each desired playback or capture device to your new
aggregate device.  Then pick a name for the new device. This is the name
you will also use to choose the device for use with JACK.

Note that there are quite a few subtle bugs with Apple's "aggregate
device" facilities. Various things can happen that will cause the device
to lose all of its playback channels or all of its capture channels, for
example. If this happens, it is generally necessary to close all
applications that are using any audio devices, and quite often a reboot
is required.

Starting with JACK2 version 1.9.6, the CoreAudio backend can now
dynamically create "aggregate devices" when needed (like when the -C and
-P arguments are used to specify the separated input and output
devices).

#### Linux

You will need to use a text editor to create or add to your
`~/.asoundrc` file.  This file is read by any ALSA application
(including JACK, if its using the ALSA backend) and can be used to
define pseudo-devices of many different kinds. The key idea here is that
you're going to define a new pseudo-device composed of 2 or more other
devices. In our example, we'll just focus on 2 devices being merged into
1, where both devices have just 2 channels in and out. This is the text
you need to make sure is in `~/.asoundrc` (below, we describe what this
does):



    pcm.merge {
        type multi;
        slaves.a.pcm hw:0
        slaves.a.channels 2;
        slaves.b.pcm hw:1
        slaves.b.channels 2;
        bindings.0.slave a;
        bindings.0.channel 0;
        bindings.1.slave b;
        bindings.1.channel 0;
        bindings.2.slave a;
        bindings.2.channel 1;
        bindings.3.slave b;
        bindings.3.channel 1;
    }


Lets see what this does.

* It defines a new audio pseudo-device called "merge".
  You can use this name anywhere you might use the name of an ALSA audio
  device, such as "hw:0" or "hw:HDA" or "hw:DSP" or "plughw:1".
* It names "hw:0" as the first component (or "slave") of this
  pseudo-device (slave.a.pcm) and "hw:1" as the second component
  (slave.b.pcm)
* It states that the pseudo-device will use 2 channels from the first
  component and 2 channels from the 2nd component.
* The lines contains `binding.` list, in order,
  which channel of which component will correspond to the 4 channels of
  the pseudo-device. In the mapping shown above, the first channel comes
  from the first component, then the 2nd channel from the 2nd component,
  the 3rd from the first component and the 4th from the second
  component.

Note that numbering of devices and channels in ALSA starts at zero, not
one.

The most important and complex part of the above definition is the
channel mappings defined by the `bindings` lines. A full channel mapping
definition consists of a pair of a lines of the following general form:



    	bindings.CHANNEL_OF_PSEUDO_DEVICE.slave SLAVE_DEVICE_THAT_WILL_PROVIDE_THIS_CHANNEL
    	bindings.CHANNEL_OF_PSEUDO_DEVICE.channel CHANNEL_OF_SLAVE_DEVICE_THAT_WILL_PROVIDE_THIS_CHANNEL


So the specific pair of lines:



        bindings.0.slave a;
        bindings.0.channel 0;


mean that "channel 0 of the pseudo-device will correspond to channel 0
of the first slave device". Obviously by playing with this definition
you can create all sorts of wierd and wonderful mappings from the real
physical device channels to the pseudo-device channels. You probably
don't want to do that, though. The example above shows the most common
example: take the first N channels from the first device, and the second
M channels from the second device.

### The Control Pseudo-device

In theory, the above is enough to define a new pseudo-device, but many
applications, including JACK's ALSA backend, also want to open a
"control device" associated with the audio playback device. This is
where they can find out (and possibly control) various hardware
parameters associated with the device. Unfortunately there is no way to
merge these together in the same way, so we have to provide a "dummy"
control device definition that will keep such applications happy. This
definition looks like this:



    ctl.merge {
        type hw
        card 0
    }


Notice that name following the `ctl.` text **must** be the same as the
name following `pcm.` in the device definition above. The control device
definition we've given here effectively means "if you want to open the
control device associated with "merge", open the control device
associated with the first installed audio/MIDI device". This probably
isn't right of course - "merge" involves two cards - but it will
generally work just fine.

You can use this same approach to merge more than 2 devices - the
resulting `pcm._DEVICE-NAME_` specification will obviously include more
lines. You can also use different devices than we did above, where we
just used the first and second installed card.

### "Slave" Device naming

Note that you are likely better off using "hw:CARD" device names, rather
than "hw:N" names, when defining a "multi" pseudo-device, as explained
[here](device_naming.html). But further note that if you are using
multiple instances of the same type of audio hardware (say, 4 RME
Multiface devices), you will have to use "hw:N" because every card will
have the same "CARD" name. In fact, with such hardware, it may be very
difficult to ensure that "hw:0" always refers to the same audio
interface, because there is no ALSA name that uniquely defines a
particular PCI slot. This is currently an unsolved problem when using
multiple identical devices. If you use PCI (or PCIe or PCIx or other
derivatives of PCI) devices, the chances are that the first card will
always be the same one, and so forth, so its not likely to be an issue.
If you use several identical USB devices, it may be a more significant
problem.

### 4. Using the -P and -C arguments to a JACK backend

Several JACK backends, including the ALSA, FFADO and CoreAudio versions,
support the -P and -C arguments that can be used to specify two
different devices, one for playback and one for capture/recording. You
cannot use this to merge multiple devices for playback or capture. This
approach will not do any clock drift correction, so as the two devices
drift over time, you may get glitches in the audio stream. Nevertheless,
it can be an easy if unreliable way to set up JACK so that, for example,
it records from a USB microphone and plays back via a builtin audio
device.

When using `-P` or `-C` to specify different devices, do not use the
`-d`
argument (which specifies a single device) and do not use the `-D`
argument (which tells JACK to configure a device for playback &
capture).

