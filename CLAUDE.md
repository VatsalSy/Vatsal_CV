# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Start Here First

**IMPORTANT: Read README.md first** for complete repository overview, build commands, CV structure, and general workflows.

This file contains Claude-specific workflow guidance and detailed examples.

## Quick Reference

### Essential Commands
```bash
make cv          # Compile main CV
make shortcv     # Compile short CV
make all         # Compile both CVs
make lint        # Run all linters
```

### Key Workflow
1. **Always update Vatsal_CV.tex first** with requested changes
2. **Check if Vatsal_CV-shortCV.tex needs updating** (publications, metrics, awards)
3. **Compile both CVs** to ensure proper formatting
4. **Run linting** with `make lint` to catch errors

## Publication Update Workflow

### Adding New Publications

For **Vatsal_CV.tex** (Main CV), use this exact format:

```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title without quotes],\\
[Journal abbrev.], [volume], [article#] ([year]) [[pages] pages];\\
(OA) DOI: \href{[DOI URL]}{[DOI number]}.
```

**Example:**
```latex
\item Ayush K. Dixit, Alexandros T. Oratis, Konstantinos Zinelis, Detlef Lohse, and \textbf{Vatsal Sanjay},\\
Viscoelastic Worthington jets and droplets produced by bursting bubbles,\\
J. Fluid Mech., 1010, A2 (2025) [32 pages];\\
(OA) DOI: \href{https://doi.org/10.1017/jfm.2025.237}{10.1017/jfm.2025.237}.
```

### Critical Formatting Rules

- Use `\\` at end of each line except the last
- Page count always in format `[X pages]`
- Semicolon `;` before final `\\` on journal line
- For non-OA papers with preprints: `DOI: \href{...}{...}, OA: \href{...}{...}`

### Short CV Updates

**IMPORTANT:** For **Vatsal_CV-shortCV.tex**, always select the **7 LATEST publications** (chronologically most recent, not by impact):

```latex
\item \textbf{V. Sanjay}, [coauthors], [Short title], \textit{[Journal]} [volume], [article] ([year]).
```

**Example:**
```latex
\item \textbf{V. Sanjay} \& D. Lohse, Unifying theory of scaling in drop impact, \textit{Phys. Rev. Lett.}, 134, 104003 (2025).
```

## Common Update Scenarios

### New Publication Added
1. Add to beginning of enumerated list in Vatsal_CV.tex (latest first)
2. Update shortCV with 7 most recent publications
3. Update total count in shortCV: "Selected publications (X total, Y+ citations)"
4. Add BibTeX entry to mypublications.bib (for archival)
5. Run `pdflatex` twice for both CVs

### Paper Accepted (from Under Review)
1. Move from "Works Under Review" to published section in main CV
2. Update shortCV if it's now in the 7 most recent
3. Update metrics if needed

### Awards/Positions Added
1. Add to main CV first
2. Check if significant enough for condensed shortCV
3. Update both if needed

## LaTeX Formatting Details

### Special Characters and Commands
- Euro symbol: Use custom `\Euro` command for funding amounts
- Video links: `{\color{red}\faYoutube}` instead of `[Video]` text
- Icons spacing: `\faIcon\hspace{0.3em}Text` for subsections, `\hspace{0.2em}` for inline

### Publication Numbering
```latex
\begin{enumerate}[leftmargin=1.5em,label=\textbf{[\arabic*]}]
```

### Special Notes Format
For journal covers or editor's suggestions, add as sub-items:
```latex
\begin{itemize}
\item Journal Cover Feature
\item Editor's Suggestion
\end{itemize}
```

## Error Handling

- **Linting errors**: Run `make lint` and fix ChkTeX warnings
- **Reference errors**: Run `make check-refs` for undefined references
- **Compilation issues**: Try `make clean` then recompile
- **Formatting problems**: Double-check `\\` placement and spacing

## Notes for Claude

- Repository uses moderncv LaTeX package with custom darkmagenta color (#68236D)
- Both CVs share styling but display publications differently
- Short CV is exactly 2 pages and shows ONLY the 7 most recent publications
- All icons and symbols are documented in README.md
- Publications are hardcoded in .tex files (not pulled from .bib file)