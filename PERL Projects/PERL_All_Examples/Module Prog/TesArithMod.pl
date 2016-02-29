#!perl -w
use strict;


# lib pragma here tells and also add this lib path to @INC,  where exactly to look for lib(.pm) file : in this case :Arithmetic.pm
#use lib './myTestLib/'; #its a relative path
#use Data::Dumper;
#use Arithmetic; # use  only works with module(.pm) file.
                #use is done at compile time.

#use TestMod;  #not allowed when .pm file require conditionally
              



=head
my $Flag ="true";

if($Flag){

	# require (TestMod);  #when we use any lib conditionally we use require
	# require work with both module (.pm) and libraries (.pl)
	# it is done at runtime.
	#require TestMod; #its a module(.pm)
	require TestMod;
	require './myTestLib/TestMod.pl';  #its a library (.pl)
    
}
=cut

#print " \n Sum of 2+3 = ",add(2,3); #calling the sub add from module Arithmetic.


print "\n\n ** All included lib directory path: in \@INC var **\n";

# It will print all the included lib path in @INC
print " All inluded lib path in \@INC :\n",join "\n",@INC;

#print "All inluded lib path in \%INC as (key,value) association  : \n",Dumper (\%INC);

do Arithmetic; # 'do' will not look in @INC whether the lib is loaded or not, it happens at run time.

print " \n Multiplication of 2*3 = ",Arithmetic::multiply(2,3); #calling the sub multiply from module Arithmetic.

BEGIN {

    print "I am in BEGIN Block";
    unshift (@INC,"C:/CGISCO PERL COE Training Workspace/Module Prog/myTestLib");
    require Arithmetic; 
}
