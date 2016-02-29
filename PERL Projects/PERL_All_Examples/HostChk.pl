 #!perl -w
 
 use strict;
 use Data::Dumper;
 my $hostname = 'trn5-sw1.cisco.com';
 
 
 
 my @hostnames = split (':', $hostname);
 
 print Dumper \@hostnames; 
 
 foreach(@hostnames) {
 	$hostname =~ s/^\s*(\S+).*/$1/;
 	
 }
 
 print "\n\nHost : $hostname\n";