;; Imports
(require 'subr-x)  ; string-trim

;; Variables
(setq max-check-capacity 80)
(setq max-capacity-message "Very high")
(setq min-check-capacity 45)
(setq min-capacity-message "Too low")
(setq battery-info (split-string (shell-command-to-string "/usr/sbin/ioreg -rc AppleSmartBattery") "\n"))

;; Functions
(defun get-value (key)
  (let (raw-line)
    (setq raw-line (car (seq-filter (lambda (line) (string-match (regexp-quote key) line)) battery-info)))
    (string-trim (car (last (split-string raw-line "="))))))

(defun send-alert (message)
  (shell-command (concat "osascript -e 'display notification \"" message "\" with title \"Battery health\" sound name \"Blow\"'")))

;; Get info battery
(setq is-charging (equal (get-value "IsCharging") "Yes"))
(setq current-capacity (float (string-to-number (get-value "CurrentCapacity"))))
(setq max-capacity (float (string-to-number (get-value "MaxCapacity"))))
(setq battery-current-percentage (ceiling (* 100 (/ current-capacity max-capacity))))

;; Logics

;; Send message under Min
(when (and (< battery-current-percentage min-check-capacity) (not is-charging)) (send-alert min-capacity-message))

;; Send message over Max
(when (and (> battery-current-percentage max-check-capacity) is-charging) (send-alert max-capacity-message))
