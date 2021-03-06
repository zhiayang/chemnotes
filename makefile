# Makefile for Orion-X3/Orion-X4/mx and derivatives
# Written in 2011
# This makefile is licensed under the WTFPL


# LATEX				= texfot lualatex
LATEX				= lualatex
FLAGS				= --interaction=nonstopmode --halt-on-error --shell-escape


FIGURESSRC			= $(shell find figures -iname "*.tex")
FIGURESPDF			= $(FIGURESSRC:.tex=.pdf)

.DEFAULT_GOAL = all


OSRC				= $(shell find OrganicChem -maxdepth 1 -iname "*.tex" -not -iname "OrganicChem.tex" | sed 's/ /\\ /g')
FINALOSRC			= OrganicChem/OrganicChem.tex
OOUTPUT				= OrganicChem.pdf

PSRC				= $(shell find PhysicalChem -maxdepth 1 -iname "*.tex" -not -iname "PhysicalChem.tex" | sed 's/ /\\ /g')
FINALPSRC			= PhysicalChem/PhysicalChem.tex
POUTPUT				= PhysicalChem.pdf

ISRC				= $(shell find InorganicChem -maxdepth 1 -iname "*.tex" -not -iname "InorganicChem.tex" | sed 's/ /\\ /g')
FINALISRC			= InorganicChem/InorganicChem.tex
IOUTPUT				= InorganicChem.pdf

.PHONY: clean all organic physical inorganic

all: $(OOUTPUT) $(POUTPUT) $(IOUTPUT)

organic: $(OOUTPUT)
physical: $(POUTPUT)
inorganic: $(IOUTPUT)

$(OOUTPUT): $(OSRC) $(FINALOSRC) studynotes.sty
	@cd OrganicChem; $(LATEX) $(FLAGS) $(notdir $(FINALOSRC))
	@mv OrganicChem/OrganicChem.pdf ./

$(POUTPUT): $(PSRC) $(FINALPSRC) studynotes.sty
	@cd PhysicalChem; $(LATEX) $(FLAGS) $(notdir $(FINALPSRC))
	@mv PhysicalChem/PhysicalChem.pdf ./

$(IOUTPUT): $(ISRC) $(FINALISRC) studynotes.sty
	@cd InorganicChem; $(LATEX) $(FLAGS) $(notdir $(FINALISRC))
	@mv InorganicChem/InorganicChem.pdf ./


%.pdf: %.tex
	@cd $(dir $@); $(LATEX) $(FLAGS) $(notdir $<)

%.toc: %.tex



# haha
clena: clean
clean:
	@find . -name "*.aux" | xargs rm -f
	@find . -name "*.log" | xargs rm -f
	@find . -name "*.pdf" | xargs rm -f
	@find . -name "*.toc" | xargs rm -f
	@find . -name "*.out" | xargs rm -f









