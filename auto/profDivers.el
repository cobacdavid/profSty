(TeX-add-style-hook
 "profDivers"
 (lambda ()
   (TeX-add-symbols
    '("remplir" 2)
    '("repete" 2)
    '("vueSite" 1)
    "impression"
    "pointiles"
    "pointilles"
    "pointillles"
    "pointilllles"
    "pointillllles"
    "pointilllllles")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1))
   (LaTeX-add-counters
    "nbrep"
    "nbfois"))
 :latex)

