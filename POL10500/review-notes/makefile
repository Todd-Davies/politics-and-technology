.DEFAULT_GOAL := all

cycle-of-research:
	pdflatex cycle-of-research.tex

planes-of-research:
	pdflatex planes-of-research.tex

planes-of-research-2:
	pdflatex planes-of-research-2.tex

network-of-constructs:
	cp network-of-constructs.pdf.raw network-of-constructs.pdf

veto-players-1:
	pdflatex veto-players-1.tex

veto-players-2:
	pdflatex veto-players-2.tex

veto-players-3:
	pdflatex veto-players-3.tex

model-building:
	cp model-building.pdf.raw model-building.pdf

notes: cycle-of-research planes-of-research planes-of-research-2 network-of-constructs veto-players-1 veto-players-2 veto-players-3 model-building
	pdflatex pol10500-review.tex
	pdflatex pol10500-review.tex

env:
	virtualenv -p $(shell which python3) env
	source env/bin/activate; \
	pip install texsoup; \

flashcards: env notes
	source env/bin/activate; \
	python3 extractor.py content.tex > flashcards.tex
	pdflatex flashcards.tex

.PHONY: clean

clean:
	rm -f *.toc *.aux *~ *.log *.out
	ls | grep -E '.pdf$$' | grep -vE "flashcards.pdf|pol10500-review.pdf" | xargs -r rm
	rm -rf env

all: notes flashcards

