;;; sketch-mode.el --- Sample major mode for editing Sketch -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2020, Geoff H uston


;; Author: Geoff Huston
;; Version: 0.0.1
;; Created: 26 Jun 2015
;; Keywords: languages
;; Package-Requires: ((emacs "24"))
;; Homepage: http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq sketch-font-lock-keywords
      (let* (
            ;; define several category of keywords
            (x-keywords '("implements" "assert" "return" "harness" "generator" "if" "pragma"))
            (x-types '("bit" "VOID"))
            (x-constants '("[A-Z]\\+"))
            ;; (x-events '("at_rot_target" "at_target" "attach"))
            ;; (x-functions '("llAbs" "llAcos" "llAddToLandBanList" "llAddToLandPassList"))

            ;; generate regex string for each category of keywords
            (x-keywords-regexp (regexp-opt x-keywords 'words))
            (x-types-regexp (regexp-opt x-types 'words))
            (x-constants-regexp (regexp-opt x-constants 'words))
            ;; (x-events-regexp (regexp-opt x-events 'words))
            ;; (x-functions-regexp (regexp-opt x-functions 'words)))
            )

        `(
          (,x-types-regexp . font-lock-type-face)
          ;; (,x-constants-regexp . font-lock-constant-face)
          ;; (,x-events-regexp . font-lock-builtin-face)
          ;; (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;;;###autoload
(define-derived-mode sketch-mode c++-mode "sketch mode"
  "Major mode for editing sketch"

  ;; code for syntax highlighting
  ;; (destructuring-bind ((a &rest b)) font-lock-default
  ;;   (setq font-lock-defaults (cons (append sketch-font-lock-keywords a) b))))
  (setq font-lock-defaults '((sketch-font-lock-keywords))))

;; add the mode to the `features' list
(provide 'sketch-mode)

(unless (rassoc 'sketch-mode auto-mode-alist)
  (add-to-list 'auto-mode-alist '("\\.skh\\?\\'" . sketch-mode)))

;;; sketch-mode.el ends here
