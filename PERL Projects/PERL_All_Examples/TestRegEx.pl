#!perl -w
use strict;
use Data::Dumper;
# to substitute the all digit to null
my $strdig ="May 28th 2012?";
$strdig =~s/\d//g;

# to count the the not of times a char occures in a string
my $count=0;
my($text) = "mississippi";
$count = ($text =~ tr/s|S//);
print "There are $count no of : 's' in the string :$text \n";



# to convert the string into sentence case. e.g : Sumit KUMAR -> Sumit Kumar
my $string ="sumit KUMAR  is a software engineer";

#$string =~(s/.*/\L&/);

#$string =~(s/(\b)([a-z])/\1\u\2/g);
#$string =~s/([a-z])(([a-z]|[A-Z])+)/sprintf("%s%s",uc("$1"),lc("$2"))/ge;

#$string =~s/(\S)([\S]+)/sprintf("%s%s", uc("$1"),lc("$2"))/ge;
$string =~s/\b([a-z])/\u$1/g;




 
 
 
 
 
 
 
 
 print $strdig,"\n";

print $string;

