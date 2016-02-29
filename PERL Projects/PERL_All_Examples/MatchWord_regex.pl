#!perl -w
use strict;
use Data::Dumper;

#my $template ='Sumit kumar';
my $cli_template_name ="IOS Switch Basic Services";
#my $cli_template_name ="IOS";
#if ($template =~m /([^",',\n]+)/)
#if ($template =~m /[^",',\n]+/)
if ($cli_template_name =~ m/^(.+)#(\d+)$/)
  
  #my ($result) = ($cli_template_name =~ m/^(\s*[^-,\s,:]+\s*)$/);
  #print $result;
  #if ($cli_template_name =~ m/^(\s*[^-,\s,:]+\s*)$/)
 #if ($cli_template_name =~ m/([^",',#,\n]+)/) 
 
 #if ($cli_template_name =~ m/^([\w-]+)/)
{
	#print "Matched \n",$1;
	
	#print $template;
	
	print "Matched \n";
	#print $cli_template_name; 
	
} else {
	#print "Not Matched",$1;
	print "Not Matched";
}

