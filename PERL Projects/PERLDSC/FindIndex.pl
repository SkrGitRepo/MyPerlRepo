#!/bin/perl -w

use strict;
my $ordered_list_owners = "cvelusam,josampat,smadhuka,jsudarsh,rahukum5,josampat,byreddy,npachamu,chasheka";
my @ordered_list = split( ',', $ordered_list_owners);

my ($list) = \@ordered_list;
my @ordered_list_owners = @{$list};
print "\n OLD ORDER LIST ::: @ordered_list_owners\n";

#print Dumper \@ordered_list_owners;

my @search_list = ('smadhuka','josampat');


=pod
foreach my $member(@search_list) {
my $search_for = $member;
#my( $index )= grep { $array[$_] eq $search_for } 0..$#array;
my( $index )= grep { $ordered_list_owners[$_] eq $search_for } 0..$#ordered_list_owners;

print "INDEX?:",$index,"\n";
}
=cut

foreach ( @search_list ) {

        my $backed_of_line = splice @ordered_list_owners, 0, 1;

        push @ordered_list_owners, $backed_of_line;
    }


print "\nNEW ORDER LIST ::: @ordered_list_owners\n";

