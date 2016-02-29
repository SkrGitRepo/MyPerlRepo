#!perl -w
use strict;
use Rectangle;
use Rectangle3;

my $rectobj = Rectangle->new();
$rectobj->calcArea(10,20);
$rectobj->printArea();

#my $is =$rectobj->isa("Shape"); # print 1
my $is =$rectobj->isa("Rectangle");
print  "\n".$is."\n";

my $can = $rectobj->can("calcArea");
print  "\n".$can."\n";

my $can1 = $rectobj->can("printArea");
print  "\n".$can1."\n";
#$rectobj->printArea();

#my $rect3obj = Rectangle3->new(10,20,30);
my $rect3obj = Rectangle3->new();
$rect3obj->calcArea(10,20,30);
#rect3obj->printArea();


