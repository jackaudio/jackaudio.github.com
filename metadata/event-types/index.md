---
title: "Metadata: event-types"
---

## JACK Metadata API: event-types

This is a kludge around Jack only supporting MIDI, particularly for OSC.
This property is a comma-separated list of event types, currently "MIDI" or "OSC".
If this contains "OSC", the port may carry OSC bundles (first byte '#')
or OSC messages (first byte '/').
Note that the "status byte" of both OSC events is not a valid MIDI status byte,
so MIDI clients that check the status byte will gracefully ignore OSC messages
if the user makes an inappropriate connection.
