# Vatsal Sanjay - Academic CV

This repository contains the LaTeX source files for Vatsal Sanjay's academic curriculum vitae.

## Repository Contents

- **`Vatsal_CV.tex`** - Comprehensive academic CV using moderncv banking style
- **`Vatsal_CV-shortCV.tex`** - Condensed 2-page CV using moderncv banking style
- **`mypublications.bib`** - Bibliography file containing all publications
- **`moderncvcolordarkmagenta.sty`** - Custom color scheme (#68236D)
- **`Makefile`** - Build automation and linting tools

## Building the CVs

### Using Make (Recommended)

```bash
# Build individual CVs
make cv          # Compile main CV
make shortcv     # Compile short CV
make all         # Compile both CVs

# Cleaning
make clean       # Remove auxiliary files
make distclean   # Remove all generated files including PDFs

# Utility
make help        # Display available make targets with descriptions
```

### Manual Compilation

```bash
# Main CV
pdflatex Vatsal_CV.tex
pdflatex Vatsal_CV.tex

# Short CV
pdflatex Vatsal_CV-shortCV.tex
pdflatex Vatsal_CV-shortCV.tex
```

## Quality Assurance

### Linting Commands

```bash
make lint        # Run all linters (ChkTeX on both CV files)
make lint-tex    # Run ChkTeX linter on .tex files
make lint-bib    # Check bibliography for warnings/errors in both CVs
make lint-lacheck # Run lacheck linter (if installed)
make lint-verbose # Run ChkTeX with verbose output
make check-refs  # Check for undefined references in both CVs
```

### Requirements

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- moderncv package
- fontawesome5 package
- ChkTeX (for linting)

## CV Structure

### Main CV Features

- Complete publication list with DOI links
- FontAwesome5 icons for visual elements
- Custom darkmagenta color scheme
- Hyperlinked references throughout
- Page numbering with current/total format

### Short CV Features

- Condensed 2-page format
- **Latest 7 publications** (chronologically most recent, not most impactful)
- Essential information only
- Same styling as main CV

## Publication Management

### Adding New Publications

1. **Main CV**: Add to beginning of enumerated list in `Vatsal_CV.tex`
2. **Short CV**: Update with the 7 most recent publications (chronologically, not by impact)
3. **Bibliography**: Add BibTeX entry to `mypublications.bib`

### Selection Criteria for Short CV

- Always select the **7 chronologically most recent** publications
- Order them from newest to oldest
- Include year in parentheses at the end
- **Not** based on impact or importance, only recency

### Publication Format (Main CV)

```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title without quotes],\\
[Journal abbrev.], [volume], [article#] ([year]) [[pages] pages];\\
(OA) DOI: \href{[DOI URL]}{[DOI number]}.
```

### Publication Format (Short CV)

```latex
\item \textbf{V. Sanjay}, [coauthors], [Short title], \textit{[Journal]} [volume], [article] ([year]).
```

## Symbols and Icons

### Publication Symbols

- 📄 `\faFile`: Open-access publications
- 🔒 `\faLock`: Paywalled publications with DOI
- ⭐ `\faStar`: Journal cover features and Editor's Suggestions
- 📈 `\faChartLine`: Highly cited papers

### Section Icons

- 🎓 `\faUserGraduate`: PhD Theses subsection
- 🎓 `\faGraduationCap`: Master Theses subsection
- 🏫 `\faUniversity`: Bachelor Theses subsection
- 👥 `\faUsers`: Seminars & Conferences subsection
- ✓ `\faCheck`: Refereeing subsection
- 🎤 `\faMicrophone`: Invited Talks subsection
- 💬 `\faComments`: Contributed Talks subsection

### Funding Icons

- 💡 `\faLightbulb`: Research fellowships and monetary funding
- 🖥️ `\faServer`: Computational resources

### Metrics Icons

- 🆔 `\faIdCard`: Researcher ID
- ORCID `\faOrcid`: ORCID identifier
- 📈 `\faChartLine`: Hirsch-index
- 📄 `\faFile`: i10-index
- 👥 `\faUsers`: Research Interest Score

## Update Protocol

When updating CVs:

1. **Always update `Vatsal_CV.tex` first**
2. **Check if `Vatsal_CV-shortCV.tex` needs updating**:
   - Publications added/modified → Update shortCV with 7 latest
   - Awards/positions → Check significance for condensed CV
   - Metrics updated → Update metrics line
   - Contact info → Update both CVs
3. **Compile both CVs** to ensure proper formatting

## Current Metrics

- **Publications**: 20 peer-reviewed papers
- **Citations**: 500+
- **H-index**: 10 (Google Scholar), 8 (Web of Science)
- **i10-index**: 8

## Contact

- **Email**: <vatsal.sanjay@comphy-lab.org>
- **Website**: [comphy-lab.org](https://comphy-lab.org)
- **ORCID**: [0000-0002-4293-6099](https://orcid.org/0000-0002-4293-6099)

## License

This CV template uses the moderncv LaTeX package. The content is personal academic information of Vatsal Sanjay.

## Legacy Note

For the customized CV option used in PhD applications, please visit <https://github.com/VatsalSy/Vatsal_CV/tree/PhDapplication>
