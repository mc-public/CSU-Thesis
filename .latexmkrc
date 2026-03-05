# CSU-Thesis Latexmk File
$pdf_mode = 1;


$pdflatex = "xelatex -synctex=1 -output-driver=\"xdvipdfmx -z0\" -interaction=nonstopmode -file-line-error %O %S";
$lualatex = "xelatex -synctex=1 -output-driver=\"xdvipdfmx -z0\" -interaction=nonstopmode -file-line-error %O %S";
$xelatex = "xelatex -synctex=1 -output-driver=\"xdvipdfmx -z0\" -interaction=nonstopmode -file-line-error %O %S";

$bibtex = "biber %O %S";

$clean_ext = "bbl nav out snm vrb hd aux toc bcf run.xml xdv log synctex.gz synctex(busy)";

