# Makefile for LaTeX CV compilation and linting

# Color definitions
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
BLUE := \033[0;34m
NC := \033[0m # No Color

# Main targets
.PHONY: all clean lint help cv shortcv lint-tex lint-bib lint-lacheck check-refs

# Default target
all: lint cv shortcv

# Compile main CV
cv:
	@echo "$(BLUE)📄 Compiling Vatsal_CV.tex...$(NC)"
	@pdflatex -interaction=batchmode Vatsal_CV.tex > Vatsal_CV.build.log 2>&1 || (echo "$(RED)✗ Compilation failed!$(NC)" && cat Vatsal_CV.build.log && rm -f Vatsal_CV.build.log && exit 1)
	@pdflatex -interaction=batchmode Vatsal_CV.tex >> Vatsal_CV.build.log 2>&1 || (echo "$(RED)✗ Compilation failed!$(NC)" && cat Vatsal_CV.build.log && rm -f Vatsal_CV.build.log && exit 1)
	@echo "$(GREEN)✓ Vatsal_CV.pdf compiled successfully$(NC)"
	@rm -f Vatsal_CV.build.log
	@$(MAKE) clean

# Compile short CV
shortcv:
	@echo "$(BLUE)📄 Compiling Vatsal_CV-shortCV.tex...$(NC)"
	@pdflatex -interaction=batchmode Vatsal_CV-shortCV.tex > Vatsal_CV-shortCV.build.log 2>&1 || (echo "$(RED)✗ Compilation failed!$(NC)" && cat Vatsal_CV-shortCV.build.log && rm -f Vatsal_CV-shortCV.build.log && exit 1)
	@pdflatex -interaction=batchmode Vatsal_CV-shortCV.tex >> Vatsal_CV-shortCV.build.log 2>&1 || (echo "$(RED)✗ Compilation failed!$(NC)" && cat Vatsal_CV-shortCV.build.log && rm -f Vatsal_CV-shortCV.build.log && exit 1)
	@echo "$(GREEN)✓ Vatsal_CV-shortCV.pdf compiled successfully$(NC)"
	@rm -f Vatsal_CV-shortCV.build.log
	@$(MAKE) clean

# Lint all LaTeX files
lint:
	@echo "$(BLUE)🔍 Running ChkTeX linter...$(NC)"
	@chktex Vatsal_CV.tex > lint.log 2>&1 || true
	@chktex Vatsal_CV-shortCV.tex >> lint.log 2>&1 || true
	@if grep -E "Warning|Error" lint.log > /dev/null 2>&1; then \
		echo "$(YELLOW)⚠  Linting issues found:$(NC)"; \
		grep -E "Warning|Error" lint.log | sed 's/Warning/$(YELLOW)Warning$(NC)/g' | sed 's/Error/$(RED)Error$(NC)/g'; \
		echo "$(YELLOW)📋 Full details saved in lint.log$(NC)"; \
	else \
		echo "$(GREEN)✓ No linting issues found$(NC)"; \
		rm -f lint.log; \
	fi

# Lint with verbose output
lint-verbose:
	@echo "Running ChkTeX with verbose output..."
	chktex -v0 Vatsal_CV.tex
	chktex -v0 Vatsal_CV-shortCV.tex

# Clean auxiliary files
clean:
	@rm -f *.aux *.bbl *.blg *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz *.build.log

# Lint only TeX files
lint-tex:
	@echo "$(BLUE)🔍 Linting .tex files...$(NC)"
	@chktex -q Vatsal_CV.tex Vatsal_CV-shortCV.tex || true
	@echo "$(GREEN)✓ TeX linting completed$(NC)"

# Lint bibliography files
lint-bib:
	@echo "$(BLUE)🔍 Checking bibliography files...$(NC)"
	@if [ -f mypublications.bib ]; then \
		bibtex -terse Vatsal_CV 2>&1 | grep -E "Warning|Error" || echo "$(GREEN)✓ No bibliography issues found$(NC)"; \
	else \
		echo "$(YELLOW)⚠  No bibliography file found$(NC)"; \
	fi

# Run lacheck linter
lint-lacheck:
	@echo "$(BLUE)🔍 Running lacheck...$(NC)"
	@if command -v lacheck >/dev/null 2>&1; then \
		lacheck Vatsal_CV.tex || true; \
		lacheck Vatsal_CV-shortCV.tex || true; \
		echo "$(GREEN)✓ lacheck completed$(NC)"; \
	else \
		echo "$(YELLOW)⚠  lacheck not installed$(NC)"; \
	fi

# Check references
check-refs:
	@echo "$(BLUE)🔍 Checking references...$(NC)"
	@grep -E "\\\\(ref|cite)" Vatsal_CV.tex Vatsal_CV-shortCV.tex | grep -v "%" | \
		if grep -E "\\?\\?" > /dev/null 2>&1; then \
			echo "$(RED)✗ Undefined references found$(NC)"; \
			exit 1; \
		else \
			echo "$(GREEN)✓ All references defined$(NC)"; \
		fi

# Help target
help:
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(BLUE)         LaTeX CV Makefile Commands$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "  $(GREEN)all$(NC)          - Run linter and compile both CVs"
	@echo "  $(GREEN)cv$(NC)           - Compile main CV"
	@echo "  $(GREEN)shortcv$(NC)      - Compile short CV"
	@echo "  $(GREEN)lint$(NC)         - Run ChkTeX linter on all .tex files"
	@echo "  $(GREEN)lint-tex$(NC)     - Lint only .tex files"
	@echo "  $(GREEN)lint-bib$(NC)     - Check bibliography files"
	@echo "  $(GREEN)lint-lacheck$(NC) - Run lacheck linter"
	@echo "  $(GREEN)check-refs$(NC)   - Check for undefined references"
	@echo "  $(GREEN)lint-verbose$(NC) - Run ChkTeX with detailed output"
	@echo "  $(GREEN)clean$(NC)        - Remove auxiliary files"
	@echo "  $(GREEN)help$(NC)         - Show this help message"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"