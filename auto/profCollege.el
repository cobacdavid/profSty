(TeX-add-style-hook "profCollege"
 (lambda ()
    (LaTeX-add-environments
     "exercice")
    (TeX-add-symbols
     '("dm" 3)
     '("ie" 3)
     '("ds" 3)
     '("titrepoly" 1)
     '("auteur" 1)
     '("encadrepointilles" 1)
     "matiere"
     "Auteur")))

