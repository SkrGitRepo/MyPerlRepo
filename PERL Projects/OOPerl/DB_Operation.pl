#!perl -w
use strict;
use DBI;
#use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use lib './classes';
use Data::Dumper;
use DBUtil;

my $dbh=DBConnection();

my $sql = "INSERT INTO Test (Test_ID,Test_NAME,Test_DATE,Test_ADDRESS)" .
  "VALUES(1001,'Sumit','29th May 2012','Bangalore')";
  
my $insertRecord = Insert($sql);

if($insertRecord){
print "\n One record inserted Successfully \n ";
}
else{
print "\n Record insertion Failed ",$DBI::errstr;
}
exit 0;
