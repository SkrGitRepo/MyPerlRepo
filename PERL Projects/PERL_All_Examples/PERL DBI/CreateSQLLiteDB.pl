#!perl -w
use strict;
use Data::Dumper;
use DBI;

my $dsn ="dbi:SQLite:dbname=C:/SQLLite_DB/test.db";
my $dbusrid ="";
my $dbpwd ="";
my $dbh= undef;
$dbh = DBI->connect($dsn, $dbusrid,$dbpwd) or die "Database connection error",$DBI::errstr;

my $sql = "CREATE TABLE Test1(Test_ID integer primary key " . 
  ",Test_NAME text not null," . 
  " Test_DATE text not null,Test_ADDRESS not null)";
  

my $createTable = 0;
#$createTable = DBUtil::Create($sql);
eval {
    	$dbh->do($sql);
};
if ($@) {
	return -1;
} else {
	$createTable = 1;
}
$dbh->disconnect();

if($createTable){
	print "\n Table created Successfully \n ";
} else {
	print "\n Table creation Failed ";
}