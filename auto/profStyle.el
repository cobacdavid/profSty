(TeX-add-style-hook
 "profStyle"
 (lambda ()
   (TeX-add-symbols
    "rheadTexte"
    "lfootTexte"
    "cfootTexte"
    "rfootTexte"
    "rheadCitation")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monblocnb" LaTeX-env-args ["argument"] 2)
    '("monblocb" LaTeX-env-args ["argument"] 2)
    '("monbloc" LaTeX-env-args ["argument"] 3))
   (LaTeX-add-lengths
    "longauteur"
    "hautmatiere"
    "longmatiere"
    "rfootYOff"
    "rheadXOff"
    "epaisTrait"))
 :latex)

