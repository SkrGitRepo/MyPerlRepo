#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $getTestId = undef;
print "\n Enter the TestId you want to search : \t";
$getTestId =<STDIN> ;
chomp($getTestId);
my $sql= "select * from test2 where Test_ID=$getTestId";
my $object =DBUtil->new();
print "\n All details for  TestId : ",$getTestId," are :\n";
my $status = $object->Select($sql);

if( $status == 1) {
    print "\n Fetching of records is Success \n ";
}else {
    print "\n Fetching of records is Failed \n ";
}



