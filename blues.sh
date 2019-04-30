DATE=`date "+%b %d, %Y"`
echo "Today is" $DATE
wget -q https://www.cbssports.com/nhl/teams/STL/st-louis-blues/schedule/postseason/
GAMELEN=`cat index.html | egrep "$DATE" | wc -c`
if [ $GAMELEN -gt 2 ]
then
	printf "There is a Blues game today\n\n"
else
	printf "There isn't a Blues game today\n\n"
fi
TOMORROW=`date --date="next day" "+%b %d, %Y"`
TOMLEN=`cat index.html | egrep "$TOMDATE" | wc -c`
echo "Tomorrow is" $TOMORROW
if [ $TOMLEN -gt 2 ]
then
	printf "There is a Blues game tomorrow\n\n"
else
	printf "There isn't a Blues game tomorrow\n\n"
fi
rm index.html
