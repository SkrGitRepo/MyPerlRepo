#!perl -w
package Rectangle;
use strict;
use Shape;

our @ISA =qw(Shape);

sub new {
	my $nm = shift;
	my $class = $nm || ref $nm;
	my $self =$class->SUPER::new();
	#my $self =Shape->new;
	#my $self ={};
	$self->{length} =undef;
	$self->{breadth} =undef;
	#$self->{length} =shift;
	#$self->{breadth} =shift;
	
	bless $self,$class;
	return $self;
}

sub calcArea{
	my ($self) = shift;
	$self->{length} =shift;
	$self->{breadth} =shift;
	$self->{area} = ($self->{length} * $self->{breadth});
	#print $self->{area};
	$self->SUPER::printArea($self->{area});
}
1;