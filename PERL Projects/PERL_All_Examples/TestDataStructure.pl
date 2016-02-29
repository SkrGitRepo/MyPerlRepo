#!perl -w 

use strict;
use Data::Dumper;

# Types of Data structure avaialble in PERL:
# 1) Arrays
# 2) Hashes

# code to Declaring different data structure of PERL

$, = "\t";  #Replace all comma with a tab space

print " ########################## ARRAYS ############################# \n";

my @arrData = (1,"PC",'Mouse',23.78);

print "Elements of arrary : ",@arrData,"\n"; 

print "3rd Element of the array : ",$arrData[2],"\n";

#Adding new element to array.
$arrData[5] = "laptop";

#print "Elements of arrary : ",@arrData,"\n"; #Giving Warning 

my $arrRef = \@arrData;
my $arrElement =0;
my @newArr=();
print " All element of array through arrRef :",@$arrRef; #giving warning
print " second of array through arrRef :",$$arrRef[1] , "\n";

print "Each element of array through arrRef iteration : \n";
foreach $arrElement(@arrData) {
	push(@newArr,$arrElement);
}
print "Element in new array :",@newArr;

 print " \n ################### HASHES ############################################  \n";

my %hashData =( 1=>"Ram",2=>"HDD",3=>"Motherboard");

my %hashData1 = (1,"Ram",2,"HDD",3,"Motherboard");

print "Element of hashData :",%hashData,"\n";

print "First element of hashData is : ", $hashData{1} ,"\n";

#adding new element to hash:

$hashData{4}="laptop";

print "Element of hashData after adding new element  :",%hashData,"\n";


print "Element of hashData1 :",%hashData1,"\n";

print "Second element of hashData1 is : ", $hashData1{2} ,"\n";

my $hashDataRef =\%hashData;

print "Hash key :'4' value using hash ref : ",$$hashDataRef{4} ,"\n";

print "Hash value using hash ref : ",%$hashDataRef;  #dereferencing the hash data 


if (exists $hashDataRef->{2}) {
    print "  \n *******  key exists ******** \n";
}


print "\n **** Iteratiing trough hash element(Key,value) without using references ***** \n";

print "\n Key \t=> Value \n";

 for my $key (sort keys %hashData) {
     
     print $key,"\t=> ",$hashData{$key},"\n";
 }



my %phoneNumbers = ("Sumit", "432566", "Skr", "231275", "Niraj","299302");
my $phoneNumbersRef =\%phoneNumbers;

while (my ($key, $value) = each %phoneNumbers)
{
  print " \n $key has the phone number :$phoneNumbers{$key} \n";
  print " \n $key has the phone number :$value \n";
}

 print Dumper $phoneNumbersRef;
 
 
 
 print "\n **** Iterating trough hash element(Key,value) using references ***** \n";
 print "\n Key \t=> Value \n";
 
 for my $key (sort keys %{$phoneNumbersRef}) {
     
     print $key,"\t=> ",$phoneNumbersRef->{$key},"\n";
 }

print "\n **** Reversing the element of hash(%) ***** \n";



my %revHashData = reverse %hashData;

print "\n Revershed element :",Dumper \%revHashData,"\n";

print "\n **** Deletion of hash element ***** \n";

delete $phoneNumbersRef->{Skr};

print "\n After deleting one element from hash **** \n",Dumper $phoneNumbersRef;


if (!exists $phoneNumbersRef->{Skr}) {
     
     $phoneNumbersRef->{Skr}="65483";
    print "  \n *******  key added ******** \n";
}
#%phoneNumbers{Skr}=65483;

print "\n After readding deleted  element from hash **** \n",Dumper $phoneNumbersRef;

