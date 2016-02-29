!#perl -w
use strict;


my $name ='sumit';
my $city ='';


#if (defined($name) && $name ne '') 
if ($name ne ''){
	print "My name is ",$name;
} else {
	print "Name is null";
}
