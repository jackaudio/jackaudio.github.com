---
layout: page
title: "How does using Linux with RT_GROUP_SCHED enabled affect JACK?"
---

# How does using Linux with RT_GROUP_SCHED enabled affect JACK?

Recently, Linux distributions have been released that use a kernel that has
the option RT_GROUP_SCHED enabled. This has the potential to wreak havoc on
applications that want to use realtime scheduling, but need not do so. If you
have followed the [instructions on setting up RT scheduling
access](linux_rt_config.html) and you
still cannot start JACK with realtime scheduling, you should read this
[detailed page on RT_GROUP_SCHED](http://trac.jackaudio.org/wiki/Cgroups). We are leaving the page in the Wiki for
now, because the situation may be fluid and its easier for people with the
relevant knowledge to update it there.

Note that we provide this information mostly as a matter of record - we do not
intend that individual users should need to grapple with CGroup configuration,
but distributions should try to take care of this so as not to make using JACK
with realtime scheduling effectively impossible for their users.

