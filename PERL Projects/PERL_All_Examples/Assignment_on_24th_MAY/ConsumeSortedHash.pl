#!perl -w
use strict;
use Data::Dumper;
use lib './module_lib/';
use CommonModule;

print "\n *** This Program is to consume the Sorted Hash ***\n" ;
my %UnSortedHash = (
			 "20GB" => "20480MB",
                         "10GB" => "10240MB" ,
                         "40GB" => "40960MB",
                         "1GB" =>  "1024MB"
                   );


# passing the hash to subroutine 

my $SortedHashValues = sortHash(%UnSortedHash);  
print Dumper $SortedHashValues;