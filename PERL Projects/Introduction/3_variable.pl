# variables :
#	- 4 types
# 1. scalar
#	- can take only one value
#	- name of the variable will starts with the symbol $
# 2. array
#	- one or more components
#	- each component is a scalar
#	- name starts with the symbol @
# 3. hash
#	- one or more components
#	- each component is a key-value pair, which are scalars
#	- name starts with the symbol %
# 4. references
#	- similar to pointers of C
#	- is a scalar
#	- $

# all of them are strored as string in perl

$\ = "\n";
$x = 10; # $x = "10"
$y = 20;
print $x + $y; # 30
print $x . $y; # 1020, . is the concatenation operator in perl
print ;
$x = "10";
$y = "20";
print $x + $y; # 30
print $x . $y; # 1020
print;
$x = "cg10";
$y = "20hp";
print $x + $y; # 20
print $x . $y; # cg1020hp

print;
$x = "cg10";
$y = "hp20";
print $x + $y; # 0
print $x . $y; # cg10hp20
