---
description: Add a new publication to CV files (main CV, short CV, and BibTeX)
allowed-tools: Read, Edit, Write, Bash(grep:*), Bash(wc:*), Bash(date:*)
argument-hint: [bibtex-text] [type: preprint|published]
---

# Add Publication to CV

Interactively add a new publication to all CV files with proper formatting.

**Arguments**: `$ARGUMENTS`

## Quick Reference

### Key Files
- **Main CV**: `./Vatsal_CV.tex`
- **Short CV**: `./Vatsal_CV-shortCV.tex`
- **Publications Only**: `./Vatsal_CV-publicationsOnly.tex`
- **BibTeX**: `./mypublications.bib`

### Current State
- Date: !`date +%Y-%m-%d`

## Workflow

### Step 1: Parse Input or Request BibTeX

If no BibTeX provided in arguments, ask:

> Please provide the BibTeX entry for the publication you want to add.

Parse the BibTeX entry to extract:
- Authors (all names)
- Title
- Journal
- Volume
- Article number/pages
- Year
- DOI

### Step 2: Determine Publication Type

If not specified in arguments, ask:

> Is this publication:
> 1. **preprint** - Add to "Works Under Review / In Preparation" section
> 2. **published** - Add to "Peer-Reviewed Publications" section

### Step 3: Gather Additional Information

Ask for any missing information:

**For all publications:**
- Page count: "How many pages is this publication? (e.g., 32 pages)"
- GitHub repository URL (optional): "Is there a GitHub repository? If yes, provide the URL"

**For published papers:**
- Is this Open Access (OA)? If not OA:
  - Ask for preprint/archived PDF URL for OA link

**For preprints:**
- Status: "What is the submission status?"
  - `submitted to [Journal]`
  - `arXiv preprint`
  - `to be submitted to [Journal]`
  - `in preparation`

**For special features:**
- Is this a journal cover?
- Is this an Editor's Suggestion/Choice?
- Any other special recognition?

### Step 4: Format for Main CV (Vatsal_CV.tex)

#### Published Paper Format (add to beginning of Peer-Reviewed section):

```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title],\\
[Journal abbrev.], [volume], [article#] ([year]) [[X pages]];\\
\faFile\hspace{0.2em}DOI: \href{[DOI URL]}{[DOI number]};\\
\faGithub\hspace{0.2em}\href{[GitHub URL]}{Repository}.
```

**For non-OA papers:**
```latex
\faLock\hspace{0.2em}DOI: \href{[DOI URL]}{[DOI number]}, \faFile\hspace{0.2em}OA: \href{[OA URL]}{[OA DOI or "archived pdf"]};\\
```

**For special features, add sub-items:**
```latex
see also
\begin{itemize}
    \item \faStar\hspace{0.2em}\textbf{Cover} of that volume of [Journal].
    \item \faStar\hspace{0.2em}Editor's Suggestion of that issue.
\end{itemize}
```

#### Preprint Format (add to Works Under Review section):

```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title],\\
[Status: "submitted to \textit{Journal}" or "arXiv preprint" or "to be submitted to [Journal]"],\\
\faFile\hspace{0.2em}DOI: \href{[DOI URL]}{[DOI number]};\\
\faGithub\hspace{0.2em}\href{[GitHub URL]}{Repository}.
```

### Step 5: Check for Existing Preprint (Published papers only)

For published papers, search the "Works Under Review" section for the same title or authors.

If found:
1. Remove the entry from "Works Under Review" section
2. Inform user: "Removed preprint entry from Works Under Review section"

### Step 6: Update Short CV (Vatsal_CV-shortCV.tex)

The short CV should contain ONLY the 7 most recent publications (by publication date).

1. Read current publications list from short CV
2. Determine if new publication should be in top 7 (based on year)
3. If yes, add new entry and remove oldest one

**Short CV format:**
```latex
\item [First Author] et al., \textbf{V. Sanjay}[if not first], [Short title], \textit{[Journal]} [volume], [article#] ([year]).
```

Or if Vatsal is first author:
```latex
\item \textbf{V. Sanjay}, [co-authors], [Short title], \textit{[Journal]} [volume], [article#] ([year]).
```

