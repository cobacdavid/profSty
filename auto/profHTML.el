(TeX-add-style-hook
 "profHTML"
 (lambda ()
   (TeX-add-symbols
    '("fichierhtml" 1))
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)
    "codehtml")
   (LaTeX-add-lengths
    "htmlLogoSize"))
 :latex)

