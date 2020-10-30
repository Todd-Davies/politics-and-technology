.DEFAULT_GOAL := all

word_count:
	./wordcounts.sh

formatted: word_count formatted.tex
	pdflatex formatted.tex
	bibtex formatted.aux
	pdflatex formatted.tex
	bibtex formatted.aux
	cp formatted.pdf hybrid-warfare-tactics.pdf

anon: formatted
	pdflatex "\def\isanonymous{1} \input{formatted.tex}"
	cp formatted.pdf anon.pdf

.PHONY: clean

clean:
	rm -f *.toc *.aux *~ *.log *.out *.bbl *.bak *.blg
	ls | grep -E '.pdf$$' | grep -vE "formatted.pdf|paper.pdf" | xargs -r rm

all:  formatted anon word_count
	./wordcounts.sh

