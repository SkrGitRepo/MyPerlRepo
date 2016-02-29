#!perl -w

use strict;

print "\n \t*******  Examples to Extract substring using  PERL Reg Expression ****** \n ";

print "\n * Example 1:  to show if a string contains digit \n";

print "\n ** The pattern \\d matches any single digit. In this case, the search will 
finish as soon as it reads the \"2\". Searching always goes left to right. \n";

my $myString ="[2012/05/23] The date of this program.";

if($myString =~ m/\d/) {

    print "\n \t String \"$myString \" :contains digit \n";

}
else {
    print "\n \t String $myString does not contains any digit  \n";
}


print "\n * Example 2:  Return the first matching digit from my string , 
to extract the matched value it has to be surrounded like(\\d) \n"; 
# add '+'  with :(\d) to get the 1st complete grp of one or more digit in the string

if($myString =~ m/(\d+)/ ) {

	print "\n\t The first matching grp of digits is :$1\n."; #o/p:2012
}

# g -> tells Perl to do a global search on the string. or search the whole string from left to write.
print "\n * Example 3: To get all macthed grp digits \n";
while($myString =~ m/(\d+)/g ){

	print "\n\t All of the  Matched grp digits are :$1\n."; #o/p:2012 , 05 , 23
}

# get all the numbers from the string into an array instead? 

print "\n * Example 4: To get all the numbers from the string into an array \n";

my @myArray = ($myString =~ m/(\d+)/g );
print "\n\t",join(",",@myArray),"\n"; #o/p:2012 , 05 , 23






