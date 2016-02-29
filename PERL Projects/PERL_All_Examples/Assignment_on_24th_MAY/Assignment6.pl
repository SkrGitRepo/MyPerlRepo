#!perl -w
use strict;
use Data::Dumper;
use lib './module_lib/';
use CommonModule;


my %myHash = ("20GB","20480 MB","10GB","10240 MB","40GB","40960MB","1GB","1024 MB");

my @array1 = keys %myHash;
my @array2 = values %myHash;

print Dumper \@array1;
print Dumper \@array2;

=pod
my ($RetRefKeyArr,$RetRefValArr) = getHashKeyValArr(%myHash);

my @RetKeyArr=@$RetRefKeyArr;
my @RetValArr=@$RetRefValArr;

print "\n KEYs collected from Hash to Array  : ", join ",",@RetKeyArr;
print "\n\n VALUES collected from Hash to Array  :  ", join ",",@RetValArr;
print "\n";
=cut


