(TeX-add-style-hook
 "profMaths"
 (lambda ()
   (TeX-add-symbols
    '("dinv" 1)
    '("calt" 1)
    '("ora" 1)
    '("rg" 1)
    '("intfo" 2)
    '("intof" 2)
    '("intoo" 2)
    '("intff" 2)
    '("calcularbre" 2)
    '("arbre" 1)
    '("operation" 3)
    '("ecrancalc" 1)
    '("arcoriente" 1)
    '("arc" 1)
    '("cvect" 2)
    '("norme" 1)
    '("vect" 1)
    '("vi" 1)
    "R"
    "N"
    "Z"
    "D"
    "Q"
    "VI"
    "vectu"
    "vectv"
    "vecti"
    "vectj"
    "ron"
    "lv"
    "lec"
    "infa"
    "supa"
    "Vect"
    "vecu"
    "vecv"
    "dps"
    "oldsqrt"
    "sqrt"
    "DHLhksqrt")
   (LaTeX-add-environments
    "definition"
    "exemple"
    "propriete"
    "theoreme"
    "demonstration"
    "remarque"))
 :latex)

