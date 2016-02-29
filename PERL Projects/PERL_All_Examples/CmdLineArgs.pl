#!perl -w
use strict;
use Data::Dumper;

if ($#ARGV != 2 ) {
	print "usage: mycal number1 op number2\n eg: mycal 5 + 3 OR mycal 5 - 2\n";
	#print $#ARGV;
	exit;
}
my $n1=$ARGV[0];
my $op=$ARGV[1];
my $n2=$ARGV[2];
my $ans=0;

#print $#ARGV;

if ( $op eq "+" ) {
	$ans = $n1 + $n2;
}
elsif ( $op eq "-"){
	$ans = $n1 - $n2;
}
elsif ( $op eq "/"){
	$ans = $n1 / $n2;
}
elsif ( $op eq "*"){
	$ans = $n1 * $n2;
}
else {
	print "Error: op must be +, -, *, / only\n";
	exit;
}
print "$ans\n";



#Console & O/P
#-----------------
#$ chmod +x mycal.pl
#$ ./mycal.pl
#$ ./mycal.pl 5 + 3
#$ ./mycal.pl 5 \* 3

