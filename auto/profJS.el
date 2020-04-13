(TeX-add-style-hook
 "profJS"
 (lambda ()
   (TeX-add-symbols
    '("vjscript" 1)
    '("fichierjavascript" 1))
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)
    "codejavascript"
    "jscriptdirect")
   (LaTeX-add-lengths
    "javascriptLogoSize"))
 :latex)

