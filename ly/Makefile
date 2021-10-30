SCORES_DIR=../scores
LILYPOND=/Applications/LilyPond.app/Contents/Resources/bin/lilypond
#LILYPOND=~/Downloads/LilyPond.app/Contents/Resources/bin/lilypond

LYS=$(wildcard *.ly)
SCORES=$(LYS:%.ly=$(SCORES_DIR)/%.pdf)

$(SCORES_DIR)/%.pdf: %.ly
	$(LILYPOND) -o $(SCORES_DIR)/$* $<
	#exiftool $(SCORES_DIR)/$*.pdf
	#mkdir -p ../midi
	#mv $(SCORES_DIR)/$*.midi ../midi || echo np
	open -a Preview $(SCORES_DIR)/$*.pdf

all: $(SCORES) #../pdfs/mel-bay.pdf

../pdfs/mel-bay.pdf:
	mkdir -p ../pdfs
	"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o ../pdfs/mel-bay.pdf \
	   ../scores/mel-bay-little-brown-jug.pdf \
	   ../scores/mel-bay-broken-chord-jig.pdf \
	   ../scores/mel-bay-captain-jinks.pdf \
	   ../scores/mel-bay-buckwheat-batter.pdf \
	   ../scores/mel-bay-yonder-she-goes.pdf \
	   ../scores/mel-bay-lauterbach-waltz.pdf \
	   ../scores/mel-bay-peek-a-boo-waltz.pdf \
	   ../scores/mel-bay-big-chief.pdf \
	   ../scores/mel-bay-fishers-hornpipe.pdf \
	   ../scores/mel-bay-illinois-cotillion.pdf \
	   ../scores/mel-bay-old-rosin-the-beau.pdf \
	   ../scores/mel-bay-double-shuffle.pdf \
	   ../scores/mel-bay-happy-jack.pdf \
	   ../scores/mel-bay-log-cabin-waltz-2.pdf \
	   ../scores/mel-bay-home-waltz.pdf \


