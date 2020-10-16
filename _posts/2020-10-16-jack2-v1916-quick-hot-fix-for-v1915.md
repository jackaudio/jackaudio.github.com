---
title: "JACK2 v1.9.16 quick hot-fix (for v1.9.15)"
author: "falkTX"
date: "2020-10-16T20:22:53+0100"
---
An issue was found on the last JACK2 release that caused a few applications to crash on start.<br/>
This is a quick hot-fix for that release. If you are running v1.9.15, please update.

Because of a new release being needed, we took the chance to remove the jack-router Windows code,
 as it now belongs [in its own repository].<br/>
These two items are the full release.

You can grab the latest release source code at
<https://github.com/jackaudio/jack2/releases>.

You can also grab the latest pre-built installers for macOS and Windows at
<https://github.com/jackaudio/jack2-releases/releases>.<br/>
On other systems, ask your jack2 package maintainer to update to the latest release.

[in its own repository]: https://github.com/jackaudio/jack-router
