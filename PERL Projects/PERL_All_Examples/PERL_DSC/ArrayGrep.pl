#!/usr/bin/perl
use strict;
use warnings;

print "Hello, World...\n";


my @pizzas = qw(cheese pepperoni veggie sausage spinach garlic);
 
# use the perl grep function to search the @pizzas list for the string "pepper"
my @results = grep /pepper/, @pizzas;
 
# print the results
print "@results\n";


