#!perl -w
use strict;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use Data::Dumper;
use DBUtil;

my $getTestId = undef;

print "\n Enter the TestId you want to search : \t";
$getTestId =<STDIN> ;
chomp($getTestId);

print "\n All details for  TestId : \t",$getTestId," are :\n";
Select($getTestId);
exit 0;

