(TeX-add-style-hook
 "prof"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontspec" "no-math") ("inputenc" "utf8") ("xcolor" "rgb" "dvipsnames" "svgnames" "luatex") ("algorithm2e" "french" "onelanguage") ("mdframed" "tikz") ("hyperref" "unicode=true") ("babel" "frenchb" "english") ("numprint" "autolanguage")))
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
    "filecontents"
    "pgfplots"
    "pgfplotstable"
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
    "forest"
    "pythontex"
    "hyperref"
    "auto-pst-pdf"
    "polyglossia"
    "babel"
    "numprint"
    "profNumDevoir"
    "profCitation"
    "profMOTD"
    "profMaths"
    "profDivers"
    "profAlgo"
    "profPython"
    "profNSI"
    "profStylePST"
    "profStyleSansPST")
   (TeX-add-symbols
    '("nombre" 1)
    "lamatiere"
    "np"
    "dfrac"
    "degres"
    "text"
    "og"
    "fg"
    "ieme"
    "ier"
    "iere"
    "no"
    "pybleu"
    "pyjaune"
    "macouleur"
    "gris"
    "maPScouleurGradBegin"
    "maPScouleur"
    "pythonBleu"
    "pythonJaune")
   (LaTeX-add-polyglossia-langs
    '("french" "defaultlanguage" "")
    '("english" "otherlanguage" "")))
 :latex)

