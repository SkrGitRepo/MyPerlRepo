#!perl -w
use strict;
use Data::Dumper;

my %host_service = (
          'iosd' => [
          	      'rtp5-itnlab-gw1.cisco.com',
                      'bgl15-00-gw1.cisco.com'
                    ],
          'router' => [
                        'rtp5-itnlab-gw1.cisco.com',
                        'bgl15-00-gw1.cisco.com',
                        'bg216-00-gw1.cisco.com'
                      ],
          'lanswitch' => [
                           'bgl25-21-sw1.cisco.com',
                           'bgl15-00-gw1.cisco.com',
                           'bg215-00-gw1.cisco.com'
                         ]
        );


my ($service_type,$service_type1,$hostlist,$hostlist1);
=pod
 foreach my $service ( keys %host_service ) {
 
 $service_type = $service;
 $hostlist .= "@{$host_service{$service}}:";
    #print "\n Host to be passed $hostlist\n";
   process_host_service($service_type,$hostlist);
 
#print "$service: @{ $host_service{$service} }\n"
}
=cut


foreach my $service1 ( keys %host_service ) {
    print "I AM HERE";
    #$$hostlist1=undef;
    $service_type1 = $service1;
    foreach my $i ( 0 .. $#{$host_service{$service1} } ) {
        $hostlist1 .="$host_service{$service1}[$i]:";
        #print " $i = $host_service{$service1}[$i]";
    }
    process_host_service($service_type1,$hostlist1);
    $hostlist1=undef;
    print "\n";
}

=pod
while (my ($key,$value)=each(%host_service)) {
#foreach(my ($key,$value)=each(%host_service)) {
   $service_type = $key;
   $hostlist .="$value->[0]:";
   #print "\n Host to be passed $hostlist\n";
   process_host_service($service_type,$hostlist);
     
}
=cut
sub process_host_service {
my $service = shift;
my $hosts = shift;

print "\n  Service type is :$service for host(s): $hosts  \n";

}