#!perl -w
use strict;


#print " \n Multiplication of 2*3 = ",Arithmetic::multiply(2,3); #calling the sub multiply from module Arithmetic.
print " \n Sum of 2+3 = ",Arithmetic::add(2,3); #calling the sub add from module Arithmetic.
#print " \n Sum of 2+3 = ",add(2,3); #calling the sub add from module Arithmetic.



print "\n Printing Dumper value using 'USE' to include 'Data' lib path:\n ",Dumper("Sumit");

BEGIN {
    print "\n I am in BEGIN Block \n";
    unshift (@INC,"C:/CGISCO PERL COE Training Workspace/Module Prog/myTestLib");
    require Arithmetic; 
    #use Arithmetic;
    use Data::Dumper;
    print "\n Lib path Included in \@INC :\n",join "\n",@INC;
    
    
}