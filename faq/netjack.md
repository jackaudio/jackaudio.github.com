---
layout: page
title: "How do I use JACK over a network?"
---

# How do I use JACK over a network?

Before we move onto answering the question "How do I use JACK over a
network?", we must first deal with one of the unfortunate ugly realities of
the open source world: choice. There have been several efforts to provide
JACK-over-a-network:

netJACK1, also known as "netone"     Designed and implemented primarily by
Torben Hohn, this is the most widely used JACK-over-a-network system. Exists
for Linux, OS X and Windows. Can be run with and without data compression.
netJACK2     Designed and implemented primarily by Romain Moret at GRAME.
Exists for Linux, OS X and Windows. No data compression. jack.trip
Designed and implemented by the Soundwire group at CCRMA at Stanford
University. Exists for Linux, and OS X. No synchronization, variable data
compression.

The most important thing to realize about each of these alternatives is that
they are all _mutually incompatible_. You cannot run netJACK2 on one machine
and netJACK1 on another, or any other combination. Both "ends" of the network
link must be using the same software: netJACK1, netJACK2 or jack.trip. Each
system has some qualititative differences from the others:

## netJACK1

netJACK1 was originally designed to allow JACK to distribute audio across a
high bandwidth local area network. Later, it was modified to allow it to use
the CELT codec for data compression, thus allow use across a wide area network
with less bandwidth (and more latency and possible data loss). It uses a
master/slave design in which a single machine runs a JACK server that is
connectved to sound card (the "master") and any number of other machines
function as slaves.

## netJACK2

Like netJACK1, netJACK2 was primarily focused on allowing JACK to distribute
audio across a high bandwidth local area network. However, it has the
additional property of having a "discovery" system so that both of the ends of
the connection can find each other more or less automatically. When
discovered, each slave appears as a new in-server JACK client. It has no way
to use data compression for use in wide area networks, and cannot tolerate
packet loss. It uses the same master/slave design as netJACK1.

## jack.trip

jack.trip was originally created for streaming relatively large numbers of
channels across a high bandwidth wide area network. It has been used multiple
times to stream 16-24 channels of uncompressed audio across Internet2 (a high
bandwidth "version" of the internet generally only accessible to universities
and research institutions). It doesn't care too much about relatively high
latency (say, 100msec) which makes it very useful for some purposes, and not
for others. It doesn't try to provide synchronization between the two ends of
the link, and instead resamples to keep things reasonably aligned.
Fundamentally, it just connects two independent JACK servers running on
separate machines rather than using the master/slave design of netJACK1/2.

