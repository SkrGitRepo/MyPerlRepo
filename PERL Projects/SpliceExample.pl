use strict;
use Data::Dumper;
=pod
my @items = ( 0..5 );
my $index = 0;
for my $value (@items) {
  $value = $items[$index];
  print "testing $value\n";
  if ( $value == 1 or $value == 3 ) {
    print "removed value $value\n";
    splice @items, $index, 1;
  }
  $index++;
}

#Above Values 2 and 4 are never actually tested for; iteration skips them completely!
=cut

print "\nIf you want to iterate over an array removing some items, try something like:\n";

my @itemss = ( 0..5 );
my $indexx = 0;
while ($indexx <= $#itemss ) {
  my $value = $itemss[$indexx];
  print "testing $value\n";
  if ( $value == 1 or $value == 3 ) {
    print "removed value $value\n";
    splice @itemss, $indexx, 1;
  } else {
    $indexx++;
  }
}

print "\n ------------------------------------------------------------------------- \n";
print "How to insert an element in the middle of an array in Perl?\n";
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs, 3, 0, 'SnowWhite';
print "@dwarfs";
# Doc Grumpy Happy SnowWhite Sleepy Sneezy Dopey Bashful

print "\n-------------------------------------------------------------------------";
print "\nHow to insert a list of values in an array in Perl?";
#Inserting one element is actually just a special case of inserting several elements.
my @dwarfs1 = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs1, 3, 0, 'SnowWhite', 'Humbert';
print "@dwarfs1";
 
# Doc Grumpy Happy SnowWhite Humbert Sleepy Sneezy Dopey Bashful

print "\n -------------------------------------------------------------------------\n ";
print "\n How to insert an array in the middle of another array in Perl? \n";
#The same would have happen if we passed an array as the 4th parameter:

my @others = qw(SnowWhite Humbert);
my @dwarfs2 = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs2, 3, 0, @others;
print "@dwarfs2";

print "\n------------------------------------------------------------------------- \n";
print "\n Replace part of an array with some other values \n";
#You can also add and remove elements in a single command:

my @others1 = qw(SnowWhite Humbert);
my @dwarfs3 = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs3, 2, 4, @others1;
print "@dwarfs3 \n";
 
# Doc Grumpy SnowWhite Humbert Bashful