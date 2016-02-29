#!perl -w
use strict;
use Data::Dumper;

=pod
my $hostname = "AAA AuthZ Service @ wwwin-tools.cisco.com--195869";
my( $appl, $host )   = split( /\@/, $hostname );
print "\n BEFORE :: APPL:$appl and HOST:$host\n";
$host =~ s/--.+//;
print "\n AFTER ::: APPL:$appl and HOST:$host\n";

exit(0);

#Trim whitespace begining and end of string


my $text = "Partner Registration &Profile (1.0)";
$text =~ s/\&//g;

print "\n TEXT is :$text\n";

exit;
=cut

my $hostname ="whi01-wan-gw1.cisco.com";

$hostname =~ s/\..*//;
print "\n =>>>>>> HOSTNAME ::$hostname\n";

my $string = "     Sumit Kumar          ";
$string =~ s/^\s+|\s+$//g;
print "\n STRING::$string\n";

my ($cfg) = {};
my $manager  = "sumit";
my $avmet_group ='OFF-Available';
my $line='<!-- Product Data Management &amp; Environmental Compliance\n(ItService)&#45;&gt;Environment Compliance (1.0)\n(ItServiceOffering) -->';
if($line =~ /\<\!\-\-/) {
	print "\n I am INN \n";
	next if ($line =~ /ItProjects/);
	if($line =~ /\&\#45;\&gt;/){
		print "\n I am INN 2 \n";
		if($line =~ /\<\!\-\- (.+)\\n.+gt;(.+)\\n.+ \-\-\>/){
			my ($service) = $1;
			my ($offering) = $2;
			print "\n SERVICE ::$service\n";
			print "\n OFFERING ::$offering\n";
			$service =~ s/&amp;/&/g;
			$service =~ s/&\#45;/\-/g;
			$service = lc($service);
			print "\n SERVICE After subst::$service\n";
			#$cfg->{services} = $service;
			#$cfg->{services}->{$service}->{offerings} = $offering;
			$cfg->{services}->{$service}->{people} = $manager;
			$cfg->{services}->{$service}->{offerings}->{$offering}->{avmet_group} = $avmet_group;
			print "OFFERING::::: ",$cfg->{services}->{$service}->{offerings};
			print "\nPEOPLE::$cfg->{services}->{$service}->{people}\n";
			
    			$offering =~ s/&amp;/&/g;
    			$offering =~ s/&\#45;/\-/g;
    			print "\n OFFERING After subst::$offering\n";
    			if($offering =~ /\d.\d/) {
    				print "\n Offering contain digit\n";
    			}
		}
		
	}
	print Dumper $cfg;
} else {
	print "\n Not INN  \n"
}
