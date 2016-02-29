use strict;
#use -w;

#my $decimal='7';

#my $binary = undef;

#if (($decimal%2) ge '0')
# {
# 	$decimal =($decimal%2);
# 	print $decimal;
# 	if( $decimal eq (0 or 1)) {
# 		$binary .=$decimal;
# 	
# 	}
# 	
# 	
# }
# print ($binary);

print "Enter a number to convert: ";
my $decimal ='7';
#chomp($decimal = <STDIN>);

print "\nConverting $decimal to binary...\n";
my $remainder = $decimal%2;
while($decimal ge 0)
{
    $decimal/2;
    print $remainder;
}

#for (i=0;)
