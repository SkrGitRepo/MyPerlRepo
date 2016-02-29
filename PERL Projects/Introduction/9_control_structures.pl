for($i = 1; $i <= 5; ++$i)
{
	#if($i == 3)
	#{
	#	last; # last is equivalent to break of C
	#}
	last if $i == 3; # single line if statement
	print $i, "\n";
}
print "over\n";
for($i = 1; $i <= 5; ++$i)
{
	#if($i == 3)
	#{
	#	next; # next is equivalent to continue of C
	#}
	next if $i == 3; # single line if statement
	print $i, "\n";
}

print "over\n";
abc:for($i = 1; $i <= 5; ++$i)
{
	for($j = 0; $j < 5; ++$j)
	{
		#if($i == 3)
		#{
		#	last abc; # 
		#}
		last abc if $i == 3; # single line if statement
		print $j, "\n";
	}
	#print $i, "\n";
}
print "over\n";
# last can follow a label name
# next can also follow a label name
