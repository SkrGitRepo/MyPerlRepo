#!/usr/SD/perl/bin/perl

use strict;
use XML::XPath;
#use XML::XPath::XMLParser;
#use XML::XPath::NodeSet;
use Data::Dumper;
use XML::Simple;
use File::Basename;


  my $filename = 'CPO_Deploy_Config.xml';

   my $dir  = XMLin($filename,
      ForceArray => 1,
      KeyAttr    => {},
  );
  
  foreach my $file (@{$dir->{file}}) {
      print $file->{LocalSrcDir}->[0], "\n" ;
      print $file->{RemoteUser}->[0], "\n" ;
      print $file->{RemoteHost}->[0], "\n" ;
  }


my $destfile = 'applications/prime_optical/cpo_apps/scripts/db_backup_scripts';
my $dirname  = basename($destfile);


print "\n:::",$dirname,"::::\n";

=pod
my $xp = XML::XPath->new( filename=>"CPO_Deploy_Config.xml" );
my $xpath = join( "","/FILES/");

#my $nodeset = $xp->find('/FILES'); # find all paragraphs


#print Dumper $nodeset;
#exit;
    
    foreach my $node ($nodeset->get_nodelist) {
        print "FOUND\n\n", 
            XML::XPath::XMLParser::as_string($node),
            "\n\n";
    }


exit;

=cut
#my FILE_No = $xp->find('/COUNTRY/CITY/@state');
#print $state;
#my $city_name = $xp->getNodeText( $xpath . "/NAME" );

#print "\n NAME of CITY is  : ",$city_name,"under State :$state\n";


=pod
my $xp = XML::XPath->new( filename => "CPO_Config.xml" );
    my $xpath = join( "","/CPO/INSTANCE/");
    my $USERNAME = $xp->getNodeText( $xpath . "/username");
    my $CPO_Instance = $xp->find('/CPO/INSTANCE/@type');
    chomp($CPO_Instance);
    my $node1 = $xp->find('/CPO/INSTANCE/NODE/@id');
    chomp($node1);
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
=cut

=pod
------------------------------------------


<CPO>
    <INSTANCE type="dev">
        <NODE1 host="eon-rtp3-1-l">
            <username>system</username>
            <password>manager</password>
        </NODE1>
        <NODE2 host="eon-rtp3-2-l">
            <username>system</username>
            <password>manager</password>
        </NODE2>
    </INSTANCE>
<!--    <INSTANCE type="prod">
        <NODE1 host="eon-rtp3-1-l">
            <username>system</username>
            <password>manager</password>
        </NODE1>
        <NODE2 host="eon-rtp3-2-l">
            <username>system</username>
            <password>manager</password>
        </NODE2>
    </INSTANCE> -->
</CPO>
=cut