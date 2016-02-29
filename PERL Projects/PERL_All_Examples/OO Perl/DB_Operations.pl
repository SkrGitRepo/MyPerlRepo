#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $sql="INSERT INTO test values(1005, 'Yogesh', '30th May 2012', 'Mumbai')";

my $object =DBUtil->new();
my  $insertRecord =$object->Insert($sql);

if ($insertRecord) {
	print "\n One record inserted Successfully \n ";
} else {
	print "\n Record insertion Failed ";
}
our $ch;
our $num1;
our $num2;


do
{
    print "\n ----------- Select the DB Operation you want to perform -----------\n ";
    print "\n Create table ; \t";
	   $num1 = <STDIN>;
	   chomp $num1;

	    if ($num1 =~ /^[+-]?\d+$/ ) 
	    {
              num2_entry();  # call for entry of second number
            } 
	    else
	    {
                print " Please enter the integer number only\n";
		num1_entry(); # call for reentry of first numer on wrong entry
            }
	
     } # end of num1_entry()


     sub num2_entry()
     {
	    print "\n Enter the second number : \t";
	    $num2 = <STDIN>;
	    chomp $num2;

	    if ($num2 =~ /^[+-]?\d+$/ ) 
	    {
                                    ;
            } 
	    else
	    {
                print " Please enter the integer number only \n ";
		num2_entry(); # call for rentry of second number
            }
    } # end of num2_entry(()

    print "\n Enter the arithmetic operators(+,-,*,/) : ";
    my $op=<STDIN>;
	chomp $op;
	if ($op eq "+")
	{
	
	    print "\n Sum of $num1 and $num2 = ", $num1+$num2;
	}
	elsif($op eq "-")
	{
	    print "\n Difference of $num1 and $num2 = ", $num1-$num2;
	}
	elsif($op eq "*")
	{
	    print "\n Product of $num1 and $num2 = ", $num1*$num2;
	}
	elsif($op eq "/")
	{
	    print "\n Division of $num1 and $num2 = ", (($num1)/($num2));
	}
	else
	{
	    print "\n Please enter specified operator only(+,-,* or /) .......!\n"
	}
	


    print "\n Do you want to calculate again(y/n) : \t ";
    $ch=<STDIN>;
    chomp $ch;

} while($ch eq "y" or $ch eq "Y");