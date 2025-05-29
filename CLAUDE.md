# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview
This is a LaTeX-based academic CV repository containing two versions of Vatsal Sanjay's curriculum vitae:
- `Vatsal_CV.tex`: Comprehensive academic CV using moderncv banking style
- `Vatsal_CV-shortCV.tex`: Condensed 2-page CV using moderncv classic style

## Build Commands
```bash
# Compile the main CV
pdflatex Vatsal_CV.tex
bibtex Vatsal_CV
pdflatex Vatsal_CV.tex
pdflatex Vatsal_CV.tex

# Compile the short CV
pdflatex Vatsal_CV-shortCV.tex
bibtex Vatsal_CV-shortCV
pdflatex Vatsal_CV-shortCV.tex
pdflatex Vatsal_CV-shortCV.tex
```

## Architecture
The CVs use the `moderncv` LaTeX package with:
- Custom color scheme defined in `moderncvcolordarkmagenta.sty`
- Bibliography managed in `mypublications.bib` containing ~35 publications
- Both versions share the same bibliography but display publications differently

## Key Customizations
- Custom darkmagenta color scheme (#68236D)
- Hyperlinked references throughout (DOIs, URLs)
- FontAwesome5 icons for visual elements
- Page numbering showing current/total pages
- Custom Euro symbol command for funding amounts