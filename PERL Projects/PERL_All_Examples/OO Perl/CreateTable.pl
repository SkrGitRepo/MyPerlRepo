#!perl -w
use strict;
use DBI;
use lib './classes/';
use DBUtil;

my $object =DBUtil->new();
my $sql = "CREATE TABLE Test3(Test_ID integer primary key " . 
  ",Test_NAME text not null," . 
  " Test_DATE text not null,Test_ADDRESS not null)";
  
my $createTable = $object->Create($sql);

if($createTable == 1){
	print "\n Table created Successfully \n ";
} else {
	print "\n Table creation Failed ";
}

