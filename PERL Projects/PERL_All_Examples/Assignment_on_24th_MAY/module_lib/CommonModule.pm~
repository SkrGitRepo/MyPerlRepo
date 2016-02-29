package CommonModule;

use Data::Dumper;

use Exporter;

#base class of this(Arithmetic) module
@ISA =qw(Exporter);


#Exporting the sortHash() subroutine
@EXPORT =qw(sortHash getArraySub1 getArraySub2 addHashValRuntime getHashKeyValArr);



##### SUBROUTINE to sort the key's , value  of passed HASH to the subroutine

sub sortHash {
	my %unSortedHash =@_;

	my @sortValues = ();
	my $new_hash = {};

	for my $unsortedKey (keys %unSortedHash){
		my $key = $unsortedKey;
		$key =~ s/\D*//g;
		$new_hash->{$key} = $unSortedHash{$unsortedKey};
	}

	for my $key (sort {$a <=> $b} keys %$new_hash) {
		push (@sortValues, $new_hash->{$key});
	}

	return (\@sortValues);
}

###################################################################################################


################################## BELOW SUBROUTINES ARE FOR ASSIGNMENT-3 #########################

sub getArraySub1{

	my($refArr1, $refArr2) = @_;

	print "\n \@array1  has ".@$refArr1." elements in SUB1 as ", join ",",@$refArr1;
	print "\n \@array2  has ".@$refArr2." elements in SUB1 as ", join ",",@$refArr2;
	print "\n";

	my @passedArray1=@$refArr1;
	my @passedArray2=@$refArr2;

	#push @$ra2, 80;

	my ($retArray1,$retArray2) = getArraySub2(\@passedArray1,\@passedArray2);

  @retArray1 = @$retArray1;
  @retArray2 = @$retArray2;

  return (\@retArray1,\@retArray2);
}


sub getArraySub2{

	my @retArray2_1;
	my @retArray2_2;
	my ($refArr3,$refArr4)=@_;

	foreach my $Arr3val(@$refArr3) {

		push(@retArray2_1,$Arr3val);

	}

	print "\n \@array1  has ".@retArray2_1." elements in SUB2 as ", join ",",@retArray2_1;

	foreach my $Arr4val(@$refArr4) {

		push(@retArray2_2,$Arr4val);

	}

	print "\n \@array1  has ".@retArray2_2." elements in SUB2 as ", join ",",@retArray2_2;

	return (\@retArray2_1,\@retArray2_2);
}



################################## BELOW SUBROUTINES ARE DEFINED FOR ASSIGNMENT-5 #########################


sub addHashValRuntime {
	my ($staticHashVal,$dynamicHashVal) =@_;

	print "\n KEY => VALUE pair of Static hash inside SUB \n",Dumper \%staticHashVal;
	while (my ($key, $value)= each(%staticHashVal)) {
		$dynamicHashVal{$key}="$value";
	}   
	print "\n KEY => VALUE pair of Dynamic hash inside SUB :: \n",Dumper \%dynamicHashVal;

	return (%dynamicHashVal);
}




################################## BELOW SUBROUTINES ARE DEFINED FOR ASSIGNMENT-6 #########################


sub getHashKeyValArr {

	my (%getMyHash) =@_;
	my (@arrOfKeys,@arrOfVals);

	print "\n KEY => VALUE pair of hash inside SUB \n",Dumper \%getMyHash;


	while ((my $key,my $value)= each(%getMyHash)) {

		push (@arrOfKeys,$key);
		push (@arrOfVals,$value);
	}   

	return (\@arrOfKeys,\@arrOfVals);

}

###########################################################################################################

1;
