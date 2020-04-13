(TeX-add-style-hook
 "profAideMemoire"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("prof" "a4")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "prof")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

