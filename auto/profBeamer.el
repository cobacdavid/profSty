(TeX-add-style-hook
 "profBeamer"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontspec" "no-math") ("hyperref" "pdftex") ("inputenc" "utf8") ("algorithm2e" "french" "onelanguage") ("mdframed" "tikz") ("babel" "frenchb") ("numprint" "autolanguage")))
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
    '("commentaire" LaTeX-env-args ["argument"] 1)
    '("monblocnb" LaTeX-env-args ["argument"] 2)
    '("monblocb" LaTeX-env-args ["argument"] 2)
    '("monbloc" LaTeX-env-args ["argument"] 3)
    "madef"
    "remar"
    "remars"
    "cmConsignes"
    "cmQuestion"
    "rtQuestion"
    "rtQuestions"))
 :latex)

