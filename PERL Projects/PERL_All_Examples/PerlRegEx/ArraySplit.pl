#!/usr/bin/perl
use strict;
use warnings;

print "Hello, World...\n";
my @array_declared=('ab','cd','ef','gh');
my $newarr = split (",",@array_declared);
print $newarr;


use constant ARRAY => [ 1,2,3,4 ];
print ARRAY->[1];
ARRAY->[1] = " be changed";
print ARRAY->[1];

