(TeX-add-style-hook
 "profNSI"
 (lambda ()
   (TeX-add-symbols
    '("nsiEnteteB" 2)
    '("nsiEntete" 2))
   (LaTeX-add-environments
    "nsiEnonce"))
 :latex)

