#!/usr/bin/perl

use strict;
use warnings;
use Term::ReadKey;

ReadMode( "noecho");
print "Enter pwd please :";
chomp (my $pwd = <>);
ReadMode ("original") ;
print "\nYou typed $pwd!\n";
