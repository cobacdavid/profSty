(TeX-add-style-hook
 "profBeamer"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontspec" "no-math") ("inputenc" "utf8") ("algorithm2e" "french" "onelanguage") ("mdframed" "tikz") ("babel" "frenchb") ("numprint" "autolanguage")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "fontspec"
    "luatexbase"
    "metalogo"
    "luacode"
    "fixltx2e"
    "luamplib"
    "unicode-math"
    "luatexperso"
    "hyperref"
    "inputenc"
    "aeguill"
    "fourier"
    "pst-all"
    "pst-barcode"
    "mathrsfs"
    "tikz"
    "textcomp"
    "ifthen"
    "calc"
    "ulem"
    "array"
    "multicol"
    "eurosym"
    "xspace"
    "fancyhdr"
    "fancyvrb"
    "fancybox"
    "lastpage"
    "moreverb"
    "hhline"
    "mflogo"
    "algorithm2e"
    "minted"
    "etoolbox"
    "mdframed"
    "polyglossia"
    "babel"
    "numprint")
   (TeX-add-symbols
    '("partie" 1)
    '("Subsection" 1)
    '("SectionEtoile" 1)
    '("Section" 1)
    "og"
    "fg"
    "macouleur"
    "blanc"
    "noir"
    "rouge"
    "CurrentPart"
    "CurrentSection"
    "CurrentTitle"
    "CurrentSubTitle"
    "frametitrecomplet"
    "otablo"
    "maPScouleur")
   (LaTeX-add-environments
    "madef"
    "remar"
    "remars"
    "cmConsignes"
    "cmQuestion"
    "rtQuestion"
    "rtQuestions")
   (LaTeX-add-polyglossia-langs
    '("french" "mainlanguage" "")
    '("english" "otherlanguage" "")))
 :latex)

