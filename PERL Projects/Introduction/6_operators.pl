# Relational :
#	numeric : < > <= >= == != <=> (similar to strcmp of C)
#	string  : lt gt le ge eq ne cmp
# Logical :
#		! && ||
#		not and or (lowest precedence)

$\ = "\n";

print "cg" == "hp"; # 1, true(numeric context)
print "10 >25 : ", 10 > 25; # undef

# true  : -5 5 1 "abc"
# false : 0 '' "" undef

print 5 <=> 5 ; # 0, equal
print 5 <=> 10; # -1, in order (ascending)
print 15 <=> 10; # 1, not in order 

print '"cg" eq "hp" : ', "cg" eq "hp"; # undef
print "amar" cmp "amar" ; # 0, equal
print "amar" cmp "akbar" ; # 1, not in order
print "amar" cmp "anthony" ; # -1, in order
print "10 gt 5 : ", 10 gt 5; # undef

$a = 0;
$b = 10;
#print $b / $a; # runtime error	

# perl supports short circuit eval.
print $a == 0 || $b / $a > 0; # 1
print $a != 0 && $b / $a > 0; # undef





