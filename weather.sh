wget -q http://www.rssweather.com/zipcode/63103/wx.php
currentTemp=$(cat wx.php | egrep '<p class="temp">[0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]*')
echo 'The current temperature is' $currentTemp

rm wx.php
