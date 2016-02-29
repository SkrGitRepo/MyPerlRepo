#!perl -w
use strict;
use Data::Dumper;

use strict;
use XML::XPath;
#use XML::XPath::XMLParser;
use XML::XPath::NodeSet;
use Data::Dumper;
=pod
my $xp = XML::XPath->new( filename => "testxml.xml" );
my $xpath = join( "","/COUNTRY/CITY/");
my $state = $xp->find('/COUNTRY/CITY/@state');
#print $state;
my $city_name = $xp->getNodeText( $xpath . "/NAME" );

print "\n NAME of CITY is  : ",$city_name,"under State :$state\n";


=cut
my $xp1 = XML::XPath->new( filename => "CPO_Config.xml" );
    my $xpath1 = join( "","/CPO/INSTANCE/");
    my $USERNAME = $xp1->getNodeText( $xpath1 . "/username");
    my $CPO_Instance = $xp1->find('/CPO/INSTANCE/@type');
    chop $CPO_Instance;
    print Dumper $CPO_Instance;
    #my $node1 = $xp1->find('/CPO/INSTANCE/NODE/@id');
    #chomp($node1);
#exit;
    if ($CPO_Instance eq "dev") {
#        if ($node1 eq 'node1') {
            my $NODE1 = $xp1->find('/CPO/INSTANCE/NODE1/@host');
            my $USERNAME = $xp1->getNodeText( $xpath1 . "/NODE1/username");
            my $PASSWORD = $xp1->getNodeText( $xpath1 . "/NODE1/password");
            print " \n NODE 1 details :$NODE1 and USERNAME :$USERNAME , PASSWORD :$PASSWORD \n";
 #       }
#       my $node2 = $xp->find('/CPO/INSTANCE/NODE/@id');
#       chomp($node2);

#       if ( $node2 eq 'node2') {
            my $NODE2 = $xp1->find('/CPO/INSTANCE/NODE2/@host');
            #my $USERNAME = $xp1->getNodeText( $xpath1.'/NODE2/username');
            #my $PASSWORD = $xp1->getNodeText( $xpath1.'/NODE2/password');
            print "\n NODE 2 details :$NODE2 and $USERNAME and $PASSWORD \n";

        #}
    }