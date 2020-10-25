(TeX-add-style-hook
 "profNSI"
 (lambda ()
   (TeX-add-symbols
    '("nsiEntete" 2))
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monblocnb" LaTeX-env-args ["argument"] 2)
    '("monblocb" LaTeX-env-args ["argument"] 2)
    '("monbloc" LaTeX-env-args ["argument"] 3)))
 :latex)

