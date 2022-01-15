---
title: "jack-example-tools release 1"
author: "falkTX"
date: "2022-01-15T17:40:48+0000"
---
After years of them seeing no changes, the JACK2 example clients and tools have finally been synced with JACK1.
We only needed [PipeWire](https://pipewire.org/) to come along and force us to do it. :)  
I mentioned the need to merge/sync the JACK1 and JACK2 headers and tools
[quite some months ago](https://jackaudio.org/news/2020/10/15/jack2-v1915-release-and-current-status.html),
but there wasn't much progress on that until very recently.

For an explanation, Linux distributions like Arch that do not typically split packages (hypothetically)
installing `pipewire-jack` would remove `jack2` and replace it with PipeWire's version.
But tools like `jack_connect`, `jack_wait`, etc are part of the `jack2` package, not `pipewire-jack`.
Installing `pipewire-jack` would (hypothetically) remove these tools.
There are quite a few set ups out there that rely on them, so a solution was needed for this.

David Runge started the effort of splitting these tools from the JACK repositories into a new one, and has now been finalized.
The idea here is that both JACK1 and JACK2 will no longer ship with them, and they become an extra set of tools to install separately.
This allows to switch between JACK versions (JACK1, JACK2 or PipeWire) and keep the same exact set of tools.

You can find these tools in the [jack-example-tools](https://github.com/jackaudio/jack-example-tools) repository.
