#!perl -w
use strict;

# eval - for runtime evaluation for any exception or error in perl
my $num1=30;
my $num2 =2;
my $div=undef;

my $expr =$num1+$num2;

# use of eval 

print "Additing of $num1 and $num2 is : ",eval $expr,"\n"; # o/p =32;


eval {
    #$dbh=DBI->connect($dsn,$uname,$pwd);
    #do
    $div=($num1/$num2);
    #print "\n Error occur in previuos lin \n";
};
if($@){
    my $err =$@;
    print "\n  Error occured :  ".$err;
    exit;
} else {
	print " div of $num1 by $num2 = ",$div;
}

