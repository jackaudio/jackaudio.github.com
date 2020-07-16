---
title: "JACK-Session has been marked as deprecated"
author: "falkTX"
date: "2020-07-16T13:01:11+0100"
---
A small heads-up for developers, JACK-Session API has now officially been marked as deprecated.

I have been working together with other members of linuxaudio community to get a better session-management API out there.
We previously had difficulties with this due to issues regarding the upstream project.
It was obvious to us that the NSM API is superior to all others that came before it (thanks to the initial hard work of its author, Jonathan),
but working with upstream has proven immensely difficult or even impossible..

As of a few weeks ago, a few members of the linuxaudio group decided to fork the original NSM project and make a new one.
The acronym remains, so we still call it "NSM", but the new project is now "New Session Manager" while the original is "Non Session Manager".
We are working together with the community to make this session-management API and tools the best as they can be.
(The original was a bit lacking on the user-experience side of things..)

You can find more about the "New Session Manager" project [here].
This includes links to the source code, bug/issue tracker and documentation.

Please give it a look, or better, a chance.
For now it is specific to POSIX systems like Linux and BSD, but it can be extended in the future.
If we manage to make (Audio) Session Management really work in Linux, that is already a big step up from other tools/APIs that came before it.

We recommend all JACK application developers to implement NSM in their software.
Thank you.

[here]: https://linuxaudio.github.io/new-session-manager/

