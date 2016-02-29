#!perl -w

use strict;
use Data::Dumper;

my %host_service = (
	       'hostname' => ['router','wlc','Linux'],
 );
	 
	 my $header = join (",",@{$host_service{'hostname'}});
	 print $header,"\n";

	 
print Dumper \%host_service->{'hostname'};
