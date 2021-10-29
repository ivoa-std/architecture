# ivoatex Makefile.  The ivoatex/README for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = IVOAArchitecture

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 2.0

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2021-10-29

# What is it you're writing: NOTE, WD, PR, or REC
DOCTYPE = EN

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex
SOURCES = $(DOCNAME).tex

# List of pixel image files to be included in submitted package 
FIGURES = 

# List of PDF figures (for vector graphics)
VECTORFIGURES = archdiag0.pdf archdiag1.pdf archdiag2.pdf

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES = 

include ivoatex/Makefile

archdiag2.svg: archdiag-full.xml ivoatex/make-archdiag.xslt
	$(XSLTPROC) -o $@ ivoatex/make-archdiag.xslt archdiag-full.xml

archdiag1.svg: ivoatex/make-archdiag.xslt
	echo '<archdiag xmlns="http://ivoa.net/archdiag"/>' | $(XSLTPROC) -o $@ ivoatex/make-archdiag.xslt - 

archdiag0.svg: ivoatex/make-archdiag.xslt
	echo '<archdiag0 xmlns="http://ivoa.net/archdiag"/>' | $(XSLTPROC) -o $@ ivoatex/make-archdiag.xslt -



ivoatex/Makefile:
	@echo "*** ivoatex submodule not found.  Initialising submodules."
	@echo
	git submodule update --init
