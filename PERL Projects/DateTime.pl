use DateTime;

# this is a Data time calculation example
$dt = DateTime->from_epoch( epoch => $epoch );
$year   = $dt->year;
$month  = $dt->month; # 1-12 - you can also use '$dt->mon'
$day    = $dt->day; # 1-31 - also 'day_of_month', 'mday'
$dow    = $dt->day_of_week; # 1-7 (Monday is 1) - also 'dow', 'wday'
$hour   = $dt->hour; # 0-23
$minute = $dt->minute; # 0-59 - also 'min'
$second = $dt->second; # 0-61 (leap seconds!) - also 'sec'
$doy    = $dt->day_of_year; # 1-366 (leap years) - also 'doy'
$doq    = $dt->day_of_quarter; # 1.. - also 'doq'
$qtr    = $dt->quarter; # 1-4
$ymd    = $dt->ymd; # 1974-11-30
$ymd    = $dt->ymd('/'); # 1974/11/30 - also 'date'
$hms    = $dt->hms; # 13:30:00
$hms    = $dt->hms('|');