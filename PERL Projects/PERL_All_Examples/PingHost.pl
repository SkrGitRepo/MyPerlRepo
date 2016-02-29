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

   eval {
   
   
   
   
   
   my $p=Net::Ping->new("icmp", $timeout) or die "\n Could not ping \n"; 
   my $valid_ip = $p->ping($host);
  # print "valid ip :i",$p->ping($host),"\n"; #$valid_ip\n";
  
   $validHost{$host} = $valid_ip;   
   print "$host is alive ","\n" if defined $valid_ip; #$validHost{$host};
   print "$host is not alive","\n" if undef $valid_ip;
   
   $p->close;
   };
  if ($@) {
  	print "\n Erro r:: Could not ping $@\n";
  }
#done

}
print Dumper \%validHost;