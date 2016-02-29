#!perl -w

use strict;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use DBUtil;

my $sql = "UPDATE Test SET Test_NAME ='Mahesh' WHERE Test_ID = '1004'";
  
my $updateRecord = Update($sql);

if($updateRecord == 1){
	print "\n One Record updated Successfully \n ";
}
else{
	print "\n Record updation Failed ",$DBI::errstr;
}
