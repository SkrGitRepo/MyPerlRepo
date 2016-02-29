#!perl -w
use strict;
use lib './classes/';
use DBUtil;

my $object =DBUtil->new();
my $sql ="select count(*)from test";
my $TotalRecords =$object->RecordCount($sql);
#print "\n Total no of records available in the table is :",$TotalRecords;

if($TotalRecords > 0){
	print "\n Fetching of records is Success \n ";
    print "\n Total no of records available in the table is :",$TotalRecords;
}else {
    print "\n Fetching of records is Failed \n ";
}


