---
layout: page
title:  "Metadata"
menu_item: false
---

# JACK Metadata API

A running instance of JACK involves three types of conceptual objects:

* Clients
* Ports
* Connections

The rest of this tutorial refers **ONLY** to the first two - connections are not currently covered by the metadata implementation even though the API theoretically covers them.

Each of these objects is typically referred to by its name, which typically provides some indication of what it is and/or what it could be used for.
But a single name is often not enough.
Consider a given pair of JACK ports. You may want to know that they correspond to the first two channels of your audio interface.
You might also like a reminder that they are connected to to your speakers. 
You might also want to somehow mark these two as the default ports that should be used when making connections.
A single name cannot perform this sort of multi-faceted role, but if we could add some additional data to each port, which other things could look up, then the goal becomes a lot easier.


# UUIDs

Before we can attach any additional data to an object, we must have a unique way of referring to the object. The names of ports can be changed, and JACK2 introduced the possibility of client name changes too. So using names isn't adequate.

JACK1 now creates a UUID (Universally Unique Identifier) for all objects. This identifier never changes during the object's existence, and is thus suitable for using when attaching additional data to the object. These identifiers are created automatically, and you have no control over them.


# Key/Value (you can forget Type)

Just attaching a random piece of data to an object isn't very useful - nothing will be able to do any kind of structured query to find out if the data is present or not.

All metadata in JACK consists of a pair of strings. One of them, the "key" identifies what type of information is represented by the other (the "value").
This allows us to ask of each object "Does this object have any value for `<key>`?" and get a meaningful answer.

The key part of a piece of metadata is just a string containing a URI.
The URI may or may not correspond to a URL - if it does, then an `HTTP GET` request to the URL should retrieve something that explains the meaning of the key and how to use it.
For example, [http://jackaudio.org/metadata/pretty-name](http://jackaudio.org/metadata/pretty-name) is a URI that also corresponds to a URL that describes what "pretty-name" data is and how to use it.

Both key and value are strings, but the value part could represent arbitrary different kinds of data - a name, an image, audio, anything basically.
We therefore provide an optional third component to each piece of metadata - a specification of the "type" of data represented by the value part. 
If it is empty, then the value is assumed to be just a normal (null-terminated) C string, useful for naming things in various ways. 
The type can also be any MIME type or any URI. If find a piece of metadata with a type that you cannot understand, you should ignore that metadata.

The [API documentation](https://jackaudio.org/api/group__Metadata.html) should be consulted for more details.

# What to do with metadata?

If we know the UUID of an object, we can do 3 things with metadata:

1. Add, or "define", a given piece of metadata for that UUID
2. Alter an existing piece of metadata for that UUID
3. Delete an existing piece of metadata for that UUID

The man page for `jack_property` shows how to use that tool to do any of these 3 tasks. Note that by default `jack_property` requires a UUID, but you can pass it an additional argument to allow you to use a port or client name instead of the UUID.

In addition to these three operations, we might be interested in knowing about changes to metadata. 
If so, a JACK client can register a "property change callback", which will be told about the UUID and key whenever a piece of metadata is created, altered or deleted. 
The API docs cover the details.

# Who does what?

At this time, the metadata API is still quite new, so there are not a lot of programs using it.
Most of the information that one might want in a metadata system is known only to the user anyway, which means that existing JACK clients can't really define much of it all by themselves.
Your DAW has no idea what your audio interface is connected to, or what the best names to display for the first two channels are, or where the best places to connect to in order to play audible material are.

However, `jack_property` can be used to do all these things (note that "all these things" only involves creating metadata, not actually using it for anything useful).

The script below shows a sample use of `jack_property` to define "pretty-name" metadata for all ports (and the backend) of a JACK system running on an RME HDSP device.

```bash
#!/bin/sh

#
# set up nice names for all the ports
#

for n in `seq 1 24` ; do
    jack_property -p -s system:playback_$n http://jackaudio.org/metadata/pretty-name "ADAT $n"
    jack_property -p -s system:capture_$n http://jackaudio.org/metadata/pretty-name "ADAT $n"
done
jack_property -p -s system:playback_25 http://jackaudio.org/metadata/pretty-name "S/PDIF L"
jack_property -p -s system:capture_25 http://jackaudio.org/metadata/pretty-name "S/PDIF L"
jack_property -p -s system:playback_26 http://jackaudio.org/metadata/pretty-name "S/PDIF R"
jack_property -p -s system:capture_26 http://jackaudio.org/metadata/pretty-name "S/PDIF R"

# and now the driver itself

jack_property -c -s system http://jackaudio.org/metadata/pretty-name "RME HDSP"

exit 0
```

At the time of writing, `jack_property`, `patchage` and `qjackctl` allow to display port + client "pretty-names" if the user chooses to do so (it falls back to the current regular names if there is no metadata for a given object).

`jack_lsp` can also be used to display port and client UUIDs - see the man page for details.
