#!perl -w
use strict;


my @strarr = ("q","I am a software engineer");

my @match = grep ("q",@strarr);

print "\n Matched string is :@match \n";


my @list = (1,"Test", 0, "foo", 20 );

my @has_digit = grep ( /\d/, @list );

print "@has_digit\n";