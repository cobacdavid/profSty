(TeX-add-style-hook
 "profPython"
 (lambda ()
   (TeX-add-symbols
    '("vcss" 1)
    '("vueSite" 1)
    '("vhtml" 1)
    '("vpython" 1)
    "python")
   (LaTeX-add-environments
    "pythondirect"
    "htmldirect")
   (LaTeX-add-lengths
    "pythonLogoSize"
    "htmlLogoSize"
    "cssLogoSize"))
 :latex)

