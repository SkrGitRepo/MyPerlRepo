 #!/usr/bin/perl

  use strict;
  use warnings;
  use XML::Simple qw(:strict);

=pod
  my $filename = 'library.xml';

  my $library  = XMLin($filename,
    ForceArray => 1,
    KeyAttr    => {},
  );

  foreach my $book (@{$library->{book}}) {
    print $book->{title}->[0], "\n" 
  }
  
  
=cut

 my $destfile ='applications';
 
 
 print "\n:::$destfile::::\n";
 
       ($destfile) = ($destfile =~ m/^.*(\/ctm_backup\/.*)$/);
                         chomp($destfile);
                         
                         
                         print "\n:::$destfile::::\n";


                  