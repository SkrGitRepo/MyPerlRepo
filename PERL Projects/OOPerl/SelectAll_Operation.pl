#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $sql= "select * from test";
my $object =DBUtil->new();

my $status = $object->SelectAll($sql);
if( $status == 1) {
    print "\n Fetching of records is Success \n ";
}else {
    print "\n Fetching of records is Failed \n ";
}

