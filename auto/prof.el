(TeX-add-style-hook
 "prof"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("xcolor" "rgb" "dvipsnames" "svgnames" "luatex") ("algorithm2e" "french" "onelanguage") ("minted" "cache=false") ("mdframed" "tikz") ("tcolorbox" "many") ("hyperref" "unicode=true") ("babel" "frenchb" "english") ("numprint" "noautolanguage")))
   (add-to-list 'LaTeX-verbatim-environments-local "pythontexcustomcode")
   (add-to-list 'LaTeX-verbatim-environments-local "pygments")
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
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "py")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pyc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pys")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pyv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pyb")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pycon")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pyconc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pyconv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylab")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabs")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabb")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabcon")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabconc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "pylabconv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympy")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympyc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympys")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympyv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympyb")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympycon")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympyconc")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "sympyconv")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "EscVerb*")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "EscVerb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "py")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pyc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pys")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pyv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pyb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pycon")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pyconc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pyconv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylab")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabs")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabcon")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabconc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "pylabconv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympy")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympyc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympys")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympyv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympyb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympycon")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympyconc")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "sympyconv")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (TeX-run-style-hooks
    "random"
    "geometry"
    "graphicx"
    "amsmath"
    "amssymb"
    "ifluatex"
    "xcolor"
    "fontspec"
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
    "pgfgantt"
    "pgfplots"
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
    "profSQL"
    "profLua"
    "profHaskell"
    "proftex"
    "profCSS"
    "profC"
    "profJS"
    "profNSI"
    "profStyle")
   (TeX-add-symbols
    "lamatiere")
   (LaTeX-add-polyglossia-langs
    '("french" "defaultlanguage" "")
    '("english" "otherlanguage" "")))
 :latex)

