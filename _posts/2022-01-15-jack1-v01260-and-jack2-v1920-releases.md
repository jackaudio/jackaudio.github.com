---
title: "JACK1 v0.126.0 and JACK2 v1.9.20 releases"
author: "falkTX"
date: "2022-01-15T16:57:14+0000"
---
New versions of both JACK1 and JACK2 have just been released.<br/>
You can grab the latest JACK1 release source code at
<https://github.com/jackaudio/jack1/releases> and JACK2 at
<https://github.com/jackaudio/jack2/releases> with macOS/Windows installers at
<https://github.com/jackaudio/jack2-releases/releases>.

This set of releases focuses on the move of JACK examples and tools into a new
[jack-example-tools](https://github.com/jackaudio/jack-example-tools) repository.
On JACK1's side these tools have been completely removed, while in JACK2 their build is optional
(they are still built/enabled by default for now).  
The plan is for them to not be built by default on the next JACK2 release, and afterwards being removed from JACK2 source code.
JACK2 macOS and Windows installers will always ship with these tools, regardless of where their source code lives.

Additionally, Florian Walpen (aka "0EVSG") has joined the developer team, becoming maintainer of FreeBSD related things.
Thanks to him this JACK2 release brings official FreeBSD support.

On JACK1 side, the release is just tagging for the removal of the now external tools.  
JACK1 still continues in maintainance mode, we do not recommend its use.
Its release is purely to avoid conflicts with the recent developments.

The official JACK2 changelog is:
* Add waf autooption `--example-tools` to allow optional build of executables, libraries and man pages provided by
[jack-example-tools](https://github.com/jackaudio/jack-example-tools) (the files are built by default).
Building and installing the additional files can be disabled by using `--example-tools=no` or `--no-example-tools`.
* Fix 32-bit support in ALSA driver
* Fix incomplete ASIO support on Windows
* Fix metadata usage with multiple users
* Fix netsource tool missing on Windows
* Fix semaphore usage on macOS
* Official FreeBSD support

External changes, related to macOS/Windows installer:
* Update Qt5 used in macOS/Windows installers to 5.12.12
* Update QjackCtl used in macOS/Windows installers to 0.9.6
