all: filled unfilled

filled: 01-lecture.pdf 02-lecture.pdf 03-lecture.pdf 04-lecture.pdf 05-lecture.pdf 06-lecture.pdf 07-lecture.pdf 08-lecture.pdf 09-lecture.pdf 10-lecture.pdf 11-lecture.pdf 12-lecture.pdf

unfilled: 01-lecture-unfilled.pdf 02-lecture-unfilled.pdf 03-lecture-unfilled.pdf 04-lecture-unfilled.pdf 05-lecture-unfilled.pdf 06-lecture-unfilled.pdf 07-lecture-unfilled.pdf 08-lecture-unfilled.pdf 09-lecture-unfilled.pdf 10-lecture-unfilled.pdf 11-lecture-unfilled.pdf 12-lecture-unfilled.pdf

%-lecture.tex: make-header-filled.sh
	sh ./make-header-filled.sh $*

%-lecture-unfilled.tex: make-header-unfilled.sh
	sh ./make-header-unfilled.sh $*

%-lecture.pdf: %-lecture.tex %-body.tex preamble.tex
	pdflatex $*-lecture.tex
	pdflatex $*-lecture.tex
	$(MAKE) $*-lecture-clean-latex

%-lecture-unfilled.pdf: %-lecture-unfilled.tex %-body.tex preamble.tex
	pdflatex $*-lecture-unfilled.tex
	pdflatex $*-lecture-unfilled.tex
	$(MAKE) $*-lecture-unfilled-clean-latex

%-clean-latex:
	rm -f $*.ilg $*.aux $*.log $*.dvi $*.idx $*.toc $*.lof $*.lot $*.nav $*.out $*.snm $*.vrb
	rm -f $*.blg $*.bbl $*~
	rm -f $*.ps

clean:
	rm -f *.ilg *.aux *.log *.dvi *.idx *.toc *.lof *.lot *.nav *.out *.snm *.vrb
	rm -f *.blg *.bbl *~
	rm -f *.ps

clean_pdf:
	rm -f *-lecture-unfilled.pdf *-lecture.pdf

clean_tex:
	rm -f *-lecture.tex *-lecture-unfilled.tex

