#!perl -w

use strict;

print "My first perl prog \n";

# strict pragma will complain about scope of the variable $name 
# $name  = "sumit";
#print $name;
my $myName = "Sumit kumar";
print "My name is : ",$myName;


my @arrElement =(1,2,3,4,5);
my $arrRef = \@arrElement;



print "\n Array elements are :",@$arrRef;

print "\n Path and name of current running Program file : \n",$0;

print "\n Under Perl Version :", $]," \n";



# prints all the environment variables and their values
print "\n ** # prints all the environment variables and their values **\n ";

foreach my $key( keys(%ENV))
{
        print "$key: $ENV{$key}\n";
}
