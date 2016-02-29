package SortHashMod;

use Exporter;

#base class of this(Arithmetic) module
@ISA =qw(Exporter);


#Exporting the ... subroutine
@EXPORT =qw();


sub sortHash {

    my ($num1,$num2) = @_;
    my $sum;
    $sum=($num1+$num2);
    return $sum;
}