wget -q https://nationaltoday.com/what-is-today/

day=$(cat index.html | egrep -o '<h2 class="entry-title"><a [^>]*>[^<]*<[^>]*>' | sed 's/<[^>]*>//g' | sed 's/\&ndash;//')
echo 'It is '${day}'today'
rm index.html
