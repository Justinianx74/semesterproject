wget -q https://www.eduro.com/

QUOTE=`cat index.html | egrep '<dailyquote>' -A 3 | head -4 | sed 's/<[^>]*>//g' | sed 's/^\s*//' | sed 's/\s*$//'`
printf 'The quote of the day is:''\n'
echo '"'$QUOTE'"'
AUTHOR=`cat index.html | egrep '<p class="author">' -A 1 | sed 's/<[^>]*>//g' | sed 's/\&#8211; //g' | head -2 | tail -n 1 | sed 's/\&nbsp;//g' | sed 's/^ //'`
echo '-'$AUTHOR

rm index.html
