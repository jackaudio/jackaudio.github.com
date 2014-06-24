---
layout: page
title: "How do I make an application use JACK?"
---

# How do I make an application use JACK?

Your app must be callback-based. This means that you should not block on
writes or reads from a PCM device; rather, you should have your app be
"driven" by a function that gets called at regular intervals. This is a design
decision. Then, take a look at the simple client code, and do your interesting
stuff inside the process() function.

Note that code written for any callback API can generally be ported to any
other callback API fairly easily. Code that is written around a "blocking I/O"
model generally needs to completely redesigned to be used in any kind of
callback API.

### Linking with JACK

JACK uses pkg-config. Find a package for your favorite distribution and OS, or
build it from source. To build your JACK program, try

    
    
    $ gcc -o myprog `pkg-config --cflags --libs jack` myprog.c
    

Most build systems worth using have builtin ways to integrate pkg-config with
your build scripts.

