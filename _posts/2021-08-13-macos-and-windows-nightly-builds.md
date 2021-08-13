---
title: "macOS and Windows nightly builds"
author: "falkTX"
date: "2021-08-13T17:21:54+0100"
---
Just a small heads up to mention that macOS and Windows nightly builds are now available for JACK2.

You can find them in the [JACK2 GitHub actions] section, each successful build will have matching artifacts.  
When you open a pull request, builds will be automatically generated.  
(pending approval from JACK2 maintainers, but there is typically no reason not to approve)

These artifacts include macOS-intel, macOS-universal, Ubuntu 20.04, Windows 32bit and Windows 64bit builds.  
Note that neither QjackCtl or JACK-Router are included in these builds, only JACK.

[JACK2 GitHub actions]: https://github.com/jackaudio/jack2/actions
