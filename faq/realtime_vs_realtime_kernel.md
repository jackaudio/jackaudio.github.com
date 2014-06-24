---
layout: page
title: "Do I need a realtime kernel to use realtime scheduling?"
---

# Do I need a realtime kernel to use realtime scheduling?

No. Realtime scheduling is available on all Linux systems no matter what
kernel they use, and current versions of JACK use it by default. A kernel
built with the realtime patches (an "RT kernel") is needed only if:

  * You want to run JACK with very low latency settings that require realtime performance that can only be achieved with an RT kernel 
  * Your hardware configuration triggers poor latency behaviour which might be improved with an RT kernel 

Most users do not need an RT kernel in order to use JACK, and most will be
happy using settings that are effective without an RT kernel.

