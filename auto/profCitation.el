(TeX-add-style-hook
 "profCitation"
 (lambda ()
   (TeX-add-symbols
    '("formatcitation" 2)
    '("numcitation" 1)
    "Cdeux"
    "Cquatre"
    "Csix"
    "Csept"
    "Cun"
    "Cneuf"
    "Ccinq"
    "Chuit"
    "Ctrois"
    "Cdix"
    "randCit"
    "citationchoisie"
    "TEXTE"
    "TEXTEf"
    "texteH"
    "texteB")
   (LaTeX-add-lengths
    "longCitation"
    "hautCitation")
   (LaTeX-add-saveboxes
    "textecitation"))
 :latex)

