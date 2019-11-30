(TeX-add-style-hook
 "profPython"
 (lambda ()
   (TeX-add-symbols
    '("vpythondirect" 1)
    '("vpython" 1)
    "python")
   (LaTeX-add-lengths
    "pythonLogoSize"))
 :latex)

