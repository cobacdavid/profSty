(TeX-add-style-hook
 "profAlgo"
 (lambda ()
   (TeX-add-symbols
    '("titrealgo" 1)
    "geogebra"
    "lua")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

