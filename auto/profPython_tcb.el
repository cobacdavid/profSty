(TeX-add-style-hook
 "profPython_tcb"
 (lambda ()
   (TeX-add-symbols
    '("vjscript" 1)
    '("vcss" 1)
    '("vueSite" 1)
    '("vhtml" 1)
    '("vpython" 1)
    "python")
   (LaTeX-add-environments
    "pythondirect"
    "htmldirect"
    "jscriptdirect")
   (LaTeX-add-lengths
    "pythonLogoSize"
    "htmlLogoSize"
    "cssLogoSize"
    "javascriptLogoSize"))
 :latex)

