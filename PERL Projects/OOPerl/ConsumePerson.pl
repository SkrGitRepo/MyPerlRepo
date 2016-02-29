#!perl -w
use strict;
use lib './classes/';
use Person;

my $object = new Person( "Sumit", "Kumar", 23234345);
# Get first name which is set using constructor.
my $firstName = $object->getFirstName();

print "Before Setting First Name is : $firstName\n";

# Now Set first name using helper function.
$object->setFirstName( "S." );

# Now get first name set by helper function.
$firstName = $object->getFirstName();
print "After Setting First Name is : $firstName\n";