#!/bin/perl -w

use strict;
use Data::Dumper;

my $cfg = {
               'deploy_host' => ['eon-rtp3-1-l','eon-rtp3-2-l','eon-rch1-1-l','eon-rtp5-1-l'],

        };


#only one element
print "\n ::: $cfg->{deploy_host}->[0] ::: \n";


 # print the whole thing
 foreach my $key ( keys %$cfg ) {
 
 	if ($key eq 'deploy_host') {
 	    	
 	foreach my $i ( 0 .. $#{$cfg->{$key}} ) {
	         print " \n ::HOST:: $i = $cfg->{$key}[$i] :::";
     	}
        
        #print "$family: @{ $HoA{$family} }\n"
        }
 }

=pod
 # print the whole thing with indices
 foreach $family ( keys %HoA ) {
     print "family: ";
     foreach $i ( 0 .. $#{ $HoA{$family} } ) {
         print " $i = $HoA{$family}[$i]";
     }
     print "\n";
 }
 
 =cut