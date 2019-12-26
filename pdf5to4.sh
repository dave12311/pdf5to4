#!/bin/bash

if [[ $# -eq 2 ]]; then
	mkdir pdf_tmp
	pdftk ${1} burst output ./pdf_tmp/pg_%d.pdf
	gs -o ./pdf_tmp/left.pdf -sDEVICE=pdfwrite -g8400x5950 -c "<</PageOffset [0 0]>> setpagedevice" -f ./pdf_tmp/pg_1.pdf
	gs -o ./pdf_tmp/right.pdf -sDEVICE=pdfwrite -g8400x5950 -c "<</PageOffset [420 0]>> setpagedevice" -f ./pdf_tmp/pg_2.pdf
	pdftk ./pdf_tmp/left.pdf stamp ./pdf_tmp/right.pdf output ${2}
	rm -rf ./pdf_tmp
else
	echo "Usage: pdf5to4 input.pdf output.pdf"
fi																																																																																																																																																																																																																																																																																																																																																																																																																										
