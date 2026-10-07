#!/usr/bin/env python3
from pathlib import Path
chunks = Path('_tmp/cv-tex-chunks')
out = Path('Vatsal_CV.tex')
n = len(list(chunks.glob('*.tex')))
parts = [chunks.joinpath(f'{i}.tex').read_text(encoding='utf-8') for i in range(n)]
out.write_text(''.join(parts), encoding='utf-8')
print(f'Wrote {out} ({out.stat().st_size} bytes)')
