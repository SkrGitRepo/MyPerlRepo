#!perl -w
use strict;

my %charmap = ( a => 'B', c => 'D', ); # ... could come from a config file

my $old = join '', keys %charmap;
my $new = join '', values %charmap;

while (@_) {
    eval "tr{$old}{$new}";
    if ( $@ ) {
        die  print "tr{$old}{$new} failed at line $.: $_";
    }
    
}

print qq{$old \n};
print qq{$new \n};