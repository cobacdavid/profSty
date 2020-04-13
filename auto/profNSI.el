(TeX-add-style-hook
 "profNSI"
 (lambda ()
   (TeX-add-symbols
    '("nsiEntete" 2))
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

