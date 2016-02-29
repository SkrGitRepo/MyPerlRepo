#!perl -w
use strict;
use Data::Dumper;
# to substitute the all digit to null
my $strdig ="May 28th 2012?";

print "\n Original string is  : ",$strdig,"\n";

$strdig =~s/\d//g;

print "\n String after Replacing all the digits to null : ",$strdig;

my $str = q{.:*&#%/whi<>te'.field"};
print qq{\n$str};
$str = quotemeta $str;
print qq{\nAfter Quotemeta: $str};

if ($str =~ /whi/g) {
	print qq{\nREGEX PASSED};
} else {
	print qq{\nREGEX FAILED};
}