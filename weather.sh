wget -q http://www.rssweather.com/zipcode/63103/wx.php
currentTemp=$(cat wx.php | egrep '<p class="temp">[0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}')
echo 'The current temperature is' $currentTemp
high=$(cat wx.php | egrep 'p class="temp high">High: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1)
echo 'The high today is' $high
low=$(cat wx.php | egrep 'p class="temp low">Low: [0-9]{1,3}&deg;F</p>' | egrep -o '[0-9]{1,3}' | head -1)
echo 'The low today is' $low
rm wx.php
