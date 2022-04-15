---
title: "jack-example-tools release 2"
author: "falkTX"
date: "2022-04-15T10:54:42+0100"
---
A new release of the new [jack-example-tools](https://github.com/jackaudio/jack-example-tools) project is out.  
This is version 2 which only contains bugfixes.

Changelog:

- Fix crashes in `midi_latency_test`
- Fix regression in `alsa_in` that broke resampling (reverted code to known good state)
- Fix usage help string in `midiseq`

Please note that the JACK2 project is only going to ship with similar tools (as in, have them built-in) for 1 more release.  
See the [original jack-example-tools announcement](https://jackaudio.org/news/2022/01/15/jack-example-tools-release-1.html) for details.
