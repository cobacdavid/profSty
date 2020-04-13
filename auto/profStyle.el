(TeX-add-style-hook
 "profStyle"
 (lambda ()
   (TeX-add-symbols
    "rheadTexte"
    "lfootTexte"
    "cfootTexte"
    "rfootTexte")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1))
   (LaTeX-add-lengths
    "longauteur"
    "hautmatiere"
    "longmatiere"
    "rfootYOff"
    "rheadXOff"
    "epaisTrait"))
 :latex)

