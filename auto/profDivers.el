(TeX-add-style-hook
 "profDivers"
 (lambda ()
   (TeX-add-symbols
    '("titrepolysarah" 1)
    '("titrepolydeux" 1)
    '("remplir" 2)
    '("repete" 2)
    "randnbtitre"
    "impression"
    "pointiles"
    "pointilles"
    "pointillles"
    "pointilllles"
    "pointillllles"
    "pointilllllles"
    "RRoman")
   (LaTeX-add-environments
    '("monblocencadre" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1))
   (LaTeX-add-counters
    "nbrep"
    "nbfois")
   (LaTeX-add-lengths
    "reste"))
 :latex)

