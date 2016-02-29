#!perl -w
package DBUtil;

use strict;
use Data::Dumper;
use DBI;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(DBConnection Create Select Insert Update Delete SelectAll);


sub DBConnection {
    my $dsn ="dbi:SQLite:dbname=C:/SQLLite_DB/test.db";
    my $dbusrid ="";
    my $dbpwd ="";
    my $dbh= undef;
    $dbh = DBI->connect($dsn, $dbusrid,$dbpwd) or die "Database connection error",$DBI::errstr;
    return $dbh;
}

sub Create {
    my $sql = shift;
    my $dbh = DBConnection();
    my $createTable = 0;

    eval {
    	$dbh->do($sql);
    };

	if ($@) {
		return -1;
	} else {
		$createTable = 1;
	}
    $dbh->disconnect();

    return $createTable;
}

sub Select {
    my $TestId =shift;
    my $record;
    my $dbh = DBConnection();
    my $sql= "select * from test where Test_ID=$TestId";
    my $Select = $dbh->prepare($sql);
	$Select->execute();
	#my $sth = $dbh->prepare($sql);
	#$sth->execute();
	while($record=$Select->fetchrow_hashref){
	  print "\n $record->{Test_ID} : $record->{Test_NAME} : $record->{Test_DATE} : $record->{Test_ADDRESS} \n";
    }
	#$sth->finish();
	$dbh->disconnect();
    return ($record);
}

sub SelectAll {
    my $records;
    my $dbh = DBConnection();
    my $sql= "select * from test";
    my $Select = $dbh->prepare($sql);
	$Select->execute();
	while($records=$Select->fetchrow_hashref){
	  print "\n $records->{Test_ID} : $records->{Test_NAME} : $records->{Test_DATE} : $records->{Test_ADDRESS} \n";
    }
	$Select->finish();
	$dbh->disconnect();
    return ($records);
}

sub Insert {
    my $sql =shift;
	my $dbh = DBConnection();

	eval {
		$dbh->do($sql);
	};

	$dbh->disconnect();

	if ($@) {
		return 0;
	} else {
		return 1;
	}
}

sub Update {
    my $sql =shift;
	my $dbh = DBConnection();
	my $updateRecord = $dbh->do($sql);
	$dbh->disconnect();
    return $updateRecord;
}

sub Delete {
    my $Test_Id =shift;
    my $sql = "DELETE FROM Test WHERE Test_ID=$Test_Id";
	my $dbh = DBConnection();
	my $deleteRecord = undef;
	eval {
		$deleteRecord = $dbh->do($sql);
	};
	$dbh->disconnect();
    return $deleteRecord;
} 

1;
