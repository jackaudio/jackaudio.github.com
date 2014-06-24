---
layout: page
title: "How do I build JACK from the source code?"
---

# How do I build JACK from the source code?

### Important Caveats

There can be a variety of reasons to want to build, install and use a source
code version of JACK. However, it is **vitally important** that you **NEVER
EVER** have two versions of JACK installed on a machine at the same time. If
you have an existing installation of JACK (for example, from a Linux
distribution) then you must either

  * remove it (this may not be possible) 
  * install the source version "on top" of the existing one 
Failure to do this will more or less guarantee that JACK will no longer work
on your machine.

### (For Linux only) tmpfs file system

JACK's performance on Linux is much improved if it can use a "tmpfs" (shared
memory) file system for certain purposes. Specifically, it will try to use a
tmpfs filesystem mounted on /dev/shm by default. You can test if you have this
already by running the following command in a terminal:

    
    
    mount | grep shm
    

If it generates any output, you are all set. Most modern Linux systems will be
this way. If yours is not then we are going to assume that you know what you
are doing and understand how to set up a new tmpfs filesystem and how to tell
JACK to use it.

### For JACK1

Note that if you are installing JACK "on top" of an existing version, you need
to add `--prefix /usr` or similar to the ./configure command, to ensure that
the install step will overwrite the existing version. By default these
commands will install JACK to /usr/local/bin whereas any system-installed
version will likely exist in /usr/bin.

    
    
    ./configure
    make
    make install
    

If you are using JACK from svn, you will need to run `sh ./autogen.sh` before
the configure step.

### For JACK2

Note that if you are installing JACK "on top" of an existing version, you need
to add `--prefix /usr` or similar to the ./waf configure command, to ensure
that the install step will overwrite the existing version. By default these
commands will install JACK to /usr/local/bin whereas any system-installed
version will likely exist in /usr/bin.

    
    
    ./waf configure
    ./waf
    ./waf install
    

