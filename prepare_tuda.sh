#!/bin/bash

rm -f tuda_templates.zip
mkdir -p texmf
rm -rf texmf/*

mkdir -p texmf/doc/latex/tuda-ci
cd example
latexmk --lualatex
mv DEMO-*.pdf ../texmf/doc/latex/tuda-ci
cd ..

mkdir -p texmf/tex/latex/tuda-ci
cp -r tex/. texmf/tex/latex/tuda-ci/.
cp tuda_logo.pdf texmf/tex/latex/tuda-ci/.

mkdir -p texmf/doc/latex/tuda-ci/example
cp example/*.tex texmf/doc/latex/tuda-ci/example/.
cp example/*.lco texmf/doc/latex/tuda-ci/example/.
cp example/*.bib texmf/doc/latex/tuda-ci/example/.

cp README.md texmf/doc/latex/tuda-ci/.

./addlicense.sh

cd texmf
zip -ll -y -r tuda_templates.zip doc tex

mv tuda_templates.zip ../.