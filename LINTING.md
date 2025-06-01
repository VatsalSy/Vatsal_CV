# LaTeX Linting Setup for Vatsal_CV

This document describes the linting configuration for the LaTeX CV repository.

## Quick Start

```bash
# Run all linters
make lint

# Run only LaTeX linting
make lint-tex

# Run bibliography validation
make lint-bib

# Check for undefined references
make check-refs
```

## Linting Tools

### 1. ChkTeX (Primary LaTeX Linter)
- **Purpose**: Comprehensive LaTeX syntax and style checking
- **Configuration**: `.chktexrc`
- **Features**:
  - Checks for common LaTeX mistakes
  - Custom rules for CV-specific patterns
  - Validates DOI hyperlinks
  - Ensures author name is bolded
  - Checks date format consistency

### 2. lacheck (Secondary LaTeX Linter)
- **Purpose**: Simple and fast LaTeX checking
- **Usage**: `make lint-lacheck`
- **Good for**: Quick syntax validation

### 3. Biber (Bibliography Validator)
- **Purpose**: Validates BibTeX entries
- **Usage**: `make lint-bib`
- **Checks**:
  - Entry format validity
  - Required fields
  - Data model compliance

## Installation

### macOS
```bash
# Using MacTeX/TeX Live
sudo tlmgr update --self
sudo tlmgr install chktex lacheck biber

# Using Homebrew
brew install chktex
```

### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install chktex lacheck texlive-bibtex-extra
```

### Windows (MiKTeX)
Use the MiKTeX Package Manager to install:
- chktex
- lacheck
- biber

## Configuration Files

### `.chktexrc`
Custom ChkTeX configuration with:
- Suppressed warnings for CV-specific formatting
- Custom regex patterns for CV validation
- moderncv command recognition

### `Makefile`
Provides convenient commands:
- `make lint` - Run all linters
- `make lint-tex` - ChkTeX on all .tex files
- `make lint-bib` - Validate bibliography
- `make lint-verbose` - Detailed output
- `make check-refs` - Check undefined references

### `package.json`
NPM scripts for consistency:
```bash
npm run lint          # Run all linters
npm run lint:tex      # LaTeX files only
npm run lint:bib      # Bibliography only
npm run precommit     # Pre-commit checks
```

## VS Code Integration

If using VS Code with LaTeX Workshop extension:
1. Install the LaTeX Workshop extension
2. The `.vscode/settings.json` file configures:
   - Automatic ChkTeX integration
   - Custom build recipes
   - File associations

## GitHub Actions

The `.github/workflows/latex-lint.yml` workflow:
- Runs on every push and pull request
- Performs all linting checks
- Tests compilation
- Reports issues in PR comments

## Pre-commit Hooks

To enable pre-commit hooks:
```bash
# Install pre-commit
pip install pre-commit

# Install the git hook scripts
pre-commit install

# Run against all files
pre-commit run --all-files
```

## Common Issues and Solutions

### Issue: "Command terminated with space"
**Solution**: This warning is suppressed in `.chktexrc` as it's common in CV formatting.

### Issue: "Wrong length of dash"
**Solution**: Suppressed for CVs which use various dash styles.

### Issue: "DOI should be hyperlinked"
**Solution**: Custom rule alerts when DOIs aren't wrapped in `\href{}{}`.

### Issue: "Undefined references"
**Solution**: Run `make check-refs` after compilation to identify issues.

## Custom CV-Specific Rules

The configuration includes custom patterns for:
1. **DOI Links**: Ensures all DOIs use `\href{}{}`
2. **Author Name**: Checks that "Vatsal Sanjay" is bolded
3. **Date Formats**: Warns about inconsistent date formatting
4. **moderncv Commands**: Recognizes CV-specific commands

## Best Practices

1. **Run linting before commits**: Use `npm run precommit`
2. **Fix warnings incrementally**: Start with errors, then warnings
3. **Customize rules**: Add patterns to `.chktexrc` for your needs
4. **Use verbose mode**: `make lint-verbose` for debugging
5. **Keep bibliography clean**: Regular `make lint-bib` checks

## Troubleshooting

If linters aren't found:
```bash
# Check if installed
which chktex
which lacheck
which biber

# Update TeX distribution
tlmgr update --self
tlmgr update --all
```

For VS Code issues:
1. Reload window after installing extensions
2. Check LaTeX Workshop output panel
3. Ensure TeX distribution is in PATH