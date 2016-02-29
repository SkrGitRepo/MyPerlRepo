#!perl -w
use strict;
use DBI;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use Data::Dumper;
use DBUtil;

#my $dbh=DBConnection();

my $sql = "CREATE TABLE Test1(Test_ID integer primary key " . 
  ",Test_NAME text not null," . 
  " Test_DATE text not null,Test_ADDRESS not null)";
  
my $createTable = 0;
$createTable = DBUtil::Create($sql);

if($createTable){
	print "\n Table created Successfully \n ";
} else {
	print "\n Table creation Failed ";
}

