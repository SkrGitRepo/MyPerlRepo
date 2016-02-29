#!perl -w
use strict;
use Data::Dumper;

# Example to get hash keys from the value;

print "\n\t ** Finding Keys of hash from the value ** \n";

my %hashPersonal =(
    "My Name" =>"Sumit",
    "City" =>"Bangalore",
    "State" =>"Karnataka",
    "Pin" => "560078",
    "WorkCity" =>"Bangalore" 
    
);

my $hashPersonlaRef =\%hashPersonal;

print Dumper $hashPersonlaRef;
print "\n ** If the values are unique ** \n";

my %revPersonal = reverse %hashPersonal; 
print "\n Enter the Value to find the corresponding Key of hash :  ";
my $inputVal =<STDIN>;
chomp $inputVal;


for (my $key = $revPersonal{$inputVal} ){
    print "\n\t Key :$key => Value :$inputVal \n";
}

# If you might have duplicate values, grep is your friend:

# If your values are numeric, use "==" instead of eq.

if($inputVal=~ m/(\d)/g) {
    my @keys = grep { $hashPersonal{$_} eq $inputVal } keys %hashPersonal;
    print "\n\t Key for the value $inputVal : ",@keys;
}
else
{
    my @keys = grep { $hashPersonal{$_} eq $inputVal } keys %hashPersonal;  
    print "\n\t Key(s) for the value $inputVal : ",join(",",@keys),"\n";
}


print "\n\t *** Adding element in the hash Randomly ***\n ";

my %randomHash=("Native","Jamshedpur","Nationality","Indian","Foreign","USA");

while (my ($key,$value)=each(%randomHash)) {


    $hashPersonal{$key}="$value";
}

print Dumper $hashPersonlaRef;

