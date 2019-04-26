wget -q http://www.rssweather.com/zipcode/63103/wx.php
CURRENTTEMP=`cat wx.php | egrep '<p class="temp">[0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}'`
echo 'The current temperature is' $CURRENTTEMP
HIGH=`cat wx.php | egrep 'p class="temp high">High: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1`
echo 'The high today is' $HIGH
LOW=`cat wx.php | egrep 'p class="temp low">Low: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1`
echo 'The low today is' $LOW
SUMMARY=`cat wx.php | egrep '<p class="summary">[^<]*</p>' | sed 's/<[^>]*>\([^<]*\)<\/p>/\1/'`
echo "It's currently" ${SUMMARY,,} "right now"
TOMHIGH=`cat wx.php | egrep 'p class="temp high">High: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -2 | tail -1`
TOMLOW=`cat wx.php | egrep 'p class="temp low">Low: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -2 | tail -1`
echo 'Tomorrow there is a high of' $TOMHIGH', and  a low of' $TOMLOW
rm wx.php
