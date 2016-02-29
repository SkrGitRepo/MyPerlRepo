#!perl -w
use strict;

my $emailAddress ="sumit_skr\@g.hhh";
chomp $emailAddress;

if($emailAddress =~ m/^[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})$/) {

    print "email address is valid";
    print $';
    
} else {

    print "email address is not valid";

}