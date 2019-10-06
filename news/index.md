---
layout: page
title:  "News"
menu_item: true
---

## JACK2 v1.9.13 release

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
    <a href="https://kx.studio/News/?action=view&amp;url=jack2-1912-release-and-future-plans" target="_blank">
        https://kx.studio/News/?action=view&amp;url=jack2-1912-release-and-future-plans
    </a>
    for more information.
</p>
