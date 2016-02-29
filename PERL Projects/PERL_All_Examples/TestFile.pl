#!perl -w
use strict;


# mode
#	write  : >
#	read : <
#	append : >>

# PERL IO FIle operations #



print "\n ## # PERL IO FIle operations # ##\n";


print "##  Opening a file  ##";

print "Before Opening a file \n";

my $FH;

open ($FH,"TestFile.txt") or die "Error while opening a file : ",$!;

print "After Opening a file \n";

print "\n Closing the file FH \n ";
close($FH );


print "\n ##  Writing operation on a file ## \n";
my $FHW;
my $fileName ="TestFile1.txt";
open ($FHW,"> $fileName") or die "Error while writing a file : ",$!;

print "\n Writing after Opening file: $fileName \n";

print $FHW "Hello world \n";

print "\n Closing file $fileName after writing \n";

#close($FHW);

close ($FHW) or die "Problem in closing the file :$fileName ",$!;  #throw an error when we close the file again after closing it before.



print "\n ##  Reading operation on a file ## \n";

my $FHR;
#my $fileName ="TestFile1.txt";
open ($FHR,"<$fileName") or die "Error while reading a file : ",$!;

print "\n Reading after Opening file: $fileName \n";

while (my $read = <$FHR>) {
    print "$read \n";

}
print "\n Closing file $fileName after reading";

close($FHR);

print "\n ##  Reading operation on a file ## \n";

my $FHR;
#my $fileName ="TestFile1.txt";
open ($FHR,">>$fileName") or die "Error while reading a file : ",$!;

print "\n Reading after Opening file: $fileName \n";

=head
while (my $read = <$FHR>) {
    print "$read \n";

}
=cut
print "\n Closing file $fileName after reading";

close($FHR);

