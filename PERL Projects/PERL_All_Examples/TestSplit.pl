#!perl

use strict;
use warnings;



my $Fullname = 'Sumit::Kumar';

my ($fname,$lname ) = split /::/,$Fullname;


print "My First_Name is : $fname \n And \nLast_Name is :$lname \n";