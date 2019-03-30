wget -q https://www.eduro.com/

quote=$(cat index.html | egrep '<dailyquote>' -A 2 | head -3 | egrep '<p>' | sed 's/<[^>]*>//g')
printf 'The quote of the day is:''\n'
echo '"'$quote'"'
author=$(cat index.html | egrep '<p class="author">' -A 1 | sed 's/<[^>]*>//g' | sed 's/\&#8211; //g' | head -2 | tail -n 1 | sed 's/\&nbsp;//g' | sed 's/^ //')
echo '-'$author

rm index.html
