#!perl -w
use strict;

package Shape;

sub new {
	my $nm = shift;
	my $class = $nm || ref $nm;
	my $self ={};
	$self->{area} ="";
	bless $self,$class;
	return $self;
}

sub printArea {
	my $self =shift;
	my $area =shift;
	print " Area of type = ",ref $self," :",$area,"\n";
}

=head
sub printPvt {
	my $self =shift;
	print "ref =",ref $shift,"\n";
}
=cut


1;