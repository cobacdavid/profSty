(TeX-add-style-hook
 "profStyle"
 (lambda ()
   (TeX-add-symbols
    "rheadTexte"
    "lfootTexte"
    "cfootTexte"
    "rfootTexte")
   (LaTeX-add-lengths
    "longauteur"
    "hautmatiere"
    "longmatiere"
    "rfootYOff"
    "rheadXOff"
    "epaisTrait"))
 :latex)

