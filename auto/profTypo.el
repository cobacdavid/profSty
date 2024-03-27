(TeX-add-style-hook
 "profTypo"
 (lambda ()
   (TeX-add-symbols
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
    '("monblocnb" LaTeX-env-args ["argument"] 2)
    '("monblocb" LaTeX-env-args ["argument"] 2)
    '("monbloc" LaTeX-env-args ["argument"] 3)))
 :latex)

