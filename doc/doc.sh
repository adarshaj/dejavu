#!/bin/bash
#
# (very) ugly doc generator
#

fend=
rm /tmp/q /tmp/_doc

grep \ \\* $1 -C5 | while read line; do
  (printf "$line" | grep '*/$') && fend=y && continue
  (printf "$line" | grep '* ') && printf "$line\n" >> /tmp/q

  if [ ! -z $fend ]; then
    printf "\n## $line\n" >> /tmp/_doc && cat /tmp/q >> /tmp/_doc && echo ''>/tmp/q
    fend=""
  fi

done

docfile=`basename $1`.md
rm $docfile
cat /tmp/_doc | sed 's:^\/* *\* ::' | sed s:prototype\.:: | sed 's: *=* *function::' | sed 's: *{$::' > $docfile
gedit $docfile

# replace "## \n\n" with "# "
