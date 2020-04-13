(TeX-add-style-hook
 "profTypo"
 (lambda ()
   (TeX-add-symbols
    '("titrepoly" 2)
    '("nombre" 1)
    "np"
    "dfrac"
    "degres"
    "text"
    "og"
    "fg"
    "ieme"
    "ier"
    "iere"
    "no"
    "RRoman")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

