---
layout: page
title:  "Downloads"
menu_item: true
---
# Downloading JACK

## Linux

### JACK1:

  * **Binaries**: please use your distribution's package manager (`apt-get, yum, synaptic` etc.) 
  * **Source (jackaudio.org)**: [JACK 0.121.3](http://jackaudio.org/downloads/jack-audio-connection-kit-0.121.3.tar.gz) source tarball. 

### JACK2:

  * **Binaries**: please use your distribution's package manager (`apt-get, yum, synaptic` etc.) 
  * **Source **: [ JACK 1.9.9 ](http://jackaudio.org/downloads/jack-1.9.9.5.tar.bz2) source tarball. 

## OS X

### JACK1:

  * **Source (jackaudio.org)**: [JACK 0.121.3](http://jackaudio.org/downloads/jack-audio-connection-kit-0.121.3.tar.gz) source tarball. 

### JACK2:

  * **Binaries**: [Mixed 64/32 bit, v0.89 of JackOSX (compatible with current JACK API to 0.120.1) for Snow Leopard](http://sourceforge.net/projects/jackosx/files/JackOSX/0.89/JackOSX.0.89_64-32bits.zip/download)
  * **Binaries**: [Legacy 32 bit, v0.89 of JackOSX (compatible with current JACK API to 0.120.1) for systems older than Snow Leopard](http://sourceforge.net/projects/jackosx/files/JackOSX/0.89/JackOSX.0.89_32bits.zip/download)
  * **Source**: [ JACK 1.9.8](http://jackaudio.org/downloads/jack-1.9.8.tgz) source tarball. 

## Windows

### JACK2:

  * **Installer for 32 bit Windows(XP...)**: [ JACK 1.9.10](https://dl.dropboxusercontent.com/u/28869550/Jack_v1.9.10_32_setup.exe). 
  * **Installer for Windows 64 bit (Vista, Windows 7)**: [ JACK 1.9.10](https://dl.dropboxusercontent.com/u/28869550/Jack_v1.9.10_64_setup.exe). 

## Solaris/OpenSolaris

### JACK2:

  * **Source**: [ JACK 1.9.9](http://jackaudio.org/downloads/jack-1.9.9.5.tar.bz2) source tarball. 

Please note that although we bump the minor version rather frequently in the
development repository, releases will not occur for every version number
change.

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

    
    [https://github.com/jackaudio/jack1](https://github.com/jackaudio/jack1)
    

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

    
    [https://github.com/jackaudio/jack2](https://github.com/jackaudio/jack2)
    

to be able to browse current source code and full history with all the usual
Github goodies.

#### Write Access

Those who have been granted write access and have supplied a public key can
get to the repository with the following command:

    
    git clone git@github.com:jackaudio/jack2.git
    

Eventually the same setup for the submodules will be required as for Jack1,
but this is not true at this time.
