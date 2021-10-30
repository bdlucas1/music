DEST=../scores
LILYPOND=/Applications/LilyPond.app/Contents/Resources/bin/lilypond
#LILYPOND=~/Downloads/LilyPond.app/Contents/Resources/bin/lilypond

LYS=$(wildcard *.ly)
PDFS=$(LYS:%.ly=$(DEST)/%.pdf)

$(DEST)/%.pdf: %.ly
	$(LILYPOND) -o $(DEST)/$* $<
	ls -l $(DEST)/$*.pdf
	#exiftool $(DEST)/$*.pdf
	#mkdir -p ../midi
	#mv $(DEST)/$*.midi ../midi || echo np
	open -a Preview $(DEST)/$*.pdf

all: $(PDFS)

