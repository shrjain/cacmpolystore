#
#  USAGE:
#     make       ... to build the polystore.pdf file
#     make tar   ... to create a tar file of the paper's source
#     make clean ... to run the default test case
#

LATEX = pdflatex
BIBTEX = bibtex

BIBSRC = polystore.tex
SRC  = $(BIBSRC) 

TARSRC  = $(SRC) bigdawg.bib makefile figures IEEEtran.bst IEEEtran.cls

polystore.pdf: $(TARSRC)
	$(LATEX) $(SRC)
	$(BIBTEX) $(BIBSRC:.tex=)
	$(LATEX) $(SRC)
	$(LATEX) $(SRC)

tar: $(TARSRC)
	rm -rf polystore.tar
	tar cvf polystore.tar $(TARSRC) 

clean:
	rm -f *.dvi *.log *.aux *.bbl *.blg *.out
