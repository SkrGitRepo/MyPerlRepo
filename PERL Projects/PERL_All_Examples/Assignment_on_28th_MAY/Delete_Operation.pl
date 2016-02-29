#!perl -w
use strict;
use DBI;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use Data::Dumper;
use DBUtil;

my $dbh=DBConnection();
my $getTestId;

print "\n Enter the TestId you want to delete : \t";
#$getTestId =<STDIN> ;
$getTestId = '1004';
my $deleteRecord = Delete($getTestId);

if($deleteRecord){
	print "\n One Record Deleted Succesfully \n ";
}
else{
	print "\n Record Deletion Failed ";
}
