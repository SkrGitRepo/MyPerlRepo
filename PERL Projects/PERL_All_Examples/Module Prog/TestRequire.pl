#!perl -w
use strict;

use lib './myTestLib/';

require Arithmetic;


# print "\n \t Sum :",add(3,5); #subroutine call without Module name is not allowed when use with require

print "\n  Sum :",Arithmetic::add(3,5);


my $Flag ="true";

if($Flag){

	# require (TestMod);  #when we use any lib conditionally we use require
	# require work with both module (.pm) and libraries (.pl)
	# it is done at runtime.
	#require TestMod; #its a module(.pm)
	require TestMod;
	require './myTestLib/TestMod.pl';  #its a library (.pl)
    
}


