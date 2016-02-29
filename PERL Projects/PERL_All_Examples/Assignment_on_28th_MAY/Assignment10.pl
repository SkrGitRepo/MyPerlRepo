#!perl -w
use strict;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use DBUtil;


my $dbh =DBConnection();
my $sql ="select count(*) from test";

my $sth = $dbh->prepare($sql) or die $dbh->errstr;
$sth->execute() or die $dbh->errstr;
my $recordcount = $sth->fetchrow();

print "\n Total no of records available in the table 'test' is :",$recordcount;

$sth->finish();
$dbh->disconnect();
