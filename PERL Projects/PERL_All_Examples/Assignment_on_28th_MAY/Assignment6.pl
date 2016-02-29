#!perl -w
use strict;
use Data::Dumper;

# to count the the not of times a char occures in a string
my $count=0;
my($text) = "mississippi";
print "\n Original String is  : ",$text,"\n";
$count = ($text =~ tr/s|S//);
print "There are $count no of : 's' in the string :$text \n";