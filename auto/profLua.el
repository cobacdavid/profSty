(TeX-add-style-hook
 "profLua"
 (lambda ()
   (TeX-add-symbols
    '("fichierlua" 1))
   (LaTeX-add-environments
    "codelua")
   (LaTeX-add-lengths
    "luaLogoSize"))
 :latex)

