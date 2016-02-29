#!perl -w
use strict;
use Data::Dumper;
use Text::CSV_XS;

my $csv = Text::CSV_XS->new;

 open my $csv_fh, ">", "hello.csv" or die "hello.csv: $!";
 print Dumper $csv_fh;

 my @sample_input_fields = (
     'You said, "Hello!"',5.67,
     '"Surely"',   '',   '3.14159');
 if ($csv->combine(@sample_input_fields)) {
     print $csv_fh $csv->string, "\n";  #writing array as csv file
     print $csv->string, "\n";
     }
 else {
     print "combine () failed on argument: ",
         $csv->error_input, "\n";
     }
 close $csv_fh or die "hello.csv: $!";