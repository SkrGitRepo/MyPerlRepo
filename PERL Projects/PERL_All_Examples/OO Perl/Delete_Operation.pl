#!perl -w
use strict;
use DBI;
use lib './classes/';
use DBUtil;

my $getTestId=undef;
my $object =DBUtil->new();

print "\n Enter the TestId you want to delete : \t";
$getTestId =<STDIN> ;
chomp($getTestId);
my $sql = "DELETE FROM Test WHERE Test_ID=$getTestId";
my $deleteRecord = $object->Delete($sql);

if($deleteRecord == 1){
	print "\n One Record Deleted Succesfully \n ";
}
else{
	print "\n Record Deletion Failed ";
}
