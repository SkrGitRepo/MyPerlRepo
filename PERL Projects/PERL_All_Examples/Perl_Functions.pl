#!perl -w
use strict;
use Data::Dumper;
# Perl pre defined functions:


# 1)  
=pod
print 1+2+4;        # Prints 7.
print(1+2) + 4;     # Prints 3.
print (1+2)+4;      # Also prints 3!
print +(1+2)+4;     # Prints 7.
print ((1+2)+4);    # Prints 7.
=cut   
# chomp() and chop()
my $string ="sumit kumar";
my $chpd = chop($string);
print " \n $chpd \n";  # r

my $mylist =('sumit',12345,"Kumar\n\n");
print "list :",chomp($mylist),"\n";  # 1

my $string1 ="sumit kumar\\?"; 
chomp($string1);
print "Strign chomped ",$string1; #sumit kumar\?
my $chmpd = chomp($string1);
print "\n $chmpd \n"; #0


# chr()
print chr(65)."\n"; #A

my %myhash =(1 => "One",
             2=>"Two",
             3=>"Three"
             );

#print Dumper(\%myhash);
while(my($key,$value)= each %myhash ){
	print $key ."=>".$value."\n";
}

# exec() # to excute any program 

 exec ('saveEVAL.pl') or print STDERR "couldn't exec foo: $!"; # execute the saveEval.pl file and its o/p will be printed
 
# each()

