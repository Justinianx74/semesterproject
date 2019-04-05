#start
wget -q www.cbssports.com/nhl/scoreboard/
newline=$(cat index.html | egrep '<a href="/nhl/scoreboard/' | tail -3 | head -1 | egrep -o '/nhl/scoreboard/[^/]*/' | sed 's/.*/wget -q www.cbssports.com&/')
rm index.html
echo $newline | bash -s
