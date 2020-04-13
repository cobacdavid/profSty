(TeX-add-style-hook
 "profPython"
 (lambda ()
   (TeX-add-symbols
    '("fichierpython" 1)
    "python")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)
    "codepython")
   (LaTeX-add-lengths
    "pythonLogoSize"))
 :latex)

