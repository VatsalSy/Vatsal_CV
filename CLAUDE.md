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

## Adding/Updating Publications

### For Vatsal_CV.tex (Main CV)
Publications follow this exact format:
```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title without quotes],\\
[Journal abbrev.], [volume], [article#] ([year]) [[pages] pages];\\
(OA) DOI: \href{[DOI URL]}{[DOI number]}.
```

Example:
```latex
\item Ayush K. Dixit, Alexandros T. Oratis, Konstantinos Zinelis, Detlef Lohse, and \textbf{Vatsal Sanjay},\\
Viscoelastic Worthington jets and droplets produced by bursting bubbles,\\
J. Fluid Mech., 1010, A2 (2025) [32 pages];\\
(OA) DOI: \href{https://doi.org/10.1017/jfm.2025.237}{10.1017/jfm.2025.237}.
```

Key formatting rules:
- Use `\\` at end of each line except the last
- Page count always in format `[X pages]` 
- Semicolon `;` before final `\\` on journal line
- For non-OA papers with preprints: `DOI: \href{...}{...}, OA: \href{...}{...}`
- Special notes (Cover, Editor's Suggestion) go on a new line or as sub-items

### For Vatsal_CV-shortCV.tex (Short CV)
**IMPORTANT: Always select the 5 LATEST publications** (chronologically most recent, regardless of impact) in condensed format:
```latex
\item \textbf{V. Sanjay}, [coauthors], [Short title], \textit{[Journal]} [volume], [article] ([year]).
```

Example:
```latex
\item \textbf{V. Sanjay} \& D. Lohse, Unifying theory of scaling in drop impact, \textit{Phys. Rev. Lett.}, 134, 104003 (2025).
```

Selection criteria:
- Always take the 5 most recent papers from the main CV
- Order them from newest to oldest
- Include year in parentheses at the end

### For mypublications.bib
Add proper BibTeX entries with all metadata:
```bibtex
@article{key2025,
  author = {Last1, First1 and Last2, First2 and Sanjay, Vatsal},
  title = {Full title with proper capitalization},
  journal = {Full Journal Name},
  volume = {134},
  pages = {104003},
  doi = {10.xxxx/xxxxx},
  year = {2025}
}
```

### Update Process
1. Add new publications to the beginning of the enumerated list (latest first) in Vatsal_CV.tex
2. **Update Vatsal_CV-shortCV.tex with the 5 LATEST publications** (not most impactful, but chronologically newest)
3. Update total count in shortCV: "Selected publications (X total, Y+ citations)"
4. Add corresponding BibTeX entry to mypublications.bib
5. Move papers from "Works Under Review" to published section when accepted
6. Run pdflatex twice to update references and page numbers for both CVs