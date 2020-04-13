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
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

