(TeX-add-style-hook
 "profJS"
 (lambda ()
   (TeX-add-symbols
    '("vjscript" 1)
    '("fichierjavascript" 1)
    "javascript")
   (LaTeX-add-environments
    "codejavascript"
    "jscriptdirect")
   (LaTeX-add-lengths
    "javascriptLogoSize"))
 :latex)

