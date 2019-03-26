#!/bin/bash 

## set date variables
_day=`date +%d`
_month=`date +%m`
_year=`date +%Y`
_url_dr1=http://xmltv.xmltv.se/dr1.dr.dk_${_year}-${_month}-${_day}.xml
_url_dr2=http://xmltv.xmltv.se/dr2.dr.dk_${_year}-${_month}-${_day}.xml
_url_dr3=http://xmltv.xmltv.se/dr3.dr.dk_${_year}-${_month}-${_day}.xml
_url_drk=http://xmltv.xmltv.se/k.dr.dk_${_year}-${_month}-${_day}.xml
_url_ultra=http://xmltv.xmltv.se/ultra.dr.dk_${_year}-${_month}-${_day}.xml
_url_ramasjang=http://xmltv.xmltv.se/ramasjang.dr.dk_${_year}-${_month}-${_day}.xml

## download file to current directory
wget -O epg_dr1.xml ${_url_dr1}
wget -O epg_dr2.xml ${_url_dr2}
wget -O epg_dr3.xml ${_url_dr3}
wget -O epg_drk.xml ${_url_drk}
wget -O epg_ultra.xml ${_url_ultra}
wget -O epg_ramasjang.xml ${_url_ramasjang}

## delete <tv> tags
sed -i '1,4d;$d' epg_dr1.xml
sed -i '1,4d;$d' epg_dr2.xml
sed -i '1,4d;$d' epg_dr3.xml
sed -i '1,4d;$d' epg_drk.xml
sed -i '1,4d;$d' epg_ultra.xml
sed -i '1,4d;$d' epg_ramasjang.xml

## combine files
cat epg_dr1.xml epg_dr2.xml epg_dr3.xml epg_drk.xml epg_ultra.xml epg_ramasjang.xml > epg.xml

## remove temp files
rm epg_dr1.xml
rm epg_dr2.xml
rm epg_dr3.xml
rm epg_drk.xml
rm epg_ultra.xml
rm epg_ramasjang.xml

## add <tv> tag
cat epg.xml >> channels.xml
rm epg.xml
mv channels.xml epg.xml
echo "</tv>" >> epg.xml


