# perl is highly context sensitive
#	works based on the context

# program structures
#	- no starting point like main
#	- case sensitive
#	- free format source code

# there are 3 ways of outputting the info.
#	1. print : unformatted
#	2. printf : formatted 
#	3. write : uses format statement
#
# print 
#	- is a function
#	- parentheses is optional (user-defined or built-in)
#	- on success return 1 otherwise undef
#	- can take variable number of args

print "hello, world\n";
print("hello, world\n");
#Print "hello, world\n"; # compile time error
print "hello, 
			world,
			  of PERL\n";
print "hello ", "world\n";
#$\ : Output Record Separator
#	default value : undef
# undef 
#	keyword in perl
#	numeric context : 0
#	string context  : null string
$\ = "\n";
print "-----------";
print 2 + 2; # 4
print (2 + 2) * 5; # 4
print "-----------";
print ((2 + 2) * 5); # 20
print "-----------";
print(print(2 + 2) * 5); # 4 5
#            4 and returns 1 
#print (1 * 5)
# outputs 5



