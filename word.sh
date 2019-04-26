wget -q https://www.merriam-webster.com/word-of-the-day
WORD=`cat word-of-the-day | egrep '<div class="word-and-pronunciation">' -A 1 | egrep -o '<h1>[^<]*</h1>' | sed 's/<[^>]*>//g'`
echo 'The word of the day is' $WORD
MAIN=`cat word-of-the-day | egrep '<span class="main-attr">' | sed 's/<[^>]*>//g'`
echo 'It is a' $MAIN
printf 'It means "'
cat word-of-the-day | egrep '<h2>Definition</h2>' -A 1 | sed 's/<[^>]*>//g' | sed "s/Definition//" | sed 's/^[^:]*://' | sed 's/^\s*/ /' | tr -d '\n' | sed 's/: //g' | sed 's/^ *//' | sed 's/^.*$/&"/'
echo
rm word-of-the-day
