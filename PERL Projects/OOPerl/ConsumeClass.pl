#!perl -w
use strict;
use Class;

#my $object =BaseClass->new; OR

my $num1=20;
my $num2 =30;
my $object = new BaseClass(); # Creating an object of class 'Class' through Default constructer 

#$object->SetLocation('USA'); #it will set the _country as 'USA' inplace of 'UK'

$object->print;

#$object->Download; 
#$object->Download('english'); # restricting english music for downloading

my $value =$object->play;
#print $value."\n";


# $object->destroy; # if called here additing method will not be invoked

my $sum = $object->addition($num1,$num2);
print "Sum of $num1 and $num2 : ",$sum;

#$object->destroy;