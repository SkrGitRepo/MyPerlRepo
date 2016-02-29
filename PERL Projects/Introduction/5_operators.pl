# operators
#	1. Arithmetic : + - / * % **
#	2. String : . x (replication operator)
#	3. Assignment : = += -= /= *= %= **= .= x=
#					++ --
#	
$\ = "\n";
#$, : Output Field Separator
#	default value : undef
$, = "\t";
print 25 / 4, 25.0 / 4, int(25/4); # 6.25 6.25 6
print "25.9" % "4.4"; # 25 % 4 ==> 1, integer context
print 4 ** 3; # 8
print 2 ** 3 ** 2; # 512, right to left association
print "cg" x 3; # cgcgcg
print 25 x 3.3; # first arg : string, second arg : integer, 252525

# assignment :
#	- is an expr.
#	- expr. has a value
#	- returns the l-value

$x = 10;
($x += 2) *= 3;
print $x; # 36


# increment operators are magical op. in perl
#	but not decrement op

$x = 99;
print ++$x; # 100

$x = "5a";
print ++$x; # 6

$x = "a9";
print ++$x; # b0

$x = "a9b";
print ++$x; # 1

$x = "zz";
print ++$x; # aaa

$x = "zz";
print --$x; # -1

$a = "A5";
$b = $a + 10;
print ++$a; # 1
print $b; #10



