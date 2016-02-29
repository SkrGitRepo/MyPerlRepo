#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

=pod
print "Hello, World...\n";
my @AoH = (
        {
            Lead     => "fred",
            Friend   => "barney",
        },
        {
            Lead     => "george",
            Wife     => "jane",
            Son      => "elroy",
        },
        {
            Lead     => "homer",
            Wife     => "marge",
            Son      => "bart",
        }
  );




  
  $AoH[0]{Daughter} = "Louis";
  
   if (exists $AoH[2]{Lead}) {
      my $onramp_usr_type = $AoH[2]{Lead};
      print "LEAD is  $onramp_usr_type";

  }

=cut
  #print Dumper \@AoH;


my @AoHH =(
			{
			'bmorey' => {
                          'added_by' => 'EMAN::SuperUser',
                          'user_type' => 'SuperUser'
                        },
          
            'vmunikri' => {
                            'added_by' => 'EMAN::SuperUser',
                            'user_type' => 'SuperUser'
                          },
            'nepatel' => {
                           'added_by' => 'CPO',
                           'user_type' => 'SuperUser'
                         },
            'stepzhao' => {
                            'added_by' => 'CPO',
                            'user_type' => 'SuperUser'
                          }
          },

		  {
			'bmorey' => {
                          'added_by' => 'EMAN::SuperUser',
                          'user_type' => 'SuperUser'
                        },
            'vmunikri' => {
                            'added_by' => 'EMAN::SuperUser',
                            'user_type' => 'SuperUser'
                          },
            'nepatel' => {
                           'added_by' => 'CPO',
                           'user_type' => 'SuperUser'
                         },
            'stepzhao' => {
                            'added_by' => 'CPO',
                            'user_type' => 'SuperUser'
                          },
          },
		 );


		#print Dumper \@AoHH;


		for my $href ( @AoHH ) {
			print "{ ";
			for my $role ( keys %$href ) {
			print "\n USER_NAME : $role :\n";
			my $user_type = $href->{$role}->{user_type};
			print "$role => USER_TYPE = $user_type\n";
			print "$role => ADDED BY = $href->{$role}->{added_by}\n";
			}
			print "}\n";
        }


