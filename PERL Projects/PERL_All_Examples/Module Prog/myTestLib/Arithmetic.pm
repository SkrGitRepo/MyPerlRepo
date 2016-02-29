package Arithmetic ;
use Exporter;

#base class of this(Arithmetic) module
@ISA =qw(Exporter);


#Exporting the add and substract subroutine
@EXPORT =qw(add substract multiply $VERSION);

#Exporting the multiply and division subroutine on demand basis
@EXPORT_OK = qw(division);


our $VERSION="1.0";
our $MATH_VER ="1.0.0";


sub add {
    my ($num1,$num2) = @_;
    my $sum;
    $sum=($num1+$num2);
    return $sum;
}


sub substract {
    my ($num1,$num2)=@_;
    my $diff;
    $diff=($num1-$num2);
    return $diff;
}

sub multiply {
    my ($num1,$num2)=@_;
    my $prod;
    $prod=($num1*$num2);
    return $prod;
}

sub division {
    my ($num,$num2)=@_;
    my $div;
    if(num1>num2) {
        $div=($num1/$num2);
    } elsif($num2>$num1) {
        $div=($num2/$num1)
    } else {
        $div="Please enter valid operand for division";
    }
    return $div;
}

1;