#!perl -w
package DBUtil;
use strict;
use DBI;

sub new {
    my $class = shift;
    my $dbh = DBConnection();
    my $self={};
    $self->{_dbh}=$dbh;
    bless ($self,$class);
    return $self;
}

sub DBConnection {
    my $dsn ="dbi:SQLite:dbname=C:/SQLLite_DB/test.db";
    my $dbusrid ="";
    my $dbpwd ="";
    my $dbh =undef;
    eval {
    	$dbh = DBI->connect($dsn,$dbusrid,$dbpwd) or die "Database connection error",$DBI::errstr;
    };
    if($@){
    	print "\n $@ \n";
    }else {
    	return $dbh;
    }
}

sub Create {
    my $self =shift;
    my $sql = shift;
    my $createTable =undef;
    eval {
    	$self->{_dbh}->do($sql) or die $self->{_dbh}->errstr;
    	$self->{_dbh}->disconnect();
    };
	if ($@) {
		return -1;
	} else {
		$createTable = 1;
		return $createTable;
	}
 
}

sub Select {
    my $self =shift;
    my $sql =shift;
    my $record =undef;
    my $Select =undef;
    eval {
        $Select = $self->{_dbh}->prepare($sql) or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
	    $Select->execute() or die $self->{_dbh}->errstr;
	};
	if ($@) {
		$self->{_dbh}->disconnect();	
	    return -1;
	}else {
		while($record=$Select->fetchrow_hashref){
	        print "\n $record->{Test_ID} : $record->{Test_NAME} : $record->{Test_DATE} : $record->{Test_ADDRESS} \n";
	    }
	    $Select->finish();
	    $self->{_dbh}->disconnect();
	    return 1;
    }
  
}

sub SelectAll {
    my $self=shift;
    my $sql=shift;
    my $records =undef;
    my $Select=undef;
    eval{
    	$Select = $self->{_dbh}->prepare($sql) or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
		$Select->execute()or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
	};
	if($@){
		$self->{_dbh}->disconnect();
		return -1;
	}else {
		print "\n All the records Present in the test table  are :\n";
		while($records=$Select->fetchrow_hashref){
    		print "\n $records->{Test_ID} : $records->{Test_NAME} : $records->{Test_DATE} : $records->{Test_ADDRESS} \n";
        }
        $Select->finish();
		$self->{_dbh}->disconnect();
		return 1;
    }
}

sub Insert {
    my $self = shift;
    my $sql =shift;
    my $insertedRecord =undef;
    eval{ 
    	$insertedRecord =$self->{_dbh}->do($sql) or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
    };
   	if($@) {
   		$self->{_dbh}->disconnect();
   		return -1;
   	}else {
   		$self->{_dbh}->disconnect();
		return $insertedRecord;
	}
}

sub Update {
    my $self=shift;
    my $sql =shift;
	my $updateRecord =undef;
	eval{ 
		$updateRecord = $self->{_dbh}->do($sql) or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
    };
    if($@) {
	   		$self->{_dbh}->disconnect();
	   		return -1;
	}else {
	   		$self->{_dbh}->disconnect();
			return $updateRecord;
	}
}

sub Delete {
    my $self =shift;
    my $sql =shift;
    my $deleteRecord = undef;
	eval {
		$deleteRecord = $self->{_dbh}->do($sql)or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
	};
	if($@){
		$self->{_dbh}->disconnect();
	   	return -1;
	}else {
		$self->{_dbh}->disconnect();
    	return $deleteRecord;
	}
} 

sub RecordCount {
    my $self=shift;
    my $sql=shift;
    my $sth = undef;
    my $recordcount=undef;
    eval {
    	$sth=$self->{_dbh}->prepare($sql)or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
		$sth->execute() or die "DB Exception Occured : \n",$self->{_dbh}->errstr ;
	};
	if($@){
		$self->{_dbh}->disconnect();
		return -1;
	}else{
		$recordcount = $sth->fetchrow();
		$sth->finish();
    	$self->{_dbh}->disconnect();
    	return $recordcount;
    }
}

sub DESTROY {
    my $self =shift;
    print qq{\n Object Destructed \n};
}

1;
