
use strict;
use warnings;
use String::HexConvert ':all';

print "Conver string to Hexa or Vice versa\n";

print ascii_to_hex("Cisco123!"); # writes: 68656c6c6f20776f726c64

print hex_to_ascii("436973636f31323321"); # writes: hello world
#436973636f31323321
