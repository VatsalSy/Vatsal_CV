#!/usr/bin/env python3
import base64
import gzip
from pathlib import Path

b64 = Path("_tmp/Vatsal_CV.tex.gz.b64").read_text().strip()
Path("Vatsal_CV.tex").write_bytes(gzip.decompress(base64.b64decode(b64)))
print("decoded", Path("Vatsal_CV.tex").stat().st_size)
