#! /bin/bash

PDFNAME="$1"
OUTPDFNAME="$2"
LASTPAGE="$3"
if (! [[ -f "$PDFNAME" ]]) || [[ -z "$LASTPAGE" ]]; then
  echo "usage: $0 pdf-in.pdf pdf-out.pdf last_page"
  exit 1
fi

set -e
set -x
pdftk ${PDFNAME} cat 1-$LASTPAGE output ${OUTPDFNAME}
