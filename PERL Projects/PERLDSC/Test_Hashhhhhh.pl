use strict;
use Data::Dumper;

my %HoH = {
   'Family' => 
   	{
   		'F1'=> {
   			'kumar'=>'sumit',
   			},
   	        'F2'=> {
			'Kumar'=>'Niraj',
   			}
   	},
};

=pod
foreach my $family ( values %$HoH ) {
     #print "$family: { ";
     for my $role ( keys %{$family} ) {
         print Dumper $role ; #"$family->{$role}->{kumar} ";
         
         
         &test_hash($HoH);
     }
     #print "}\n";
 }
 
=cut
#my $value = "F";
#my @keys = grep { $HoH{$_} eq $value } keys %HoH;

#print Dumper \@keys;
 
=pod
 sub test_hash {
 my $hoh = shift;
 
 
 foreach my $family ( values %$HoH ) {
      
      for my $role ( keys %{$family} ) {
          print Dumper $role ; #"$family->{$role}->{kumar} ";
          
          
          print $role->{'kumar'};
      }
      
 }
 

 }
 =cut