#!C:/My Installation/Perl64/bin/perl
#perl -M
#LWP::Simple -e 'getprint "http://www.sn.no"'

 use LWP::Simple;
 
 use CGI;
 
 my cgiobj = CGI->new;
 #$content = get("http://www.sn.no/");
 $content = get("http://localhost/"); 
 die "Couldn't get it!" unless defined $content;

 if (mirror("hhttp://localhost/", "foo") == RC_NOT_MODIFIED) {
     print "Got the content";
 }

 if (is_success(getprint("http://localhost/"))) {
     print "No contents available";
 }