#!perl -w
use strict;

# to convert the string into sentence case. e.g : Sumit KUMAR -> Sumit Kumar
my $string ="sumit KUMAR";

print "\n Conversion of string $string to Sentence Case pattern Using Regex : \n";

$string =~ s/(\w+)/\u\L$1/g;

print $string;

