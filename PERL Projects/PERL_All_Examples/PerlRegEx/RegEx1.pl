#!/usr/bin/perl
use strict;
use warnings;

print "\n #---------------------------------#\n";

my $regex = 'sumkuma2@@cisco.com';
my $result = $regex =~ m/\@{1}/g;
if ($regex =~ m/(\@){1}/) {
	print "\n Found one \@ symbol in the string $regex\n";
} else {
	print "\n Not Matched  \n";
}

print "\n #---------------------------------#\n";
my $regex1 = "3 4 5 6 9 "; 
my $result1 = $regex1 =~/(\d\s){3}/;
if ( $regex1 =~/(\d\s){3}/) {
	print "\n Found at least three digit folowed by white space in the string $regex1 \n";
} else {
	print "\n Not Matched  \n";
}

print "\n #---------------------------------#\n";
print "\n Using RegEx on email id \n";


my ($emailid,$emailalias,$domain);
#Extraciting an email id from a given string
grep { /^--(emailid)=(.+)/ and $emailid = $2} "--emailid=sumit_skr\@#134\@hotmail.com";

#Extracting the User alias and email domain from a emailid
#grep { /(\w+)*\@(.+)/ and $emailalias = $1 and $domain=$2} "$emailid"; #Wont able to extract when special character is there
grep { /(.+)*\@(.+)/ and $emailalias = $1 and $domain=$2} "$emailid";

print "\n User Email ID : $emailid : in this \n User Alias is :$emailalias, and \n email Domain is:$domain \n";

my $dir="/usr/SD/perl/Hello.pm";
my $file="Hello.pm";
my $match ;

($match = $file =~ m/^.*(\/$dir\/.*)$/);
print "File Name is :",$match,$1;


#print "\n RESULT : ",$result;
#print "\n RESULT1 : ",$result1;

