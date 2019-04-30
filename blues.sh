DATE=`date "+%b %d, %Y"`
echo "Today is" $DATE
wget -q https://www.cbssports.com/nhl/teams/STL/st-louis-blues/schedule/postseason/
GAMELEN=`cat index.html | egrep "$DATE" | wc -c`
if [ $GAMELEN -gt 2 ]
then
	echo "There is a blues game today"
else
	echo "There isn't a blues game today"
fi

rm index.html
