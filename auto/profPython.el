(TeX-add-style-hook
 "profPython"
 (lambda ()
   (TeX-add-symbols
    '("vpythondirect" 1)
    '("vpython" 1)
    "python")
   (LaTeX-add-environments
    '("monblocencadre" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1))
   (LaTeX-add-lengths
    "pythonLogoSize"))
 :latex)

