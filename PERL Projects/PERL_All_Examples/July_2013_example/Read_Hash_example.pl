use strict;
use Data::Dumper;


my $host_service_grp = {
			'router' => {
                        	     'sjc12-00-gw1.cisco.com' => [
								      '3001419',
								      '3000093',
								      '3000030',
								      '3000021',
								      '3004761'
                                                    		],
                        	      'sjc08-00-gw1.cisco.com' => [
								      '1003941',
								      '1000093',
								      '1003165',
								      '1000023',
								],
				},
			'lanswitch' => {
			                'sjc12-22-gw1.cisco.com' => [
											      '4001419',
											      '4000093',
											      '4000030',
											      '4000021',
											      '5004761'
			                                		],
			                'sjc08-00-gw1.cisco.com' => [
											      '5003941',
											      '6000093',
											      '6003165',
											      '6000023',
								],
				}
		};

print Dumper $host_service_grp;

my ($template_list,$host,$hostlist,$service,$host_tmpl_list,$host_templates);
foreach $service(keys %$host_service_grp) {
	$template_list = undef;
	print  "\n service :\n",Dumper $service;
	#my @office_list;
	#push ($office_list,[keys %{$hello->{$office}}]);
	$hostlist = [keys %{$host_service_grp->{$service}}];
		
	$host_tmpl_list = $host_service_grp->{$service};
	
	print "\n **** Value of Host :::::: ", Dumper $host_tmpl_list,"\n ";
	print "\n Host list :" ,Dumper $hostlist;
	
	foreach $host (@$hostlist) {
		#print "\n Hostname  :",$host;
		
		#print "\n Locztion : ", $hello->{$office}->{$office_name}->[0];
	        #[values $hello->{'office1'}->{'accenture'}]
	        #[values $host_service_grp->{$service}->{$host}]
		
		push ( @$template_list,@{$host_service_grp->{$service}->{$host}});
		
		#print "\n Host_template : ", $host_service_grp->{$service}->{$host}->[0];
		
	}
	print "\n All templates  :",Dumper $template_list;
	
	foreach my $template_id (@{$template_list}) {
		print Dumper $template_id
	}
}
#print "\n All templates  :",Dumper $template_list;

if ( ref ($host_tmpl_list) eq 'HASH' ){
	foreach my $host_tmpl (keys %{$host_tmpl_list}) {
	
		#push (@$host_templates, @{$host_tmpl_list->{$host_tmpl}});
		
		foreach my $template_id (@{$host_tmpl_list->{$host_tmpl}}) {
					
					print "\n Host: $host_tmpl :  Template id ",$template_id ,"\n";
		}
		
	}
	
	
	


}



