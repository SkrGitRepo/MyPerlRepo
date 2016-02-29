#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $object =DBUtil->new();

my $sql="INSERT INTO test2 values(1004, 'Zaheer', '30th May 2012', 'Bangalore')";
my  $insertRecord =$object->Insert($sql);

if ($insertRecord == 1) {
	print "\n One record inserted Successfully \n ";
} else {
	print "\n Record insertion Failed ";
}
