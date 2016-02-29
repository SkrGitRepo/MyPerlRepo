#!/bin/bash

f1='site_perl/EMAN/Service/Dialin2/REST.pm'
f2='site_perl/EMAN/Service/Dialin2/API.pm' 
f3='site_perl/EMAN/Service/Dialin2/tmpl/EmailTemporaryAccessCode.tmpl'

echo "changing directory to /tmp/temp_c"
echo 'cd /tmp/temp_c'
cd /tmp/temp_c

echo 'Updating cvs with DIALIN2_REST_API'
echo 'cvs up -r DIALIN2_REST_API'
cvs up -r DIALIN2_REST_API 

echo cp $f1 /usr/SD/perl/lib/$f1
cp $f1 /usr/SD/perl/lib/$f1

echo cp $f2 /usr/SD/perl/lib/$f2
cp $f2 /usr/SD/perl/lib/$f2

echo cp $f3 /usr/SD/perl/lib/$f3
cp $f3 /usr/SD/perl/lib/$f3