**Special notes in short CV:**
- Add `; \textbf{Cover}` after year if journal cover
- Keep entries concise (one line each)

### Step 6.5: Update Publications-Only CV (Vatsal_CV-publicationsOnly.tex)

**For published papers only** (skip this step for preprints):

1. Add the new publication to the beginning of the enumerate list
2. Use the **same full format** as the main CV (not condensed)

**Format (identical to main CV):**
```latex
\item [Authors with \textbf{Vatsal Sanjay} for self],\\
[Title],\\
[Journal abbrev.], [volume], [article#] ([year]) [[X pages]];\\
\faFile\hspace{0.2em}DOI: \href{[DOI URL]}{[DOI number]};\\
\faGithub\hspace{0.2em}\href{[GitHub URL]}{Repository}.
```

### Step 7: Update BibTeX (mypublications.bib)

Add the BibTeX entry at the beginning of the file (after the header comments).

Ensure proper formatting:
- Use standard BibTeX field names
- Include DOI field
- Use abbreviated journal names

### Step 8: Update Metrics

After adding a published paper, remind user to check:
- Total publication count in short CV: "Selected publications (X total, Y+ citations)"
- Any citation count updates needed

### Step 9: Compile and Verify

Remind user:
```bash
make all    # Compile both CVs
make lint   # Check for errors
```

## Author Formatting Rules

1. Use `\textbf{Vatsal Sanjay}` for self-citations in main CV
2. Use `\textbf{V. Sanjay}` in short CV
3. Full names for co-authors (First M. Last format)
4. Use "et al." in short CV for papers with many authors

## Journal Abbreviations

Common abbreviations used:
- Journal of Fluid Mechanics -> J. Fluid Mech.
- Physical Review Letters -> Phys. Rev. Lett.
- Physical Review Fluids -> Phys. Rev. Fluids
- Nature Communications -> Nat. Commun.
- Science Advances -> Sci. Adv.
- AIChE Journal -> AIChE J.
- Chemical Engineering Science -> Chem. Eng. Sci.
- Physics of Fluids -> Phys. Fluids
- Soft Matter -> Soft Matter
- PNAS -> PNAS
- Journal of Computational Physics -> J. Comput. Phys.

## Example Transformation

**Input BibTeX:**
```bibtex
@article{dixit2025viscoelastic,
    title={Viscoelastic Worthington jets and droplets produced by bursting bubbles},
    author={Dixit, Ayush K and Oratis, Alexandros T and Zinelis, Konstantinos and Lohse, Detlef and Sanjay, Vatsal},
    journal={J. Fluid Mech.},
    volume={1010},
    pages={A2},
    doi = {10.1017/jfm.2025.237},
    year={2025}
}
```

**Output for Main CV:**
```latex
\item Ayush K. Dixit, Alexandros T. Oratis, Konstantinos Zinelis, Detlef Lohse, and \textbf{Vatsal Sanjay},\\
Viscoelastic Worthington jets and droplets produced by bursting bubbles,\\
J. Fluid Mech., 1010, A2 (2025) [32 pages];\\
\faFile\hspace{0.2em}DOI: \href{https://doi.org/10.1017/jfm.2025.237}{10.1017/jfm.2025.237};\\
\faGithub\hspace{0.2em}\href{https://github.com/comphy-lab/Viscoelastic-Worthington-jets-and-droplets-produced-by-bursting-bubbles}{Repository}.
```

**Output for Short CV:**
```latex
\item A.K. Dixit et al., \textbf{V. Sanjay}, Viscoelastic Worthington jets, \textit{J. Fluid Mech.} 1010, A2 (2025).
```

## Error Handling

- If DOI is missing: Warn and request DOI
- If journal not recognized: Ask for proper abbreviation
- If page count missing: Ask for page count
- If duplicate entry found: Warn and ask for confirmation

## Success Criteria

- [ ] BibTeX entry added to mypublications.bib
- [ ] Main CV updated with properly formatted entry
- [ ] Short CV updated if publication is in top 7 most recent
- [ ] Publications-only CV updated (for published papers only)
- [ ] If published: checked and removed any preprint version
- [ ] User reminded to compile and verify
