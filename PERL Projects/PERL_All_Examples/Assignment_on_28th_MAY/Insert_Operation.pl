#!perl -w
use strict;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use DBUtil;

my $sql = q{INSERT INTO Test (Test_ID, Test_NAME, Test_DATE, Test_ADDRESS) VALUES (1004, 'Zaheer', '29th May 2012', 'Bangalore2')};
my $insertRecord = Insert($sql);

if ($insertRecord) {
	print "\n One record inserted Successfully \n ";
} else {
	print "\n Record insertion Failed ",$DBI::errstr;
}
