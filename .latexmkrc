# Latexmk configuration for CV compilation
# Disable bibtex for CV files since they don't use citations

# For files matching CV pattern, don't run bibtex
if ($ARGV[0] =~ /CV\.tex$/) {
    $bibtex_use = 0;
}

# Clean up auxiliary files after compilation
$clean_ext = "aux log out toc bbl blg fdb_latexmk fls synctex.gz";