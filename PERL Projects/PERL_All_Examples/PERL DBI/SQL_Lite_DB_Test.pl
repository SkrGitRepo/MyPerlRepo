#!perl -w
use strict;
use DBI;
use lib 'C:/CGISCO PERL COE Training Workspace/Assignment_on_28th_MAY/DbUtil/';
use Data::Dumper;
use DBUtil;

=head
my $dbh = DBI->connect( 
    "dbi:SQLite:dbname=C:/SQLLite_DB/test.db", 
    "",                          
    "",                          
    { RaiseError => 1 },         
) or die $DBI::errstr;

=cut 
my $sql="select count(*) from test";
my $dbh =DBConnection();
#my $sql="SELECT SQLITE_VERSION()";
#my $sth = $dbh->prepare($sql);
my $sth = $dbh->prepare($sql) or die $dbh->errstr;
$sth->execute() or die $dbh->errstr;
my $rowcount = $sth->fetchrow();
#my $createTable = $dbh->do($sql);

print $rowcount;


=head
my @records;

while(@records =$sth->fetchrow_array()) {
    print Dumper \@records;

}

=cut
#my $ver = $sth->fetch();

#print @$ver;
print "\n";

$sth->finish();
$dbh->disconnect();