# control structures :
#	1. selection
#		a)
#			if(<expr>)
#			{
#				....
#			}
#		b)
#			if(<expr>)
#			{
#				....
#			}
#			else
#			{
#				....
#			}
#		c)
#			if(<expr>)
#			{
#				if(<expr>)
#				{
#					....
#				}
#			}
#			elsif(<expr>)
#			{
#				....
#			}
#			elsif(<expr>)
#			{
#				....
#			}
#			else
#			{
#				....
#			}
#		d)
#			unless(<expr>)
#			{
#				....
#			}
#
#	2. looping
#		a)
#			while(<expr>)
#			{
#				....
#			}
#			top tested looping structure
#			executes 0 or more times
#			terminates when the expr is false
#		b)
#			until(<expr>)
#			{
#				....
#			}
#			top tested looping structure
#			executes 0 or more times
#			terminates when the expr is true
#		c)
#			for(expr1; expr2; expr3)
#			{
#				....
#			}
#			top tested looping structure
#			executes 0 or more times
#			terminates when the expr2 is false
#		d)
#			do
#			{
#				....
#			} while(<expr>);
#			bottom tested looping structure
#			executes 1 or more times
#			terminates when the expr is false
#
#		e)
#			do
#			{
#				....
#			} until(<expr>);
#			bottom tested looping structure
#			executes 1 or more times
#			terminates when the expr is true
#		f) 
#			foreach var(list)
#			{
#				....
#			}
#			terminates, when no more elements in the list
