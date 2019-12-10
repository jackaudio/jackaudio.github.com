---
title: "Metadata: order"
---

## JACK Metadata API: order

Order for a port.

This is used to specify the best order to show ports in user interfaces.
The value MUST be an integer.
There are no other requirements, so there may be gaps in the orders
for several ports.
Applications should compare the orders of ports to determine their relative order,
but must not assign any other relevance to order values.

It is encouraged to use <http://www.w3.org/2001/XMLSchema#int> as the type.
