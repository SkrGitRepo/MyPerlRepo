#!/usr/SD/perl/bin/perl

use strict;
use XML::XPath;
#use XML::XPath::XMLParser;
#use XML::XPath::NodeSet;
use Data::Dumper;
=pod
my $xp = XML::XPath->new( filename => "testxml.xml" );
my $xpath = join( "","/COUNTRY/CITY/");
my $state = $xp->find('/COUNTRY/CITY/@state');
#print $state;
my $city_name = $xp->getNodeText( $xpath . "/NAME" );

print "\n NAME of CITY is  : ",$city_name,"under State :$state\n";

=cut

my $xp = XML::XPath->new( filename => "CPO_Config.xml" );
    my $xpath = join( "","/CPO/INSTANCE/");
    my $USERNAME = $xp->getNodeText( $xpath . "/username");
    my $CPO_Instance = $xp->find('/CPO/INSTANCE/@type');
    chomp($CPO_Instance);
    
    print $CPO_Instance;
    
    my $node1 = $xp->find('/CPO/INSTANCE/NODE/@id');
    chomp($node1);
    
    print "\n $node1 \n";
#exit;
    if ($CPO_Instance eq "dev") {
#        if ($node1 eq 'node1') {
            my $NODE1 = $xp->find('/CPO/INSTANCE/NODE1/@host');
            my $USERNAME = $xp->getNodeText( $xpath . "/NODE1/username");
            my $PASSWORD = $xp->getNodeText( $xpath . "/NODE1/password");
            print " \n NODE 1 details :$NODE1 and $USERNAME and $PASSWORD \n";
 #       }
#       my $node2 = $xp->find('/CPO/INSTANCE/NODE/@id');
#       chomp($node2);

#       if ( $node2 eq 'node2') {
            my $NODE2 = $xp->find('/CPO/INSTANCE/NODE2/@host');
            my $USERNAME = $xp->getNodeText( $xpath.'/NODE2/username');
            my $PASSWORD = $xp->getNodeText( $xpath.'/NODE2/password');
            print "\n NODE 2 details :$NODE2 and $USERNAME and $PASSWORD \n";

        #}
    }



