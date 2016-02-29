#!/usr/bin/perl
use strict;
use warnings;

my %grades = (
student1 => 90,
student2 => 75,
student3 => 96,
student4 => 55,
student5 => 76,
);

print "\n\tGRADES IN ASCENDING NUMERIC ORDER:\n";
foreach my $key (sort hashValueAscendingNum (keys(%grades))) {
print "\t\t$grades{$key} \t\t $key\n";
}

print "\n\tGRADES IN DESCENDING NUMERIC ORDER:\n";
foreach my $key (sort hashValueDescendingNum (keys(%grades))) {
print "\t\t$grades{$key} \t\t $key\n";
}
