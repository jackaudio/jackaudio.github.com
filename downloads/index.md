---
title:  "Downloads"
---
# Downloading JACK

## Linux

* **Binaries**: please use your distribution's package manager
(`apt-get, yum, synaptic` etc.)
* **Source tarball**: [JACK 1.9.15].

## OS X

* **Installer**:      [JACK 1.9.15 macOS].
* **Source tarball**: [JACK 1.9.15].

## Windows

* **32-bit installer**: [JACK 1.9.15 win32].
* **64-bit installer**: [JACK 1.9.15 win64].
* **Source tarball**:   [JACK 1.9.15].

## JACK Source Code Repository

JACK uses Git as its source control system. Our central git repository is
hosted by Github. We are currently working toward linking the repositories for
JACK1 and JACK2 but this work is not complete, so for now the commands to get
a copy of the source are a little different depending on which tree/version
you want.

### JACK1 Git Repository

Those without write access can access the repository with these commands:

```
git clone git://github.com/jackaudio/jack1.git
cd jack1
git submodule init
git submodule update
```

You can also point a web browser at

```
https://github.com/jackaudio/jack1
```

to be able to browse current source code and full history with all the usual
Github goodies.

#### Write Access

Those who have been granted write access and have supplied a public key can
clone the repository with the following commands:

```
git clone git@github.com:jackaudio/jack1.git
cd jack1
git submodule init
git submodule update
```

You must then edit the `.git/config` file within jack1 so that the submodule
entries correctly reference the write-access URL. They should look like this:

```
[submodule "example-clients"]
    url = git://github.com/jackaudio/example-clients.git
[submodule "jack"]
    url = git://github.com/jackaudio/headers.git
[submodule "tools"]
    url = git://github.com/jackaudio/tools.git
```

### JACK2 Git Repository

Those without write access can access the repository with this command:

```
git clone git://github.com/jackaudio/jack2.git
```

You can also point a web browser at

```
https://github.com/jackaudio/jack2
```

to be able to browse current source code and full history with all the usual
Github goodies.

#### Write Access

Those who have been granted write access and have supplied a public key can
get to the repository with the following command:

```
git clone git@github.com:jackaudio/jack2.git
```

Eventually the same setup for the submodules will be required as for JACK1,
but this is not true at this time.


[JACK 1.9.15]:       https://github.com/jackaudio/jack2/archive/v1.9.15.tar.gz
[JACK 1.9.15 macOS]: https://github.com/jackaudio/jack2-releases/releases/download/v1.9.15/jack2-macOS-v1.9.15.tar.gz
[JACK 1.9.15 win32]: https://github.com/jackaudio/jack2-releases/releases/download/v1.9.15/jack2-win32-v1.9.15.exe
[JACK 1.9.15 win64]: https://github.com/jackaudio/jack2-releases/releases/download/v1.9.15/jack2-win64-v1.9.15.exe
