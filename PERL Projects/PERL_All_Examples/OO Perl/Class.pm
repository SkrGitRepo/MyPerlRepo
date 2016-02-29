#!perl -w
package BaseClass;
use strict;
use vars '$AUTOLOAD';

sub new {
    my $class_name = shift;
    my $self ={
        _music => "english",
        _type => "Rap",
        _country => "UK"
    };
    
    print " \n Before bless ",ref($self);
    bless $self,$class_name;
    #use Data::Dumper;
    #print Dumper $self;
    print "\n After bless : ",ref($self);
    return $self;
}

sub print {
    my $self = shift;
    print "I am a ref of class: ",ref($self),"\n";
    print "Private var value: $self->{_music} and  $self->{_type}  and $self->{_country}\n";
}

sub addition {
    my $self = shift;
    print "\n I am in  Class::addition() \n ";
    my $no1=shift;
    my $no2=shift;
    my $add = $no1 +$no2;  
    return $add;
 }
sub SetLocation {
	my $self =shift;
	$self->{_country} = shift;
}

sub Download{
	my $self =shift;
	if(shift){
		print "\n This english music is only for playing \n";
	}else {
	    print " Its a  :$self->{_music} music ";
	}

}

sub AUTOLOAD {
	my $self =shift;
	print "Method not found :",$AUTOLOAD," \n "; 
	if($AUTOLOAD =~ /::(.*)/){
	    return $self->{"_$1"};
	}
}
 sub DESTROY {
    my $self =shift;
    print " \n I am in basic class destructor \n";
 
 }
1;