#!/usr/bin/env perl
# latexmk is deal as perl script.

#$latex				= 'platex -synctex=1 %O %S';
$latex				= 'platex -synctex=1 -halt-on-error';
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex				= 'pbibtex %O %B';
$dvipdf				= 'dvipdfmx %O %S';
$pdf_mode			= 3;
$max_repeat		= 5;

if ($^O eq 'darwin') {
	$pdf_previewer = 'open -a Preview';
} elsif ($^O eq 'linux') {
	$pdf_previewer = 'evince';
}
