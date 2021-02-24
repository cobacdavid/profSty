(TeX-add-style-hook
 "profC"
 (lambda ()
   (TeX-add-symbols
    '("fichierc" 1)
    "clang")
   (LaTeX-add-environments
    "codec")
   (LaTeX-add-lengths
    "clangLogoSize"))
 :latex)

