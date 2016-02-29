#!perl


#<div id="framework-content-titles">	
#unless ($cli->cgi->referer() eq 'http://eman.cisco.com/OPDATA/AddressManagement/cli.pcgi') {
#print $cli->_error("Unknown Referer!");
#exit;
#}
my $foo = 'http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi/';
#http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi

#$foo =~ s/\/.+[\/]*$//;
#$foo =~ s/\/[^\/]+[\/]*$//;	


$foo =~ s/\/.+[\/]*$//;
$foo =~ s/\/[^\/]+[\/]*$//;	


#print $foo;
my $foo1 = 'http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi/';
my $foo2 = 'http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi';

print "$foo1\n";
print "$foo2\n";

$foo1 =~ s/\/[^\/]+[\/]*$//;
print "Foo1 :$foo1\n";
$foo2 =~ s/\/[^\/]+[\/]*$//;
print "Foo2 :$foo2\n";

#http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi/
#http://www-stage3.cisco.com/cgi-bin/eman/services/remote_token.pcgi
#http://www-stage3.cisco.com/cgi-bin/eman/services
#http://www-stage3.cisco.com/cgi-bin/eman/services
 
#Either URL, gets truncated to the base without .pcgi part.	 4:46 PM
#The form then becomes something like:	4:47 PM
                                 #<form action="$foo/remote_token.pcgi" method="post" id="pass_message">
                                 
                                 print $foo1.'/'."remote_token.pcgi" ;
