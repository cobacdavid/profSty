(TeX-add-style-hook
 "prof"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontspec" "no-math") ("inputenc" "utf8") ("xcolor" "rgb" "dvipsnames" "svgnames" "luatex") ("algorithm2e" "french" "onelanguage") ("mdframed" "tikz") ("tcolorbox" "many") ("hyperref" "unicode=true") ("babel" "frenchb" "english") ("numprint" "autolanguage")))
   (TeX-run-style-hooks
    "random"
    "geometry"
    "graphicx"
    "amsmath"
    "amssymb"
    "ifluatex"
    "xcolor"
    "fontspec"
    "luatexbase"
    "metalogo"
    "luacode"
    "luamplib"
    "unicode-math"
    "luatexperso"
    "inputenc"
    "aeguill"
    "fourier"
    "pst-all"
    "pst-barcode"
    "bclogo"
    "mathrsfs"
    "tikz"
    "pdfrender"
    "textcomp"
    "ifthen"
    "calc"
    "ulem"
    "array"
    "tabularx"
    "multicol"
    "eurosym"
    "xspace"
    "fancyhdr"
    "fancyvrb"
    "lastpage"
    "moreverb"
    "hhline"
    "mflogo"
    "ntheorem"
    "xlop"
    "tabvar"
    "letltxmacro"
    "algorithm2e"
    "minted"
    "etoolbox"
    "mdframed"
    "tcolorbox"
    "forest"
    "pythontex"
    "hyperref"
    "polyglossia"
    "babel"
    "numprint"
    "profCouleurs"
    "profNumDevoir"
    "profTypo"
    "profMaths"
    "profDivers"
    "profAlgo"
    "profPython"
    "profHTML"
    "profCSS"
    "profJS"
    "profNSI"
    "profStyle")
   (TeX-add-symbols
    "lamatiere")
   (LaTeX-add-environments
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monbloc" LaTeX-env-args ["argument"] 1)))
 :latex)

