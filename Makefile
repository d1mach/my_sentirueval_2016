%.tex : %.md
	pandoc -t latex -s $^ -o $@ ;\
        sed -i 's/\[T1\]{fontenc}/[T2A]{fontenc}/' $@

%.pdf : %.tex
	pdflatex $^

MAIN : 	report-01.pdf
