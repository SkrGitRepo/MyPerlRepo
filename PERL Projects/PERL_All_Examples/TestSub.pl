#!perl -w
use strict;
=pod
=head1 NAME
 	
 	http://ewc-core.cisco.com/interfaces/rest/remoteaccessAD/anyconnectADProvisioning.pcgi
	
=head1 DESCRIPTION
 	
 	This simple CGI will process a set of commands against a list and an optional argument.
 	
=head1 PARAMETERS
 	
 	cmd - (create, delete)
 	name/value pair of arguments
 	
=head1 VERSION
 	
 	$Id $
 	
=cut


sub hello()  # sub hello() is defined here
{
    print "Hello: I am in sub :: hello() \n";
} 

# it is not necessary to declare a subroutine before defining it.

hello(); # calling the subroutine : sub hello()


# Subroutine can be un named : i.e  anonymous subroutine that is called using references

my $subRef = sub{ print "\n I am in ref sub ,unnmed sub \n";};

$subRef->(); #calling the un-named sub


# "forward declaration" of subroutine ,in case of 'forward declaration' subroutines are declared first using the keyword ‘sub’. 
# The definition of the subroutine comes later.  

print "\n ## 'Forward declaration' of subroutine ## \n";

	sub helloWorld(); # Declare the subroutine
	#<some code>;
	helloWorld; # Call the subroutine
	# <some code>;
	sub helloWorld() # Define the subroutine
	{
	    print "Hello :I am in the sub:: helloWorld() \n";
	    
	}
	

# Passing Value to subroutine

print "\n ## Passing Value to subroutine ## \n";

#sub sum();

my $num1 =5; 
my $num2=4;
sum($num1,$num2);

#define and declaration of sub
sub sum {
    my $sum =0;
    foreach(@_) {
        
        $sum+=$_;
        
        #print "$_";
    }
    print "Sum of $num1 and $num2 = ",$sum;
}

# Arguments can also be accessed using the shift keyword

print "\n ## Arguments can also be accessed using the shift keyword ## \n";
my $number1 =9.43; 
my $number2=3.23;
substract($number1,$number2);

#define and declaration of sub
sub substract {
    my $substract =0;
    my $num1=shift;
    my $num2=shift;
    $substract =$num1-$num2;
    print "\n Substraction of $num1 and $num2 = ",$substract ,"\n";
   
}


# Subroutines can return a list of scalar values. 

print "\n ## Subroutines can return a list of scalar values ## \n";
my @calculate = add_num(100,5);
print "Sum is:$calculate[0]\n";
print "Difference is:$calculate[1]\n";
print "Product is: $calculate[2]\n";
print "Quotient is: $calculate[3]\n";
sub add_num
{
    my $num1= shift;
    my $num2 = shift;
    my $summ = $num1+$num2;
    my $diff = $num1-$num2;
    my $produ = $num1* $num2;
    my $divi = $num1/$num2;
    return($summ, $diff, $produ, $divi);
}


# recursion 


print "\n ## Recrsive call to sub sum() ## \n";
print sum(11, 22, 33), "\n";

sub sum
{
	if(@_ == 0)
	{
		return 0;
	}
	else
	{
		my $x = shift; 
		return $x + sum(@_);
	}
}


