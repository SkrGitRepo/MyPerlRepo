#!perl -w

use strict;
use Data::Dumper;
use Net::Ping;

#my $hosts="eap-rch1-4-l.cisco.com";
#my $hotlist ="eap-rch1-4-l.cisco.com 


#my $PERL="/usr/bin/perl";

# Check to see if hosts are accessible.
open my $hostlist ,"< hostlist.txt";
my %validHost;
while(<$hostlist>) {
#for($hosts){
my $host = $_;
#do
	chomp($host);
   print $host,"\n";
   my $timeout=5; 

   eval
   {


my $valid_ip = `ping $host`;
unless ($!) { 
   print "$host is  alive","\n" ;
   $validHost{$host} = 1 ;
#   $p->close;
}
   };
  if ($@) {
  	print "\n Erro r:: Could not ping $@\n";
  }
#done

}
print Dumper \%validHost;