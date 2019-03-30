wget -q http://www.rssweather.com/zipcode/63103/wx.php
currentTemp=$(cat wx.php | egrep '<p class="temp">[0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}')
echo 'The current temperature is' $currentTemp
high=$(cat wx.php | egrep 'p class="temp high">High: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1)
echo 'The high today is' $high
low=$(cat wx.php | egrep 'p class="temp low">Low: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1)
echo 'The low today is' $low
summary=$(cat wx.php | egrep '<p class="summary">[^<]*</p>' | sed 's/<[^>]*>\([^<]*\)<\/p>/\1/')
echo "It's currently" ${summary,,} "right now"
tomhigh=$(cat wx.php | egrep 'p class="temp high">High: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -2 | tail -1)
tomlow=$(cat wx.php | egrep 'p class="temp low">Low: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -2 | tail -1)
echo 'Tomorrow there is a high of' $tomhigh', and  a low of' $tomlow
rm wx.php
