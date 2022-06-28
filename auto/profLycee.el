(TeX-add-style-hook
 "profLycee"
 (lambda ()
   (TeX-add-symbols
    '("sgnde" 1)
    '("varde" 1)
    '("dm" 3)
    '("ie" 3)
    '("ds" 3)
    '("titrepoly" 1)
    '("encadrepointilles" 1)
    "rheadTexte"
    "lfootTexte"
    "cfootTexte"
    "rfootTexte"
    "rheadCitation"
    "nom"
    "traitDegrade"
    "sgnduq"
    "sgndup")
   (LaTeX-add-environments
    "exercice"
    "exerciceseul"
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
    "lgex")
   (LaTeX-add-saveboxes
    "PSTBoxDroite"
    "gradruledg"
    "gradrulegd"
    "gradrulegdg"
    "devoirgradrulegdg"))
 :latex)

