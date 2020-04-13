(TeX-add-style-hook
 "profCSS"
 (lambda ()
   (TeX-add-symbols
    '("fichiercss" 1))
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)
    "codecss")
   (LaTeX-add-lengths
    "cssLogoSize"))
 :latex)

