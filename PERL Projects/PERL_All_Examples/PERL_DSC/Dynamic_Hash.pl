#!perl -w

use strict;
use Data::Dumper;
=pod
my %host_service = (
	       #'hostname' => {
		              'host1' => ['router','wlc'],
		               				               
		     	      'host2' => ['linux','wlc'],
		     	      
		     	      'host3' => ['router','linux'],
		               		
            #    	     },		               
	 );
=cut	





	 
my %hostPersonal={};	 
	 
#while (my ($key,$value)=each(%host_service->{'hostname'})) {
while (my ($key,$value)=each(%host_service)) {

    $hostPersonal{$value->[0]}="$key";
    #$hostPersonal{$value->[1]}="$key";
    
}

print "\n  NEW HASH ", Dumper \%hostPersonal;

my $hashserviceRef = \%host_service;
print Dumper $hashserviceRef;

print Dumper $hashserviceRef->{'hostname'}->{'host1'}->[0];

#my %revhash = reverse  %host_service;

#print Dumper \%revhash;


#my $service = ('router','wlc','lanswitch','linux');
#my $host = ('route','sumkuma2@cisco.com','lanswitch','nirpande@cisco.com','wlc','zabbas@cisco.com','router','pripatra@cisco.com');



=cut


=pod
use strict;
use warnings;

my %families = (Flintstone => [ qw(Pebbles)                    ],
                Simpson    => [ qw(Bart Lisa Maggie)           ],
                Keaton     => [ qw(Alex Mallory Jennifer Andy) ],
                sumit      => [qw()]);

for my $name (keys %families)
{
    my  $num_children = @{ $families{$name} };   # <-- Here's where it+ happens

    if ($num_children == 1)
    {
        print "There is $num_children child in the $name family\n";
    }
    else
    {
        print "There are $num_children children in the $name family\n";
    }
}
=cut