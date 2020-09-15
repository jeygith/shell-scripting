#!/bin/bash

toconvert='/books/toconvert'
converted='/books/converted'

for f in ${toconvert}/*; do

  firstString=$f
  secondString=""
  fileName="${firstString/$toconvert/$secondString}"
  /usr/bin/ebook-convert "$f" "${converted}${fileName%.chm}.epub"
done


calibredb add --library-path /books /books/converted/* --duplicates && chown -R abc:abc /books
