It is recommended that the ⚡️battery⚡️ of a device is between 45% and 80% to extend its life. This script alert if the battery exceeds certain percentage charge limits to maintain health. Only for MacOS.

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
