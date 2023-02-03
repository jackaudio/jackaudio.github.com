---
title: "jack-example-tools release 4"
author: "falkTX"
date: "2023-02-03T22:01:37+0100"
---
A new release of the new [jack-example-tools](https://github.com/jackaudio/jack-example-tools) project is out.  
This is version 4 which only contains bugfixes, and should now build on BSD systems as-is.

Changelog:

- Fix a typo in `alsa_in` manpage
- Fix source-code comments and manpage for `jack_simple_client`
- Remove includes of non-standard `alloca.h` header

As noted in the previous releases, please be aware that the JACK2 project has now stopped shipping with similar tools (as in, have them built-in).  
See the [original jack-example-tools announcement](https://jackaudio.org/news/2022/01/15/jack-example-tools-release-1.html) for details.
