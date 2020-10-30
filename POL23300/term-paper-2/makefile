.DEFAULT_GOAL := all

word_count:
	./wordcounts.sh

formatted: word_count formatted.tex
	pdflatex formatted.tex
	bibtex formatted.aux
	pdflatex formatted.tex
	bibtex formatted.aux

paper: word_count paper.tex
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex
	bibtex paper.aux

.PHONY: clean

clean:
	rm -f *.toc *.aux *~ *.log *.out *.bbl *.bak *.blg
	ls | grep -E '.pdf$$' | grep -vE "formatted.pdf|paper.pdf" | xargs -r rm

all: paper formatted word_count
	./wordcounts.sh

