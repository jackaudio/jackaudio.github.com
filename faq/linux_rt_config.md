---
layout: page
title: "How do I configure my linux system to allow JACK to use realtime scheduling?"
---

# How do I configure my linux system to allow JACK to use realtime scheduling?

Realtime (RT) scheduling is a feature of all Linux operating systems that
enables an application to meet timing deadlines more reliably. Almost all
Linux distributions consider RT scheduling to be a potential source of system
abuse, and so access to it is limited to varying degrees. As mentioned in the 
[FAQ](realtime_vs_realtime_kernel.html), it is very important to understand that **you do NOT need
an "RT kernel" to use RT scheduling** (this is a very common misconception.)

JACK requires real time (RT) scheduling privileges for reliable, dropout-free
operation. Modern versions of JACK request RT scheduling by default, though it
can be disabled with the -r option. Older versions require the -R option to
request RT scheduling. If your system is not setup correctly, then JACK will
print a message like when it tries to run with RT scheduling (it will appear
in the messages window of QJackctl if you use that to start JACK):

    
    
    cannot use real-time scheduling (FIFO at priority 10) ... (1: Operation not permitted)
    

Some distributions configure everything so that any user can use RT scheduling
with absolutely no work at all. This is great, when it happens. However, many
if not most Linux distributions do not allow applications run by ordinary
users to request RT scheduling by default. Some distributions' JACK packages
will configure things more or less correctly for you, but in almost every
case, some work is required.

Distributions that are known to get this completely right include:

  * AVLinux 
  * 64Studio  These distributions have JACK packages that will create and configure a group with the required priviledges for RT scheduling, but will not add you to that group. 
  * Debian Squeeze 
  * Fedora 13 and later 
  * Ubuntu 10.4 and later  Unfortunately, on these systems you will need to determine which group name is used, and then skip to step 2 (reading carefully). 

Ultimately, the only way to find out if your system is configured properly is
to run JACK with RT scheduling and see if it works.

## This may not work!

If you follow all these steps carefully and they do not work, you should
review the information over [here](linux_group_sched.html) and consider whether this may apply to
your system.

## Systems using PAM

PAM (Pluggable Authentication Modules) are used by almost all modern Linux
distributions nowadays to handle various tasks related to granting a user
permission to do something (e.g. to login). If your system has PAM, it will
also have a file called `/etc/security/limits.conf` and/or a directory called
`/etc/security/limits.d.

You need to carry out 3 steps to be able to run JACK with RT scheduling. In
what follows, several references are made to the "realtime" group. If this
group name already exists, pick a different name and use it instead of
"realtime" when following the rest of these instructions. The actual name of
the group is completely irrelevant.

### 1. Editing the configuration file

If your system has no directory called `/etc/security/limits.d` then you will
need to edit `/etc/security/limits.conf`. If `/etc/security/limits.d` does
exist on your machine, then you will need to create and edit a file called
`/etc/security/limits.d/99-realtime.conf`. The file must contain (at least)
the following two lines:

    
    
    @realtime   -  rtprio     99
    @realtime   -  memlock    unlimited
    

Contrary to a lot of misinformation on the web, there is no reason to include
a line here that provides enhanced "niceness" control, which is completely
irrelevant for realtime scheduling and low latency audio applications.

### 2. Creating a "realtime" group

**As the super-user ("root")** run the following commands from a terminal window: 
    
    
    groupadd realtime
    usermod -a -G realtime yourUserID
    

You should substitute your actual user id or "login" for "yourUserID".

If you prefer, you can carry out these two steps using the graphical tools
that are available under the "System Adminstration" section of your desktop's
main menu, but this text-based method is faster and much easier to explain.

If you are using a distribution that has already created the group and
configured the "limits" file, you will need to determine the name of the group
(it is likely called "audio" or "jackuser") and then you can just add yourself
to the group with this command (run as the superuser inside a terminal
window):

    
    
    usermod -a -G theGroupName yourUserId
    

substituting the real names for `theGroupName` and `yourUserId`

### 3. Logout and back in

None of the changes you have made above will have any effect until you logout
and back in. You do not need to reboot your system or reinstall any software.

