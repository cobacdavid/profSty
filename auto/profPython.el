(TeX-add-style-hook
 "profPython"
 (lambda ()
   (TeX-add-symbols
    '("fichierpython" 1)
    "python")
   (LaTeX-add-environments
    "codepython")
   (LaTeX-add-lengths
    "pythonLogoSize"))
 :latex)

