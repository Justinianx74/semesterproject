DATE=`date "+%b%_d, %Y"`
echo "Today is" $DATE
wget -q https://www.cbssports.com/nhl/teams/STL/st-louis-blues/schedule/postseason/
GAMELEN=`cat index.html | egrep "$DATE" | wc -c`
if [ $GAMELEN -gt 0 ]
then
	printf "There is a Blues game today\n\n"
else
	printf "There isn't a Blues game today\n\n"
fi
TOMDATE=`date --date="next day" "+%b%_d, %Y"`
TOMLEN=`cat index.html | egrep "$TOMDATE" | wc -c`
echo "Tomorrow is" $TOMDATE
if [ $TOMLEN -gt 0 ]
then
	printf "There is a Blues game tomorrow\n\n"
else
	printf "There isn't a Blues game tomorrow\n\n"
fi
rm index.html
