#!perl -w
use strict; 
use DBI;
use Data::Dumper;


my $dbh;  #declaring database handler

# =' /database :$ dbdriver/dbname';
my $dsn ='dbi:mysql:cgperldb';
my $uname ='root';
my $pwd='cgisco';

#defining database handler
$dbh=DBI->connect($dsn,$uname,$pwd)or die "Problem with the database connectivity : $DBI::errstr \n";

#print Dumper($dbh);
#exit;
my $sql="select *from userdetails";
#my $sql="select usrid,usrname from userdetails where usrid=1001";
#my $sql="insert into userdetails values(1003,'prvr','Praveen','5th SEP','Male')";
#my $sql="update userdetails set userpwd='skumar' where usrid=1001";
#my $sql="delete from userdetails where usrid=1002";
#defining statement handler;
my $sth =$dbh->prepare($sql) or die $dbh->errstr;
$sth->execute() or die $dbh->errstr;
#my ($scalar,@array,%hash);
#my $hashRefRec =\%hash;
#my $arrayRefRec =\@array;
#my $scalarRef=\$scalar;
# to know the ref type of a variable;
#print " Ref type of the var is  : ", ref($hashRefRec);
#exit;

my @records; 
#while($hashRefRec =$sth->fetchrow_hashref()) {
#while($arrayRefRec =$sth->fetchrow_arrayref()) {
while(@records =$sth->fetchrow_array()) {

    #print Dumper($records);
    #print " \n User ID :".$hashRefRec->{usrid}."\n";
    #print "\n User Name :".$hashRefRec->{usrname}."\n";
    
    #print Dumper($arrayRefRec);
	#print " \n User ID :".@{$arrayRefRec}->[0]."\n";
    #print "\n User Name :".@{$arrayRefRec}->[1]."\n";
       
    #print Dumper(\@records);
    print " \n User ID :".$records[0]."\n";
    print " \n User Name :".$records[1]."\n";
}
#print "\n One record added/updated/deleted in the table \n";
#print "\n Closing the statment and Db handler";
$sth->finish();
$dbh->disconnect;
print " \n DB Statement handler and Db handler has been closed";

