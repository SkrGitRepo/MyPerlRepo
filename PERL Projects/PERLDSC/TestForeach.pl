#! perl -w
use strict;

my $max = -999;
$,=" ";  #It will replace all the , with a single whitespace
# initialize an array
my @numbers = (1, 2, 3, 4, 5);
foreach my $item (@numbers)
{
    $max = $item if $max < $item;
}
print "Max is = $max\n","Among",@numbers;      # expects Max = 5


#Use of foreach with range operator (..)
my $sum = 0;
foreach my $i (15..20) {
     $sum += $i;
}
print "\n The sum of range 15 ..20 :Sum = $sum\n";    # expects Sum = 105



# foreach with the special variable $_

# example will show you how to print the sum of the numbers from the list, using the special variable $_.

my $sum = 0;
@numbers = (1, 2, 3, 4, 5);

foreach (@numbers)
{
    $sum += $_;
}


print "\n Sum of elements",'@numbers',"@numbers = $sum \n";      # expects Sum = 15
