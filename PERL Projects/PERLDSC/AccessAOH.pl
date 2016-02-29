#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
my $AoH = [
        {
            Lead     => "fred",
            Friend   => "barney",
        },
        {
            Lead     => "george",
            Wife     => "jane",
            Son      => "elroy",
        },
        {
            Lead     => "homer",
            Wife     => "marge",
            Son      => "bart",
        }
  ];
  
  
  print Dumper @$AoH;
  
  foreach my $h (@$AoH) {
  	print $h->{'Lead'};
  }