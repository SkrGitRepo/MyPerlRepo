#! perl -w
use strict;


#1) Conditional Statement   
# a) if- elsif- else

my $x=10;
my $y =20;
my $z = 30;

if($x < $y) {
    print "$x is lower than $y \n";

}
elsif ($x < $z) {
    print " $x is smaller than $z \n";
}
elsif ($y < $z) {
    print " $y is smaller than $z \n";
}

else {
    print "$x is smallest \n";
}



#b) unless  : reverse of IF

unless($x < $y) {
    print "$y is higher than $x \n";
    }
elsif ($y < $z) {
    print " $y is smaller than $z \n";
}

else {
    print "$x is smallest \n";
}
    
    
my @ arrElement = (1,2,3,4,5);
print "@arrElement \n" unless scalar(@arrElement)<5;


#Breaking Out of loop: use of next in loop

print "\n Value on using 'next' :";
for (my $x=1; $x<10; $x++) 
	{
	    if ($x == 5)  
         {
	         next;  # it will skip the fifth iteration
	     }
	     print $x; 
    }
# Breaking Out of loop: use of 'last' in loop

print "\n Value on using 'last' :";
for (my $x=1; $x<10; $x++) 
	{
	    if ($x == 5)  
         {
	         last;  # it will break the loop iteration and cursor will point  to first immediate statement after the loop.
	     }
	     print $x; 
    }

# The ‘redo’ keyword is used to redo the current iteration without evaluating the conditional again.

my $test = 1;
foreach (my $x=1; $x<4; $x++)
{
    $test++;
    print "x is : $x\n";
    print "test is : $test\n";

    if (($test == 3))
    {
        print "Redoing :$x\n";
        redo;
    }
}

