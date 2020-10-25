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
    "pointilllllles"
    "pointillllllles"
    "pointilllllllles")
   (LaTeX-add-counters
    "nbrep"
    "nbfois"))
 :latex)

