---
layout: page
title:  "News"
menu_item: true
---

## Past, Present and Future of the JACK Audio Connection Kit (in video form)

<h6>On <i>2019-11-14</i> by <i>falkTX</i></h6>

<p>
    A few weeks ago I did a talk/presentation at <a href="https://www.sonoj.org/" target="_blank">Sonoj</a>,
      regarding the past, present and future of the JACK.<br/>
    This talk was live-streamed and recorded, and now Sonoj videos are online, so you can watch this at
      <a href="https://media.ccc.de/v/sonoj2019-1902-jack-past-present-future" target="_blank">https://media.ccc.de/v/sonoj2019-1902-jack-past-present-future</a>.
</p>

## Meta-data pages restored

<h6>On <i>2019-10-12</i> by <i>falkTX</i></h6>

<p>
    Just a small heads up to mention that meta-data related pages
      like <a href="https://jackaudio.org/metadata/"> https://jackaudio.org/metadata </a>
      and <a href="https://jackaudio.org/metadata/pretty-name/"> https://jackaudio.org/metadata/pretty-name </a>
    have now been restored.
</p>

## JACK2 v1.9.13 release

<h6>On <i>2019-10-06</i> by <i>falkTX</i></h6>

<p>
    A new version of JACK2 has just been released.<br/>
    You can grab the latest release source code at
        <a href="https://github.com/jackaudio/jack2/releases" target="_blank">
            https://github.com/jackaudio/jack2/releases</a>.<br/>
    The official changelog is:<br/>
</p>
<ul>
    <li>Meta-data API implementation. (and a few tools updated with support for it)</li>
    <li>Correct GPL licence to LGPL for files needed to build libjack.</li>
    <li>Remove FreeBoB backend (superseded by FFADO).</li>
    <li>define JACK_LIB_EXPORT, useful for internal clients.</li>
    <li>Mark jack_midi_reset_buffer as deprecated.</li>
    <li>Add example systemd unit file</li>
    <li>Signal to systemd when jackd is ready.</li>
    <li>Set "seq" alsa midi driver to maximum resolution possible.</li>
    <li>Fix loading internal clients from another internal client.</li>
    <li>Code cleanup and various fixes. (too many to mention here, see git log for details)</li>
</ul>
<p>
    This release is focused on meta-data support, and this is why it took so long.<br/>
    There might be odd cases here and there and a few bugs, as it is often the case for all software...<br/>
    So please make sure to report back any issues!<br/>
    <br style="line-height:0.5em"/>
    Special thanks goes to Rui Nuno Capela for the initial pull-request regarding meta-data.<br/>
    There was some work needed afterwards, but that was the biggest hurdle and motivation needed for a new release. :)
</p>
<p>
    There are still no updated macOS or Windows builds, those will be handled at a later date.<br/>
    Current plan is to have JACK1 feature-parity first (only a2jmidid and zita internal clients missing now),<br/>
    and afterwards merging examples/tools and header files to be shared between JACK1 and JACK2.<br/>
</p>
<p>
    The situation regarding development of JACK and JACK1 considered legacy has not changed since last release 2 years ago.<br/>
    See
    <a href="https://jackaudio.org/news/#jack2-v1912-release-and-future-plans">
        https://jackaudio.org/news/#jack2-v1912-release-and-future-plans
    </a>
    for more information.
</p>
<p>
    PS: I will be in Cologne for
    <a href="https://www.sonoj.org/" target="_blank">Sonoj</a>,
    giving a talk about "Past, Present and Future of JACK".<br/>
    There is no registration fee, so please feel free to come by and say hello! :)
</p>

## JACK2 v1.9.12 release and future plans

<h6>On <i>2017-12-21</i> by <i>falkTX</i></h6>

<p>
    A few days ago a new version of JACK2 was released.<br/>
    You can grab the latest release source code at
        <a href="https://github.com/jackaudio/jack2/releases" target="_blank">
            https://github.com/jackaudio/jack2/releases</a>.<br/>
    The official changelog is:<br/>
</p>
<ul>
    <li>Fix Windows build issues</li>
    <li>Fix build with gcc 7</li>
    <li>Show hint when DBus device reservation fails</li>
    <li>Add support for internal session files</li>
</ul>
<p>
    If you did not know already, I am now maintaining JACK2 (and also JACK1).<br/>
    So this latest release was brought to you by yours truly. ;)<br/>
</p>
<p>
    The release was actually already tagged on the git repo quite some time ago, but I was waiting to see if Windows builds were possible.<br/>
    I got side-tracked with other things and 1.9.12 ended up not being released for some time, until someone reminded me of it again... :)<br/>
    There are still no updated macOS or Windows builds, but I did not want to delay the release further because of it.<br/>
    The 1.9.11 release (without RC label) was skipped to avoid confusion with the versions.<br/>
    So 1.9.12 is the latest release as of today. macOS and Windows binaries still use an older 1.9.11 version.
</p>
<p>
    Being the maintainer of both JACK1 and JACK2 means I can (more or less) decide the future of JACK.<br/>
    I believe a lot of people are interested to know the current plan.<br/>
</p>
<p>
    First, JACK1 is in bug-fix mode only.<br/>
    I want to keep it as the go-to reference implementation of JACK, but not add any new features to it.<br/>
    The reason for this is to try to get JACK1 and JACK2 to share as much code as possible.<br/>
    Currently JACK2 includes its own copy of JACK headers, examples and utilities, while JACK1 uses sub-repositories.<br/>
    During the course of next year (that is, 2018) I want to get JACK2 to slowly use the same stuff JACK1 does, then switch to use the same repositories as submodules like JACK1 does.<br/>
    This will reduce the differences between the 2 implementations, and make it a lot easier to contribute to the examples and utilities provided by JACK.<br/>
    (Not to mention the confusion caused by having utilities that work in simlar yet different ways)<br/>
    We will keep JACK1 "frozen" until this is all done.<br/>
</p>
<p>
    Second, but not least important, is to get the JACK1 specific features into JACK2.<br/>
    A few things were added into JACK1 after JACk2 was created, that never made it into JACK2.<br/>
    This includes meta-data (JACK2 does have the API, but a non-functional one) and the new internal clients.<br/>
    The purpose is to reduce reasons users might have to switch/decide between JACK1 and JACK2.<br/>
    JACK2 should have all features that JACK1 has, so that most users choose JACK2.<br/>
</p>
<p>
    Now, you are probably getting the impression that the focus will be on JACK2, which is correct.<br/>
    Though I realize some developers might prefer JACK1's design, the long "battle" of JACK1 and JACK2 needs to stop.<br/>
    Development of new features will happen in the JACK2 codebase, and JACK1 will slowly become legacy.<br/>
    Well, this is my personal plan at least.<br/>
</p>
<p>
    Not sure if this all can be done in 2018, but better to take things slowly and get things done than do nothing at all.<br/>
    I will keep you updated on the progress through-out the year.<br/>
    Happy holidays everyone!<br/>
</p>
