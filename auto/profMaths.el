(TeX-add-style-hook
 "profMaths"
 (lambda ()
   (TeX-add-symbols
    '("devoir" 4)
    '("histo" 3)
    '("sgnde" 1)
    '("varde" 1)
    '("cvect" 2)
    '("norme" 1)
    '("vect" 1)
    '("fonc" 4)
    '("calt" 1)
    '("ora" 1)
    '("rg" 1)
    '("intfo" 2)
    '("intof" 2)
    '("intoo" 2)
    '("intff" 2)
    '("vi" 1)
    "R"
    "N"
    "Z"
    "D"
    "Q"
    "infa"
    "supa"
    "vectu"
    "vectv"
    "vecti"
    "vectj"
    "ron"
    "lv"
    "lec"
    "sgnduq"
    "sgndup"
    "nom"
    "dps"
    "Vect"
    "vecu"
    "vecv"
    "oldsqrt"
    "sqrt"
    "DHLhksqrt")
   (LaTeX-add-environments
    "exercice")
   (LaTeX-add-counters
    "numeroexo"))
 :latex)

