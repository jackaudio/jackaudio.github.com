---
title: "JACK2 v1.9.15 release and current status"
author: "falkTX"
date: "2020-10-15T13:29:50+0100"
---
A new version of JACK2 has just been released.<br/>
You can grab the latest release source code at
<https://github.com/jackaudio/jack2/releases>.

This version of JACK2 brings back binary builds for macOS and Windows.<br/>
You can grab the latest pre-built installers at
<https://github.com/jackaudio/jack2-releases/releases>.

A few notes about the new installers:

- This is the author's first time on doing such installers, there might be some small oddities
- If you have old JACK2 installations on macOS or Windows, please uninstall those first (they are not 100% compatible)
- JackRouter is not included, as it does not work on macOS 10.15 and can be problematic on Windows.  
New maintainers welcome! Existing code moved to separate [jack-router] repository.
- macOS 11 (the new arm64 "apple-sillicon") is not supported at the moment
- Report any issues to jack2 repository (the jack2-releases repository is for automated builds only)

The official changelog is:

- Automated builds for macOS and Windows (see [jackaudio/jack2-releases] repository)
- Adapt wscript Windows build configuration to match old v1.9.11 installer
- Bump maximum default number of clients and ports (now 256 clients and 2048 ports)
- Delete various macOS and Windows-related files from the source code (no longer relevant)
- Mark JACK-Session as deprecated, please use NSM instead
- Remove unnecessary GPL include from LGPL code
- Split example-clients and tools, as done in JACK1 many years ago (WIP)
- Write Windows registry key during installation, so 3rd parties can find jackd.exe (as HKLM\\Software\\JACK\\Location)
- jack_control: Fix handling of dbus bytes
- jack_control: Return a proper exit status on DBus exception
- jack_property: Fix possible crash with "-l" argument usage
- jack_wait: Add client name option -n/--name
- Fix compilation of documentation
- Fix compilation of mixed mode with meta-data enabled
- Fix compilation with mingw
- Fix client-side crash if initial meta-data DB setup fails
- Fix macOS semaphore usage, so it works again
- Several fixes for Windows (with contributions from Kjetil S. Matheussen)
- Several minor fixes and grammar corrections (with contributions from Adam Miartus and Timo Wischer)

This release is a nice good step towards what was planned back in 2017 with the v1.9.12 release.<br/>
JACK1 remains in bug-fix mode, while JACK2 is slowly incorporating changes from it.<br/>
The examples and tools directory was split in the same way that JACK1 is,
so that in the future we can use those as submodules instead of having duplicated code between JACK versions.<br/>
Once we have matching headers, examples and tools we can begin the switch.<br/>
If you are reading this and want to help, pull requests for syncing those repositories code to what JACK2 has will be greatly appreciated!

For those that missed it, JACK-Session has been marked as deprecated. Please use "New Session Manager" instead.<br/>
You can find more about the project [here].
This includes links to the source code, bug/issue tracker and documentation.

For the future, short-term plan is to continue the feature parity between JACK1 and JACK2.<br/>
We are pretty much there now besides JACK2 missing the a2jmidi and zita internal clients (and the special options to use them).<br/>
Support for macOS arm64 is in progress, and there is a whole range of pull requests and issues to investigate and fix.<br/>
Focus will be on those before any features are even thought of, unless they serve to improve something.

[jack-router]: https://github.com/jackaudio/jack-router
[jackaudio/jack2-releases]: https://github.com/jackaudio/jack2-releases
[here]: https://linuxaudio.github.io/new-session-manager/
