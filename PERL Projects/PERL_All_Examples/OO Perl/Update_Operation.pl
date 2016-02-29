#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $object =DBUtil->new();
my $sql = "UPDATE Test2 SET Test_ADDRESS ='Bangalore3' WHERE Test_ID = '1001'";
my $updateRecord = $object->Update($sql);

if($updateRecord == 1){
	print "\n One Record updated Successfully \n ";
}
else{
	print "\n Record updation Failed ",$DBI::errstr;
}
