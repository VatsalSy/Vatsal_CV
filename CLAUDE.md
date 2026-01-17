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

**Canonical reference:** See `.claude/commands/add-pub.md` for complete formatting templates, icon usage (`\faFile`, `\faLock`, `\faGithub`, `\faStar`), and examples. Use the `/add-pub` slash command for adding publications.

### Short CV Rule

For **Vatsal_CV-shortCV.tex**, always select the **7 LATEST publications** (chronologically most recent, not by impact).

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

## Slash Commands

### `/add-pub` - Add Publication to CV

**Location:** `.claude/commands/add-pub.md`

**Usage:**

```
/add-pub [bibtex-text] [type: preprint|published]
```

**What it does:**
1. Parses BibTeX input and extracts publication metadata
2. Routes by publication type:
   - **Preprints** → "Works Under Review / In Preparation" section
   - **Published** → "Peer-Reviewed Publications" section (auto-removes from preprints if previously listed)
3. Formats entries matching existing CV style:
   - `\textbf{Vatsal Sanjay}` for self-citations
   - Proper icons (`\faFile`, `\faLock`, `\faGithub`, `\faStar`)
   - DOI/OA links, GitHub repos, page counts
4. Updates all three files:
   - `Vatsal_CV.tex` (main CV)
   - `Vatsal_CV-shortCV.tex` (keeps 7 most recent)
   - `mypublications.bib` (BibTeX archive)
5. Asks for missing info (page count, GitHub URL, Open Access status, special features)

## Notes for Claude

- Repository uses moderncv LaTeX package with custom darkmagenta color (#68236D)
- Both CVs share styling but display publications differently
- Short CV is exactly 2 pages and shows ONLY the 7 most recent publications
- All icons and symbols are documented in README.md
- Publications are hardcoded in .tex files (not pulled from .bib file)
- Use `/add-pub` slash command for adding new publications (handles all formatting automatically)