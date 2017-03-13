%.tex : %.md
	pandoc -S -f markdown -t latex -s $^ -o $@ ;\
	sed -i 's/\(\\usepackage{lmodern}\)/\%\1/' $@ ;\
        sed -i 's/\[T1\]{fontenc}/[T2A]{fontenc}/' $@ ;\
        sed -i 's/\(\\usepackage\[usenames,dvipsnames\]{color}\)/\1\n\\usepackage[english,russian]{babel}/' $@ ;\
	sed -i 's/documentclass\[\]/documentclass[a4paper]/' $@

%.pdf : %.tex
	pdflatex $^

MAIN : 	report-01.pdf
