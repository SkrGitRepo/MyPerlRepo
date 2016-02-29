#!/usr/local/bin/perl -w

my @a1 = (10, 20, 30, 40);
my @a2 = (50, 60, 70);


foreach(@a1) {

my $count =0;
print "\n\n First array element of arr a1 \t :$a1[$count]\n\n";

$count = ($count+1);

}


my $arr = [{'a'=>20,'b'=>30,
	     'c'=>40}];
	     
my $arr1 =['a',20,'b',30]; 	     


print "\nTotal element in the array :",$#{$arr},"\t", $#{$arr1},"\n\n";

#my @retSubArr =

#sub1(@a1, @a2);
 my @retSubArr = sub2(\@a1, \@a2);
 
 print "\n \nFinally returned array elements are :",join ",",@retSubArr;

#print "a2: ", join(', ', @a2), "\n";

sub sub1 {
  #my(@a1, @a2) = @_;
  my @a1=shift;
  my @a2=shift;

  print "a1 has " . @a1 . " elements\n";
  print "a2 has " . @a2 . " elements\n";
}

sub sub2 {
  my($ra1, $ra2) = @_;
  
  my @aa1=@$ra1;
  my @aa2=@$ra2;
  
  print "ra1 has " . @$ra1 . " elements\n";
  print "ra2 has " . @$ra2 . " elements\n";
  
  print "aa1 has " . @aa1 . " elements\n";
  print "aa2 has " . @aa2 . " elements\n";
  print "ra1->[0]: $ra1->[0]\n";
  print "ra2->[0]: $ra2->[0]\n";
  #push @$ra2, 80;
  
  my @retSub1Arr = sub3(\@aa1,\@aa2);
  
  return (@retSub1Arr);
}


sub sub3{

    my @newArr1;
    my ($raa1,$raa2)=@_;

    print "raa1 has " . @$raa1 . " elements\n";
    print "raa2 has " . @$raa2 . " elements\n";
    
    #print " Array aa1 element are:";
    foreach my $aar1val(@$raa1) {
        #print join ",",$aar1val;
        
        push(@newArr1,$aar1val);
        
    }

    print "Elements of new array : newArr1 : ", join ",",@newArr1;
    return (@newArr1);
    
    
    
    
}