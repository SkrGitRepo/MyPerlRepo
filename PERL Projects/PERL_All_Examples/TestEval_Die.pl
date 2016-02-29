#!perl -w
use strict;
use Data::Dumper;


my ($name,$valid_name,$invalid_name,$result) = (undef) x 3;

my $namearr =['sumit','pritish','niraj'];


sub chkname {
    my $recvname = shift;
    
    #print "\n received name : $recvname  \n";
    if(($recvname ne 'niraj') && ($recvname ne 'pritish')){
         #die "\nInvalid hostname received : '$hostname' \n"
           
         die "Invalid name passed";
         
    }
}

foreach $name(@{$namearr}) {
    eval {
        $result = chkname($name);
    };
    if($@) {
	$invalid_name .="$name";
    } else {
    	$valid_name .="$name";
    }
    
}


if($valid_name){
	print "\n All valid name recieved  : $valid_name\n";
}

if($invalid_name){
	print "\n All invalid name recieved : $invalid_name\n";
}



