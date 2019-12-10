---
title: "Metadata: signal-type"
---

## JACK Metadata API: signal-type

The type of an audio signal.

This property allows audio ports to be tagged with a "meaning".
The value is a simple string.
Currently, the only type is "CV", for "control voltage" ports.
Hosts SHOULD be take care to not treat CV ports as audibile
nd send their output directly to speakers.
In particular, CV ports are not necessarily periodic at all and may have very high DC.
