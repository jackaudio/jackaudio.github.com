---
title: "Using JACK on Windows"
---

# Using JACK on Windows

## Introduction

As on other platforms, JACK on Windows is a multi-purpose audio server that
connects audio and MIDI streams using the Windows system drivers.
It connects (OUTPUT) to those audio drivers using the PortAudio project
(so JACK can connect using dsound, wmme, ASIO, etc) depending on what
the soundcard's drivers support.

JACK provides an Audio, MIDI and transport API (Application Programming Interface)
that can be used natively by audio application developers.
There are already some existing *native* JACK Windows applications
(that is, audio applications that use the JACK API directly).
Through the API, JACK on Windows offers native JACK connections (INPUT),
and the JACK-Router ASIO driver (INPUT) that offers an ASIO linker to the JACK Server.

So any ASIO application will be able to use the JACK-Router ASIO driver to
connect to JACK, and JACK can then be used to route that audio to other
applications connected to the JACK Server, or out to the system sound device.

Several applications have native JACK support:

  * [Ardour](https://ardour.org/)
  * [Bitwig Studio](https://www.bitwig.com/)
  * [Carla Plugin Host](https://kx.studio/Applications:Carla)
  * [Foo YC20](https://github.com/sampov2/foo-yc20)
  * [Harisson MixBus](https://harrisonconsoles.com/product/mixbus/)
  * [LMMS](https://lmms.io/) (starting from v1.3)
  * [MuseScore](http://musescore.org/)
  * [Radium](http://users.notam02.no/~kjetism/radium/)
  * [Zrythm](https://www.zrythm.org/en/)

Native JACK applications can make use of the full power of the JACK audio and
MIDI connection system (for instance, they can open or close JACK connections
from within the application, rather than having to set an ASIO driver to use
use JACK-Router).
Also, the use of natively provided JACK ports provides the ability to sync
audio streams between applications.

The JACK-Router ASIO driver is "only" there so that users are able to use ASIO
applications in the Windows context of JACK, but this connection obviously has
some limitations that native applications won't have.

JACK uses a 'Server <-> Client' architecture to supply the audio connection
between your sound device and the ASIO application(s).
When the JACK Server is running, the JACK-Router driver is then able to create
connections between clients (ASIO applications) and the JACK Server.
These connections can be seen in the QjackCtl -> Graph screen.

If the JACK Server is not running, then JACK-Router will not be available to
your ASIO application(s), and an error report may be shown.

By default, JACK-Router is set to provide 4 Input and 4 Output connections.
This setting can be customized to suite your needs by editing the
JackRouter.ini file within your
`C:\Program Files\JACK\jack-router\win32` (or `C:\Program Files\JACK\jack-router\win64`
folder depending of the JACK 32 or 64-bit version).
In Windows Explorer, right click on the file and choose the 'Edit' option.
Change the settings in the [IO] portion of the file.

## Installation and Configuration

1. Download the JACK2 installer for Windows from the [download page.](/downloads/)

2. Use the installer. Either the 32-bit or the 64-bit one (which still allows 32-bit clients).

3. Pick "Full installation (with JACK-Router)" during installation.

4. From the Windows Start menu, locate the QjackCtl application and run it.

5. On the QjackCtl application, click "Setup" and adjust "Interface", "Sample Rate" and "Frames/Period" as needed for your device/sound-card.
  Do not change settings you do not understand.

6. Click on OK to close the Setup dialog.

8. Click on "Start" to start the JACK Server with the parameters you just set up.

When the JACK Server is running the JACK-Router ASIO interface will be
available to all ASIO capable applications.

## Uninstalling JACK

Just open the "Programs and Features" in the Windows Control Panel and
remove "JACK2 version ..." from there.
This will uninstall the JACK Server, JACK-Router and QjackCtl.

## Connecting Audio Applications

1. Start the JACK Server using QjackCtl

2. With the Jack Audio Server started, the JackRouter ASIO driver
  will be available for your ASIO supported applications.

3. Within your audio application, select JACK-Router as the audio device.

4. Within QjackCtl, click the "Graph" button.

You can route the output of ASIO applications into the inputs of other ASIO
applications (like a VST host application), and then connect the audio output
of that application to your system output (or a combination of both).

Multiple channel audio is also supported, but may require more configuration
than the simple setup described here.
