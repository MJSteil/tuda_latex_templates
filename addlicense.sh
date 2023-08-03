#!/bin/bash
fileversion="3.30"
filedate=$(date '+%Y/%m/%d')

cd texmf/tex/latex/tuda-ci
echo $filedate
for filename in *.sty *.cls *.def *.cfg *paper.clo
do
    echo $filename
    (sed  "s/<FILENAME>/$filename/; s/<FILEDATE>/$(date '+%Y\/%m\/%d')/; s/<FILEVERSION>/$fileversion/" ../../../../LICENSE_info && cat $filename) >> tmp_license.txt
    mv tmp_license.txt $filename
	
	echo $filename
    (sed  "s/<FILENAME>/$(basename $filename)/; s/<FILEDATE>/$(date '+%Y\/%m\/%d')/; s/<FILEVERSION>/$fileversion/" ../../../../FILEINFO_header && cat $filename) >> tmp_license.txt
    mv tmp_license.txt $filename
	
done
cd  ../../../../

cd texmf/doc/latex/tuda-ci/example
for filename in *.tex *.bib *.lco
do
    echo $filename
    (cat ../../../../../LICENSE_info-demo && cat $filename ) >> tmp_license.txt
    mv tmp_license.txt $filename
	
	echo $filename
    (sed  "s/<FILENAME>/$(basename $filename)/; s/<FILEDATE>/$(date '+%Y\/%m\/%d')/; s/<FILEVERSION>/$fileversion/" ../../../../../FILEINFO_header && cat $filename) >> tmp_license.txt
    mv tmp_license.txt $filename
	
done
cd ../../../../../
rm tmp_license.txt