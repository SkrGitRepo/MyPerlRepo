#!perl -w
use strict;
use lib './classes/';
use DBUtil;


#my $object =DBUtil->new();
our $ch;
our $option;

do {
    print "\n ----------- Select the DB Operation you want to perform ----------- ";
    print "\n 1.Enter 'C/c' for Create operation.\t";
    print "\n 2.Enter 'I/i' for Insert operation.\t";
    print "\n 3.Enter 'U/u' for Update operation.\t";
    print "\n 4.Enter 'D/d' for Delete operation.\t";
	$option = <STDIN>;
	chomp $option;

	if ($option =~ m/C|c/)  {
		print "\n 1.Enter your 'CREATE' sql query to create your table \t";
		my $create_sql  = <STDIN>;
		chomp($create_sql);
		
		my  $createTable = 1;#$object->Create($create_sql);

		if ($createTable) {
			print "\n Your table created Successfully \n ";
		} else {
			print "\n Table creation Failed ";
		}
	} elsif ($option =~ m/I|i/)  {
		print "\n Enter your 'INSERT' sql query to insert values to you table \t";
	    my $insert_sql  = <STDIN>;
		chomp($insert_sql);
		my  $insertRecord = 1;#$object->Insert($insert_sql);

		if ($insertRecord) {
			print "\n One record inserted Successfully \n ";
		} else {
			print "\n Record insertion Failed ";
		}
	} else 	{
	    print "\n Please enter specified DB operations as only(C,I,U, or D ) .......!\n"
	}
	

    print "\n Do you want to do anymore DB operations(y/n) : \t ";
    $ch=<STDIN>;
    chomp $ch;

} while($ch eq "y" or $ch eq "Y");