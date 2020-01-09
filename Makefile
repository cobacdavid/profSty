TEX_SRC    = $(wildcard *.tex)
MP_SRC     = $(wildcard *.mp)
BKP_FILES  = $(wildcard *~)
# OPtions commandes
OPT_LUALATEX = --shell-escape
# Commandes
LUALATEX   = lualatex --shell-escape
PYTHON     = python3 /usr/share/texlive/texmf-dist/scripts/pythontex/pythontex.py --interpreter python:python3    
VUE        = /home/david/travail/david/production/lycee/algorithmique/python/themes/images_exercices_latex/images_exercices_latex.py
MPOST      = mpost
VIS_PDF    = evince
# 
PDF        = $(TEX_SRC:%.tex=%.pdf)
REP_PYTHONTEX  = pythontex-files-$(TEX_SRC:%.tex=%)                
#
# 
TO_DEL_C   = *.aux *.log *.toc *.lof *.lot *.mpx *.tmp
TO_DEL_P   = $(PDF) $(BKP_FILES)  *.0 *.1 *.2 *.3 *.4 *.5 *.6 *.7 *.8 *.9 *.10
REP_TO_DEL = pythontex-files-* _minted-*
#
#
all: $(PDF) clean

pdf: $(PDF) clean
	 @$(VIS_PDF) $(PDF) &

python: pythontexpenible
	$(LUALATEX) $(OPT_LUALATEX) $(TEX_SRC)
	$(PYTHON) $(TEX_SRC)
	$(LUALATEX) $(OPT_LUALATEX) $(TEX_SRC)
	@$(VIS_PDF) $(PDF) &

mp: mpost clean

clean:
	@rm -f $(TO_DEL_C)

mrproper: clean
	@rm -f $(TO_DEL_P)

pythontexpenible:
	@rm -rf $(REP_PYTHONTEX)
# 0 1 etc.
mpost:
	$(MPOST) $(MP_SRC)

# pdf
%.pdf: %.tex
	@$(LUALATEX) $(OPT_LUALATEX) $<

#vue
vue:
	$(VUE)
