---
layout: page
title: "How can I route audio from xmms/audacious/beep to JACK?"
---

# How can I route audio from xmms/audacious/beep to JACK?

The xmms family of audio players is one of the oldest on the Linux platform,
and is still a rather nice program to use for certain purposes. xmms evolved
into beep which then evolved into audacious, but despite these multiple
versions there is a nice, very functional plugin for all of them that will
connect it to JACK. The instructions below refer to audacious but the steps
are the same for any version of xmms/beep/audacious.

  1. Install the audacious plugin for JACK. The name of the package that contains this will vary depending on which Linux distribution you are using. On Fedora, its called `audacious-plugins-jack`. On Ubuntu, its called `audacious-plugins`. It might already be installed on your system. 
  2. Start audacious. Click on the upper-right button to bring up the "main menu" and then click on "Preferences" 
  3. Make sure you are looking at the "Audio" tab 
  4. Select "JACK Output Plugin " from the "Current Output Selector" at the top. 
  5. The default operation of the plugin is to connect its two outputs to the first two physical JACK outputs it can find. If you would prefer that it remain disconnected by default, or connect to all available ports (!), click on the "Output Plugin Preferences" button just below to make your choice. 
  6. That's it! 

