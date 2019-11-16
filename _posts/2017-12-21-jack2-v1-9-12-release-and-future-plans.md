---
title: "JACK2 v1.9.12 release and future plans"
date: 2017-12-21
author: falkTX
categories: news
---
A few days ago a new version of JACK2 was released.<br/>
You can grab the latest release source code at
<https://github.com/jackaudio/jack2/releases>.<br/>
The official changelog is:

- Fix Windows build issues
- Fix build with gcc 7
- Show hint when DBus device reservation fails
- Add support for internal session files

If you did not know already, I am now maintaining JACK2 (and also JACK1).<br/>
So this latest release was brought to you by yours truly. ;)

The release was actually already tagged on the git repo quite some time ago,
but I was waiting to see if Windows builds were possible.<br/>
I got side-tracked with other things and 1.9.12 ended up not being released for
some time, until someone reminded me of it again... :)<br/>
There are still no updated macOS or Windows builds, but I did not want to delay
the release further because of it.<br/>
The 1.9.11 release (without RC label) was skipped to avoid confusion with the
versions.<br/>
So 1.9.12 is the latest release as of today. macOS and Windows binaries still
use an older 1.9.11 version.

Being the maintainer of both JACK1 and JACK2 means I can (more or less)
decide the future of JACK.<br/>
I believe a lot of people are interested to know the current plan.<br/>

First, JACK1 is in bug-fix mode only.<br/>
I want to keep it as the go-to reference implementation of JACK,
but not add any new features to it.<br/>
The reason for this is to try to get JACK1 and JACK2
to share as much code as possible.<br/>
Currently JACK2 includes its own copy of JACK headers, examples and utilities,
while JACK1 uses sub-repositories.<br/>
During the course of next year (that is, 2018) I want to get JACK2 to slowly use
the same stuff JACK1 does, then switch to use the same repositories
as submodules like JACK1 does.<br/>
This will reduce the differences between the 2 implementations, and make it
a lot easier to contribute to the examples and utilities provided by JACK.<br/>
(Not to mention the confusion caused by having utilities that work in simlar yet
different ways)<br/>
We will keep JACK1 "frozen" until this is all done.<br/>

Second, but not least important, is to get the JACK1 specific features into JACK2.<br/>
A few things were added into JACK1 after JACk2 was created,
that never made it into JACK2.<br/>
This includes meta-data (JACK2 does have the API, but a non-functional one)
and the new internal clients.<br/>
The purpose is to reduce reasons users might have to switch/decide between
JACK1 and JACK2.<br/>
JACK2 should have all features that JACK1 has, so that most users choose JACK2.

Now, you are probably getting the impression that the focus will be on JACK2,
which is correct.<br/>
Though I realize some developers might prefer JACK1's design, the long "battle"
of JACK1 and JACK2 needs to stop.<br/>
Development of new features will happen in the JACK2 codebase,
and JACK1 will slowly become legacy.<br/>
Well, this is my personal plan at least.<br/>

Not sure if this all can be done in 2018, but better to take things slowly
and get things done than do nothing at all.<br/>
I will keep you updated on the progress through-out the year.<br/>
Happy holidays everyone!
