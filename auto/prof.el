(TeX-add-style-hook
 "prof"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontspec" "no-math") ("inputenc" "utf8") ("xcolor" "rgb" "dvipsnames" "svgnames" "luatex") ("algorithm2e" "french" "onelanguage") ("mdframed" "tikz") ("tcolorbox" "many") ("hyperref" "unicode=true") ("babel" "frenchb" "english") ("numprint" "autolanguage")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
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
    "profImages"
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
    '("bclogo" LaTeX-env-args ["argument"] 1))
   (LaTeX-add-polyglossia-langs
    '("french" "defaultlanguage" "")
    '("english" "otherlanguage" "")))
 :latex)

