DEST=../scores
LILYPOND=/Applications/LilyPond.app/Contents/Resources/bin/lilypond

LYS=$(wildcard *.ly)
PDFS=$(LYS:%.ly=$(DEST)/%.pdf)

$(DEST)/%.pdf: %.ly
	$(LILYPOND) -o $(DEST)/$* $<

all: $(PDFS)

