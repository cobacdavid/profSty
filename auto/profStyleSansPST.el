(TeX-add-style-hook
 "profStyleSansPST"
 (lambda ()
   (TeX-add-symbols
    '("sgnde" 1)
    '("varde" 1)
    '("ie" 3)
    '("dm" 3)
    '("ds" 3)
    '("devoir" 4)
    '("titrepoly" 2)
    '("encadrepointilles" 1)
    "rheadTexte"
    "lfootTexte"
    "cfootTexte"
    "rfootTexte"
    "rheadCitation"
    "nom"
    "sgnduq"
    "sgndup")
   (LaTeX-add-environments
    "exercice"
    "exerciceh"
    "nival")
   (LaTeX-add-counters
    "numeroexo")
   (LaTeX-add-lengths
    "longauteur"
    "hautmatiere"
    "longmatiere"
    "rfootYOff"
    "rheadXOff"
    "epaisTrait"
    "citationXOff"
    "citationYOff"
    "hautcitation"
    "etirement"
    "htex"
    "lgex"))
 :latex)

