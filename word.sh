wget -q https://www.merriam-webster.com/word-of-the-day
word=$(cat word-of-the-day | egrep '<div class="word-and-pronunciation">' -A 1 | egrep -o '<h1>[^<]*</h1>' | sed 's/<[^>]*>//g')
echo 'The word of the day is' $word
main=$(cat word-of-the-day | egrep '<span class="main-attr">' | sed 's/<[^>]*>//g')
echo 'It is a' $main
echo 'It means:'
cat word-of-the-day | egrep '<h2>Definition</h2>' -A 1 | sed 's/<[^>]*>//g' | sed "s/Definition//" | sed 's/^[^:]*://' | sed 's/^\s*/ /' | tr -d '\n'
echo
rm word-of-the-day
