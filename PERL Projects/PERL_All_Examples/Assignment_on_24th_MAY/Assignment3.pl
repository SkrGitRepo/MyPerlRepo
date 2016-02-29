#!perl -w
use strict;
use Data::Dumper;
use lib './module_lib/';
use CommonModule;

my @array1 = (10, 20, 30, 40);
my @array2 = (50, 60, 70);


# passing two array to subroutine getArraySub1();
# passing the array ref since we can not directly pass the array as sub arguments.


print "\n \@array1  has ".@array1." elements before passing to SUB1 ", join ",",@array1;

print "\n \@array2  has ".@array2." elements before passing to SUB1 ", join ",",@array2;

print "\n";

my ($retRefSubArr1,$retRefSubArr2) = getArraySub1(\@array1, \@array2);


# Derefrencing the arrays ref to get the returned array values to respective arrays
my @retSubArr1 =@$retRefSubArr1;  
my @retSubArr2 =@$retRefSubArr2;

 
print "\n \n Finally returned \@array1 elements after passed to SUB :",join ",",@retSubArr1;
print "\n \n Finally returned \@array2 elements after passed to SUB :",join ",",@retSubArr2,"\n";


