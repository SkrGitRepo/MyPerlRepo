#!/usr/bin/perl

use strict;                                                                                                                                                                                                    
use warnings;                                                                                                                                                                                                  
use Term::ReadKey;                                                                                                                                                                                             

my $key = 0;                                                                                                                                                                                                   
my $password = "";                                                                                                                                                                                             

print "\nPlease input your password: ";                                                                                                                                                                        

# Start reading the keys                                                                                                                                                                                       
ReadMode(4); #Disable the control keys                                                                                                                                                                         
while(ord($key = ReadKey(0)) != 10)                                                                                                                                                                            
# This will continue until the Enter key is pressed (decimal value of 10)                                                                                                                                      
{                                                                                                                                                                                                              
    # For all value of ord($key) see http://www.asciitable.com/                                                                                                                                                
    if(ord($key) == 127 || ord($key) == 8) {                                                                                                                                                                   
        # DEL/Backspace was pressed                                                                                                                                                                            
        #1. Remove the last char from the password                                                                                                                                                             
        chop($password);                                                                                                                                                                                       
        #2 move the cursor back by one, print a blank character, move the cursor back by one                                                                                                                   
        print "\b \b";                                                                                                                                                                                         
    } elsif(ord($key) < 32) {                                                                                                                                                                                  
        # Do nothing with these control characters                                                                                                                                                             
    } else {                                                                                                                                                                                                   
        $password = $password.$key;                                                                                                                                                                            
        print "*(".ord($key).")";                                                                                                                                                                              
    }                                                                                                                                                                                                          
}                                                                                                                                                                                                              
ReadMode(0); #Reset the terminal once we are done                                                                                                                                                              
print "\n\nYour super secret password is: $password\n"; 
