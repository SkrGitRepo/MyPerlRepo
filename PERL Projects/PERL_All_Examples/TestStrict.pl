#!perl -w

#use warnings;
use strict 'vars';

$X::foo=1;


#strict will not allow variable witout anyscope decalration.(e.g my,local or our);

#strict vars
our $name = "Sumit";

print "My name is :",$name ,"\n";

my $foo =10;

print "foo value is : ",$foo,"\n";

# Change this:(strict)
#sub my_sub {
# ($arg1, $arg2) = @_;  #(strict will complain here)
#print "Arg1: $arg1 Arg2: $arg2\n";
#}

# To this:
sub my_sub {
 my ($arg1, $arg2) = @_;
 print "Arg1: $arg1 Arg2: $arg2\n";
}



###### Condition when warning occurs ######

my $fooRef =$foo;   
print $$fooRef; #throw a warning since we are derefrencing a scalar var which is not a scalar ref var  and then printing it.::(Use of uninitialized value in print)

my $fooRef1 =\$foo; 
print $$fooRef1; #corrected




