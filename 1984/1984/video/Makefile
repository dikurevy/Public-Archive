# Makefile for DIKUrevy
# 
# Author: munter@diku.dk
#
# This file should be symlinked to in directories with songs and sketches.

tmpdir = __TMP__

# If there is a plan file, fetch all the lines ending with '.tex' and output them space separated into datadeps
datadeps := $(shell ls -1 *.tex | sed ':b;N;s/\n/ /;bb')
pdfdeps := $(subst .tex,.pdf,$(datadeps))
dvideps := $(subst .tex,.dvi,$(datadeps))

.PHONY : help

help: 
	@echo DIKUrevy sketch and song make environment.
	@echo "usage: make (pdf|dvi|clean|auxclean|writable)"
	@echo " "
	@echo Available targets:
	@echo "pdf      : Build PDF from all TeX files"
	@echo "dvi      : Build DVI from all TeX files"
	@echo "clean    : Remove all built files"
	@echo "auxclean : Remove all auxillary files from the TeX build process"
	@echo "writable : Take over ownership of all TeX files and make them group writable"
	@echo " "

# Cleans auxillariy TeX files that are annoying to look at when working in the directory.
auxclean :
	@rm -f *.log *.aux
#	@echo Auxillary files removed

# Removes all target files. Use this if you want to rebuild everything.
clean : auxclean
	@rm -f *.dvi *.pdf
#	@echo Built files removed

# Takes over ownership of all TeX files and makes them writable to the group.
writable : 
	-@chown -f :revy *.tex
	-@chmod -f 660 *.tex
	@echo Reestablished write access to revy group

# Targets to compile all TeX files into pdf.
pdf : $(pdfdeps)

# Targets to compile all TeX files into dvi.
dvi : $(dvideps)

# Target to compile a pdf file from the corresponding TeX file.
%.pdf : %.tex
	@if [ -O $< ] ; then chmod 660 $<; fi
	@rm -f $@
	@echo -n "	$(@F): "
	-@pdflatex -halt-on-error $< > /dev/null && pdflatex -halt-on-error $< > /dev/null && echo "OK" || echo "ERROR"
	@if [ -f $@ ] ; then chmod 660 $@; $(MAKE) -s --no-print-directory auxclean; fi

# Target to compile a dvi file from the corresponding TeX file.
%.dvi : %.tex
	@if [ -O $< ] ; then chmod 660 $<; fi
	@rm -f $@
	@echo -n $< --\> $@:
	-@latex -halt-on-error $< > /dev/null && latex -halt-on-error $< > /dev/null && echo " OK" || echo " ERROR"
	@if [ -f $@ ] ; then chmod 660 $@; $(MAKE) -s --no-print-directory auxclean; fi
