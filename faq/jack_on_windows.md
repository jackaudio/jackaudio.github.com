---
layout: page
title: "Using JACK on Windows"
---

# Using JACK on Windows

## Introduction

As on other platforms, JACK on Windows is a multi-purpose application that
connects audio and MIDI using the Windows system drivers... It connects
(OUTPUT) to those audio drivers using the PortAudio project (so Jack can
connect using dsound, wmme, WDMKS, ASIO, WASAPI, and WaveRT) depending on what
the soundcard's drivers support. Currently Jack for Windows only supports
32-bit applications, but a new version is currently being tested that supports
both 32-bit and 64-bit audio applications. If you are working with 64-bit
applications then contact the Jack Developers list for more information.

JACK is an Audio API (Application Programming Interface) that can be used
natively by audio application developers. There are already some existing
*native* JACK for Windows applications (that is audio applications that use
the JACK API directly). Through the API, Jack for Windows offers native Jack
connections (INPUT), and the JackRouter ASIO driver (INPUT) that offers an
ASIO linker to the Jack Audio Server.

So any ASIO application will be able to use the JackRouter ASIO linker to
connect to Jack, and Jack can then be used to route that audio to other
applications connected to the Jack Audio Server, or out to the system sound
device.

Several applications have native Jack support:

  * Harisson MixBus : [http://www.harrisonconsoles.com/mixbus/website/](http://www.harrisonconsoles.com/mixbus/website/)
  * MuseScore : [http://musescore.org/](http://musescore.org/)
  * foo-yc20 : [http://code.google.com/p/foo-yc20/](http://code.google.com/p/foo-yc20/)
  * SND-RT : [http://archive.notam02.no/arkiv/doc/snd-rt/](http://archive.notam02.no/arkiv/doc/snd-rt/)
  * Radium : [http://users.notam02.no/~kjetism/radium/](http://users.notam02.no/~kjetism/radium/)
  * Fluidsynth for Windows (part of the jOrgan Windows packages). 
  * JNAJack, Java bindings for JACK : [https://code.google.com/p/java-audio-utils/wiki/GettingStarted_JNAJack](https://code.google.com/p/java-audio-utils/wiki/GettingStarted_JNAJack)

Native Jack applications can make use of the full power of the JACK audio and
MIDI connection system (for instance, they can open or close Jack connections
from within the application, rather than having to set an ASIO driver to use
use JackRouter), also, the use of natively provided Jack ports provides the
ability to sync audio streams between applications.

The JackRouter ASIO driver is "only" there so that users are able to use ASIO
applications in the Windows context of JACK, but this connection obviously has
some limitations that native applications won't have.

Jack uses a 'Server <-> Client' architecture to supply the audio connection
between your sound device and the ASIO application(s). When you run Jack
PortAudio, this starts the Jack Audio Server. Once the Jack Audio Server is
running, the JackRouter driver is then able to create connections between
clients (ASIO applications) and the Jack Audio Server. These connections can
be seen in the Jack Control -> Connect Screen.

If the Jack Audio Server is not running, then JackRouter will not be available
to your ASIO application(s), and an error report may be shown.

Starting from 1.9.8 version, the installer exists in two versions:

* A pure 32 bit version to be used with older systems (typically XP). 
* A mixed 64/32 bit version that will allow 64 and 32 bit applications to be used at the same time with a running 64 bit JACK server. 

By default, JackRouter is set to provide 4 Input and 4 Output connections.
This setting can be customized to suite your needs by editing the
JackRouter.ini file within your C:\Program Files\Jack\32bits (or C:\Program
Files\Jack\64bits folder depending of the JackRouter 32 or 64 bit version). In
Windows Explorer, right click on the file and choose the 'Edit' option. Change
the settings in the [IO] portion of the file.

## Installation and Configuration

  1. Download the Jack Audio Connection installer for Windows from the [download
  page.](/downloads/)
  2. Use the installer (either the 32 bit or the mixed 64/32 bit one). 
  3. From the Windows Start menu, locate the Jack folder and right click on Jack Portaudio icon, then select 'Send to Desktop' (this will place a shortcut on your desktop) 
  4. Now go to your desktop and right click on the Jack PortAudio shortcut, and then select 'Properties' (use right click to open 'Properties') 
  5. Add the following information to the 'Target' property: "C:\Program Files\Jack\jackd.exe" -R -S -d portaudio -d "ASIO::ASIO4ALL v2" [This configures Jack to use the ASIO4ALL v2 driver, if you have another ASIO device then configure the 'Target' property with that device name. For a list of all the audio devices on your system that Jack can connect to, open a Command Prompt, change directory to the Jack folder (i.e. cd "c:\Program Files (x86)\Jack\") then run this command: jackd -d portaudio -l (that's an 'ell' for List, not a 'one') , this will present you with the list of supported devices.] 
  6. Click on OK. 
  7. Again, from the Windows Start menu, locate the Jack folder and right click on the Jack Control icon, then select 'Send to Desktop' (placing a Jack Control shortcut on your desktop) 

You will now have the Jack PortAudio icon (which starts the Jack Audio
Connection Kit's audio server), and the Jack Control icon (which allows you to
configure the connections between ASIO programs and your hardware). The
sequence of usage is to start with the Jack PortAudio icon, allow the audio
server to start, and then start Jack Control.

When the Jack Audio Server is running (i.e. your Jack PortAudio command prompt
window reports that Jack is starting and remains open), the JackRouter ASIO
interface will be available to all ASIO capable applications.

For an overview of the command line options supported by the Jack Audio Server
please see: [http://ccrma.stanford.edu/planetccrma/man/man1/jackd.1.html](http://ccrma.stanford.edu/planetccrma/man/man1/jackd.1.html)

The Jack v 1.9.8/64bits/JackRouter.dll still has to be registered "manually"
with regsvr32 - so please try the following command to register the 64-bit
JackRouter:

regsvr32 "C:\Program Files (x86)\Jack v1.9.8\64bits\JackRouter.dll"

Be sure to unregister previous versions before installing the new one.

Troubleshooting Tip. If you are unable to register the 64-bit JackRouter,
while in Windows Explorer navigate to \windows\system32, and right click on
"cmd.exe" and chose "Run As Administrator" from the context menu. The open a
command prompt, navigated to \Program Files (x86)\Jack v1.9.8\64bits, and then
enter regsvr32 JackRouter.dll at the prompt.

## Uninstalling JACK

Use the provided uninstaller to install JACK from your machine. Note that
because the 64-bit JackRouter had to be manually registered as described
before, you'll have to unregister it as well. Use the following command to
unregister the 64-bit JackRouter:

regsvr32 /u "C:\Program Files (x86)\Jack v1.9.8\64bits\JackRouter.dll"

## Connecting Audio Applications

  1. Start Jack PortAudio 
  2. Make sure that the Jack Audio Server is running by checking the command prompt window for the report that will say something like this: 
    
    
    jackdmp 1.9.8
    Copyright 2001-2005 Paul Davis and others.
    Copyright 2004-2011 Grame.
    jackdmp comes with ABSOLUTELY NO WARRANTY
    This is free software, and you are welcome to redistribute it
    under certain conditions; see the file COPYING for details
    JACK server starting in realtime mode with priority 10
    Cannot lock down memory area (No error)
    

  3. With the Jack Audio Server started, the JackRouter ASIO driver will be available for your ASIO supported applications. 
  4. Within your audio application, select JackRouter as the audio device. 
  5. Now start Jack Control 
  6. Click on the Connect button 
  7. In the Audio tab window, on the left hand side you will see the Readable Clients (audio inputs to your computer) and Application Output ports (audio being routed into the Jack Audio Server via the JackRouter ASIO driver), and on the right hand side you will see the Writable Clients (audio outputs from your computer, i.e. your speaker ports) and Application Input ports (the ASIO audio-in ports from your applications configured with the JackRouter ASIO driver) 
  8. To route the sound from your application to your speakers, click on the audio producing port (Readable) on the left hand side, then click on the audio output port (Writable i.e. system), and then click on the Connect button. 

You can route the output of ASIO applications into the inputs of other ASIO
applications (like a VST host application), and then connect the audio output
of that application to your system output (or a combination of both).

Multiple channel audio is also supported, but may require more configuration
than the simple setup described here.

## Using MIDI

A slave backend using the Windows MME MIDI API can be used. You will need to
add "-X winmme" in the JACK command line, like for example: "jackd -S -X
winmme -d portaudio". This can be done if starting JACK in a terminal, or by
adding the "-X winmme" in the "Server Path" in QJackCtl setup.

