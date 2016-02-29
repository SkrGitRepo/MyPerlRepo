#!perl -w
package Rectangle3;
use strict;
use Rectangle;

our @ISA =qw(Rectangle);

sub new {
	my $nm = shift;
	my $class = $nm || ref $nm;
	my $self = $class->SUPER::new;
	$self->{height}=undef;
	bless $self,$class;
	return $self;
}

sub calcArea {
	my ($self) = shift;
	$self->{length} =shift;
	$self->{breadth} =shift;
	$self->{height}=shift;
	
	$self->{area} = $self->{length} * $self->{breadth} * $self->{height};
	$self->SUPER::printArea($self->{area});
}
1;