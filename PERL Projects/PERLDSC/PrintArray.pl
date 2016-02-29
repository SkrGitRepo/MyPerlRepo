#!perl -w
use strict;

=pod
my $array = ( [20,'abcd',30,'sumit',['office','ram',55]]);
print @$array;
for (@$array) {

	print "\n Array Element :: $_\n";

}
=cut

my @level1 = (
    [ 1, 2, 3, [4, 5] ],
    6,
    7,
    [ 8, [9, [10] ] ],
);

&read_array(\@level1);

exit 0;

sub read_array {
    my $array_reference = shift;

    foreach (@$array_reference) {
        if (ref($_) eq 'ARRAY') {
            &read_array($_);
        } else {
            print $_ . "\n";
        }
    }
}