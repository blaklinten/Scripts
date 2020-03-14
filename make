#!/bin/bash

# Parse input
SRC=${}

# Set up files to process
TEX=${SRC}.tex
AUX=${SRC}.aux
BBL=${SRC}.bbl
BLG=${SRC}.blg
LOG=${SRC}.log
PDF=${SRC}.pdf

# Clean target
if [ -n ${1} -a ${1} = "clean" ]; then
    rm -v ${AUX} ${BBL} ${BLG} ${LOG} ${PDF}
    exit
fi

# Make target
pdflatex ${TEX}
bibtex   ${AUX}
pdflatex ${TEX}
pdflatex ${TEX}
mupdf    ${PDF}
