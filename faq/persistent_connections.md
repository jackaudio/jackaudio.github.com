---
layout: page
title: "How can I set up persistent connections?"
---

# How can I set up persistent connections?

Sometimes you want a JACK setup where every time you start a particular
application ("client") it gets reconnected to the same ports. JACK by itself
doesn't offer this capability, and most clients don't either but there are a
number of ways of accomplishing the goal.

The semi-automatic, script-based one is described in another FAQ.

A completely automatic graphical approach is the QJackctl Patchbay, [lovingly
described by its creator](http://www.rncbc.org/drupal/node/76). Please note that the Patchbay is **not** the same
as the QJackctl Connections dialog. There is comment on the Patchbay page that
[describes the differences in depth](http://www.rncbc.org/drupal/node/76#comment-1743).

Finally, there is fully blown session management (still to be documented)

