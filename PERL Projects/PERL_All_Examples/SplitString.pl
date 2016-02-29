#!perl -w
use strict;

my $string =q{sumit          KUMAR};

#spliting the string by whitespace
my @var =split(' ',$string);
my $str =undef;
print "\n Converting the string $string to Sentence Case pattern Using Regex : \n";

foreach my $val(@var){
    # converting the each string element of @var to lowercase then the first letter to uppercase
	$val =ucfirst(lc($val));
	
	# concatinating the string with space
	if($str){
		$str .= ' ' . $val;
	} else {
		$str = $val;
	}
}

print $str;

my $strnew = " Raja KUMAR";

print "\n Conversion of string $strnew to Sentence Case pattern Using Regex : \n";

$strnew =~ s/(\w+)/\u\L$1/g;

print $strnew;
 
 

