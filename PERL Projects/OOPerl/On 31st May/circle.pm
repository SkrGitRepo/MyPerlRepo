#!perl -w
package circle;
use strict;
use shape;

our @ISA =qw(shape);

sub new {
	my $nm = shift;
	my $class = $nm || ref $nm;
	#my $self =$class->SUPER::new();
	my $self ={};
	$self->{radius} ="";
	bless $self,$class;
	return $self;
}

sub calcArea{
	my ($self) = shift @_;
	$self->{area} =3.14 * $self->{radius} * $self->{redius};
	# or
	
	#$_[0]->{area} =3.14 * $_[0]->{radius} * $_[0]->{redius};
	
}
1;