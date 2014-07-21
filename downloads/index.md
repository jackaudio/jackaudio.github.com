---
layout: page
title:  "Downloads"
menu_item: true
jack1_source : "http://jackaudio.org/downloads/jack-audio-connection-kit-0.124.1.tar.gz"
jack1_source_v: "0.124.1"
jack2_source : "https://dl.dropboxusercontent.com/u/28869550/jack-1.9.10.tar.bz2"
jack2_source_v: "1.9.10"
jack2_osx_version: "0.90"
jack2_osx_x32: "https://dl.dropboxusercontent.com/u/28869550/JackOSX.0.90_32bits.zip"
jack2_osx_mixed: "https://dl.dropboxusercontent.com/u/28869550/JackOSX.0.90.zip"
---
# Downloading JACK

## Linux

### JACK1:

  * **Binaries**: please use your distribution's package manager  
   (`apt-get, yum, synaptic` etc.)

  * **Source tarball**: [JACK {{page.jack1_source_v}}]({{page.jack1_source}}). 

### JACK2:

  * **Binaries**: please use your distribution's package manager  
  (`apt-get, yum, synaptic` etc.) 
  * **Source tarball**: [ JACK {{page.jack2_source_v}}]({{page.jack2_source}}). 

## OS X

### JACK1:

  * **Source tarball**: [JACK {{page.jack1_source_v}}]({{page.jack1_source}}). 

### JACK2:

  * **Binaries**: [Mixed 64/32 bit, {{page.jack2_osx_version}} of JackOSX for Snow Leopard]
  ({{page.jack2_osx_mixed}})
  * **Binaries**: [Legacy 32 bit, {{page.jack2_osx_version}} of JackOSX for systems older than Snow Leopard]
  ({{page.jack2_osx_x32}})
  * **Source tarball**: [ JACK {{page.jack2_source_v}}]({{page.jack2_source}}). 

## Windows

### JACK2:

  * **Installer for 32 bit Windows(XP...)**: [ JACK 1.9.10](https://dl.dropboxusercontent.com/u/28869550/Jack_v1.9.10_32_setup.exe). 
  * **Installer for Windows 64 bit (Vista, Windows 7)**: [ JACK 1.9.10](https://dl.dropboxusercontent.com/u/28869550/Jack_v1.9.10_64_setup.exe). 
  * **Source tarball**: [ JACK {{page.jack2_source_v}}]({{page.jack2_source}}). 

## JACK Source Code Repository

JACK uses Git as its source control system. Our central git repository is
hosted by Github. We are currently working toward linking the repositories for
Jack1 and Jack2 but this work is not complete, so for now the commands to get
a copy of the source are a little different depending on which tree/version
you want.

### Jack1 Git Repository

Those without write access can access the repository with these commands:

    
    git clone git://github.com/jackaudio/jack1.git
    cd jack1
    git submodule init
    git submodule update
    

You can also point a web browser at

    
    https://github.com/jackaudio/jack1
    

to be able to browse current source code and full history with all the usual
Github goodies.

#### Write Access

Those who have been granted write access and have supplied a public key can
clone the repository with the following commands:

    
    git clone git@github.com:jackaudio/jack1.git
    cd jack1
    git submodule init
    git submodule update
    

You must then edit the `.git/config` file within jack1 so that the submodule
entries correctly reference the write-access URL. They should look like this:

    
    [submodule "example-clients"]
    	url = git://github.com/jackaudio/example-clients.git
    [submodule "jack"]
    	url = git://github.com/jackaudio/headers.git
    [submodule "tools"]
    	url = git://github.com/jackaudio/tools.git
    

### Jack2 Git Repository

Those without write access can access the repository with this command:

    
    git clone git://github.com/jackaudio/jack2.git
    

You can also point a web browser at

    
    https://github.com/jackaudio/jack2
    

to be able to browse current source code and full history with all the usual
Github goodies.

#### Write Access

Those who have been granted write access and have supplied a public key can
get to the repository with the following command:

    
    git clone git@github.com:jackaudio/jack2.git
    

Eventually the same setup for the submodules will be required as for Jack1,
but this is not true at this time.
