#!/usr/bin/perl
use strict;
use warnings;

print "Hello, World...\n";


my $num;


foreach  my $id (1..12) {
		$num = ($id =~ /[2]/) ? 'true' : 'false';
}


print "NUMM ::$num";