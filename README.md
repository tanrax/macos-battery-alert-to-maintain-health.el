MacOS alert if the battery exceeds certain percentage charge limits to maintain health.

**Emacs Lisp 100.0%**

# Run

``` shell
emacs --no-init-file --no-site-file --script macos-battery-alert-to-maintain-health.el
```

# Cron

Automates to check every 10 minutes.

Open `crontab`.

``` shell
crontab -e
```

Add the following line. Be sure to change the path of the script.

``` shell
*/6 * * * * emacs --no-init-file --no-site-file --script macos-battery-alert-to-maintain-health.el
```
