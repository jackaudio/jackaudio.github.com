---
title: "New Session Manager v1.6.0"
author: "nils"
date: "2022-04-15T11:00:13+0100"
---
This is a [New Session Manager](https://github.com/jackaudio/new-session-manager) feature release.

CHANGELOG

### nsmd - The daemon itself
* Now follows the XDG Base Directory Specifications.
   * Default session directory moved from `~/NSM Sessions/` to `$XDG_DATA_HOME/nsm/` (see issue #gh-15)
   * The old path `~/NSM Sessions/` is still supported and has priority, for now. This may be switched off in the future.
* Lockfiles fixed (see issue #gh-31)
    * Lockfiles are now in `$XDG_RUNTIME_DIR/nsm/`
    * Lockfiles now each contain the session path, the osc `NSM_URL` and the nsmd PID
    * One daemon file for each currently running nsmd is created in `$XDG_RUNTIME_DIR/nsm/d/` containing the osc url. This enables discovery of running daemons.
* New section in the API documentation for the above.
* Handle write-protected session files and related errors on save. They will not crash the daemon anymore.
* Fixes and guards against trying to load non-existing sessions and creating new sessions under existing names
* Handle various crashes-on-exit and replace them with controlled exits.

### Jackpatch Version 1.0.0 (previously 0.2.0)
* Jackpatch will finally not "forget" connections anymore! See #gh-74
* Add a jackpatch desktop file with `X-NSM-Capable=true` and `X-NSM-Exec=nsm-proxy` and `NoDisplay=true`
* Reduce verbosity level of log ouput.
* Document 'hidden' standalone (no NSM) command line mode in `--help`
* Handle SIGNALs even when in standalone mode

### NSM-Proxy
* Add a nsm-proxy desktop file with `X-NSM-Capable=true` and `X-NSM-Exec=nsm-proxy` and `NoDisplay=true`

All changes are made only on the server side, or in the tools we provide.  
Existing sessions, clients, and GUIs remain 100% compatible without requiring any changes.  
Except if you want to use the new session root directory, which is recommended.
