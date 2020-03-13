#!/bin/bash

# Parse input
SRC=${1%.*}

# Set up files to process
TEX=${SRC}.tex
AUX=${SRC}.aux
BBL=${SRC}.bbl
BLG=${SRC}.blg
LOG=${SRC}.log
PDF=${SRC}.pdf

# Clean target
if [ -n ${2} -a ${2} = "clean" ]; then
    echo rm ${AUX} ${BBL} ${BLG} ${LOG} ${PDF}
    rm ${AUX} ${BBL} ${BLG} ${LOG} ${PDF}
    exit
fi

# Make target
pdflatex ${TEX}
bibtex   ${AUX}
pdflatex ${TEX}
pdflatex ${TEX}
mupdf    ${PDF}
