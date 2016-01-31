# Makefile for Orion-X3/Orion-X4/mx and derivatives
# Written in 2011
# This makefile is licensed under the WTFPL


# LATEX				= texfot lualatex
LATEX				= lualatex
FLAGS				= --interaction=nonstopmode --halt-on-error --shell-escape


FIGURESSRC			= $(shell find figures -iname "*.tex")
FIGURESPDF			= $(FIGURESSRC:.tex=.pdf)

.DEFAULT_GOAL = all


SRC					= $(shell find . -maxdepth 1 -iname "*.tex" -not -iname "OrganicChem.tex" | sed 's/ /\\ /g')
FINALSRC			= ./OrganicChem.tex
OUTPUT				= ./OrganicChem.pdf

.PHONY: clean all

all: $(OUTPUT)

$(OUTPUT): $(SRC) $(FINALSRC) $(FIGURESPDF)
	@$(LATEX) $(FLAGS) $(FINALSRC)


%.pdf: %.tex
	@cd $(dir $@); $(LATEX) $(FLAGS) $(notdir $<)


# haha
clena: clean
clean:
	@find . -name "*.aux" | xargs rm -f
	@find . -name "*.log" | xargs rm -f
	@find . -name "*.pdf" | xargs rm -f









