(TeX-add-style-hook
 "profCouleurs"
 (lambda ()
   (TeX-add-symbols
    "pybleu"
    "pyjaune"
    "macouleur"
    "gris"
    "blanc"
    "noir"
    "maCouleurGradBegin")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monblocnb" LaTeX-env-args ["argument"] 2)
    '("monblocb" LaTeX-env-args ["argument"] 2)
    '("monbloc" LaTeX-env-args ["argument"] 3)))
 :latex)

