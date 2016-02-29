#!perl -w
#use strict;
use Data::Dumper;


my ($hostlists,@hostlist);

my $hostdata = "ab:cd:ef:gh";

@hostlist = split(':',$hostdata);

my (@subhost,@unsubhost);

#@hostnames = split (':', $hostname); 
#my @hostnames =('ab','cd','ef','gh');

print "\n Toatal element in hostlist : @hostlist\n";

foreach my $host(@hostlist) {
   chomp $host;
   print "\n Host in the Hostnames :$host \n";
   if ( $host eq ('ab'||'cd')) {
      push (@subhost,"$host:");
   	
   } else {
      push (@unsubhost,$host);
   
   }
}

print "\n Toal element in subhost : @subhost \n";

print "\n Toal element in unsubhost : @unsubhost \n";

@hostlist = @unsubhost;

print "\n Toal element in final hostlist : @hostlist \n";




   

