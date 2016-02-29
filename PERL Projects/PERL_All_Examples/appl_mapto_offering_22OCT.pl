#!/apps/SD/perl/bin/perl -s
use strict;
use Data::Dumper;
use Getopt::Long;
use EMAN::Framework::Object;
use EMAN::DBI;
#use EMAN::Job;
#use EMAN::Job::Agent;

&main(@ARGV);
exit( 0 );


#----------------------------------------------------------------------
=pod

=head2  main()                      -- PUBLIC

USAGE:

    &main();
    exit( 0 );

DESCRIPTION:

Handle the top-level logic.

=cut

sub main { 
	my( $cfg )  = {};	
	my ($appl_name,$applid,$ser_offering,$help);

	$cfg->{obj} = new EMAN::Framework::Object();
    $cfg->{dbh} = $cfg->{obj}->get_dbh();


	&usage() if ( @ARGV < 2 or
			! GetOptions('help|?' => \$help, 'applid=i' => \$applid, 'applname=s' => \$appl_name, 'offering=s' => \$ser_offering)
			or defined $help );

	$cfg->{applid} = $applid if ($applid);;
#	$cfg->{applname} = $appl_name if ($appl_name);;
#	$cfg->{offering} = $ser_offering if ($ser_offering);

	&validate_appl_offering_map($cfg,$appl_name,$ser_offering);

	&lookup_group_name($cfg);

	print "\ CFG elements :\n ", Dumper $cfg;
    #&create_egm_groups( $cfg );
    #&create_avmet_groups( $cfg );
    #&delete_unused_egm_groups( $cfg );
exit;
	$cfg->{hostname}    = `hostname`;
    chomp( $cfg->{hostname} );

    #&parse_svg( $cfg );

	
	print "\n APPLID:$cfg->{applid} \n" if ($applid);
	print "\n APPL NAME:$cfg->{applname} \n" if ($appl_name);
	print "\n SERVICE OFFERING :$cfg->{offering} \n " if ($ser_offering);

}

sub validate_appl_offering_map {
	
	my $cfg = shift;
	my $applname = shift;
	my $offering = shift;
	my ($applid,$appl_me_id);
	my $sth;

	my $sql = "select applid,me_id from appl_config_master where appl_name='$applname' and appl_status='A'";
	eval {
		$sth = $cfg->{dbh}->prepare($sql);
		$sth->execute();
		($applid,$appl_me_id) = $sth->fetchrow();
		if (!$applid) {
			$sth->finish();
			die "\n No Application found with name :$applname\n";
		}

		$cfg->{'APPLNAME'} =$applname if defined $applname;
		$cfg->{'ME_ID'} = $appl_me_id if defined $appl_me_id;
		$cfg->{'APPLID'} = $applid if defined $applid;
		$sth->finish();
		
		print "\nME ID :$appl_me_id\n APPLID:$applid\n";
		#exit;
	};
	if ($@) {
		print "\n FAULT: $@\n";
	}

	($sql) = join ("\n",
			"SELECT",
				 "off.name AS offering,",
                 "ser.name AS service,",
                 "owner.email_alias AS owner,",
                 "mgr.email_alias AS manager",
            "FROM",
				 "me_managed_element bag,",
                 "employee exec,",
                 "employee arch,",
                 "me_relationship mer_bag_spec,",
                 "me_managed_element spec,",
                 "me_relationship mer_spec_off,",
                 "me_managed_element off,",
                 "me_service_offering so,",
                 "employee owner,",
                 "employee mgr,",
                 "me_relationship off_ser,",
                 "me_managed_element ser,",
                 "me_ds_datasource_me_map map,",
                 "me_ds_datasource_me_map ser_map",

           "WHERE",
				 "bag.me_mm_class_id = 35", 
				 "AND bag.delete_flg = 'N'",
				 "AND bag.me_id = mer_bag_spec.primary_me_id",
				 "AND mer_bag_spec.secondary_me_id = spec.me_id",
				 "AND mer_bag_spec.delete_flg = 'N'",
				 "AND spec.me_status_cd != 'Retired'",
				 "AND spec.me_mm_class_id = 4",
				 "AND spec.delete_flg = 'N'",
				 "AND spec.me_id = mer_spec_off.secondary_me_id",
				 "AND mer_spec_off.primary_me_id = off.me_id",
				 "AND mer_spec_off.delete_flg = 'N'",
				 "AND off.me_mm_class_id = 5",
				 "AND off.delete_flg = 'N'",
				 "AND off.me_id = so.me_id",
				 "AND so.service_owner_employee_objid = owner.employee_objid(+)",
				 "AND so.service_so_mgmt_employee_objid = mgr.employee_objid(+)",
				 "AND SO.SERVICE_EXEC_EMPLOYEE_OBJID = EXEC.EMPLOYEE_OBJID(+)",
				 "AND SO.SERVICE_ARC_EMPLOYEE_OBJID = ARCH.EMPLOYEE_OBJID(+)",
				 "AND off.me_id = map.me_id",
				 "AND ser.me_id = ser_map.me_id",
				 "AND off.me_id = off_ser.secondary_me_id",
				 "AND off_ser.primary_me_id = ser.me_id",
				 "AND off_ser.delete_flg = 'N'",
				 "AND ser.me_mm_class_id = 40",
				 "AND ser.delete_flg = 'N'",
				 "AND bag.me_id = '$appl_me_id'",
				 "AND off.name = '$offering'",
			"ORDER BY",
				"spec.name",
		 );

	eval {
		$sth = $cfg->{dbh}->prepare($sql);
		$sth->execute();

		my ($ser_offering,$service,$owner,$manager) = $sth->fetchrow();

		if ( (!$ser_offering) or ($ser_offering ne $offering) ) {
			$sth->finish();
			die "\n Service offering : $offering not matched with any offering associated to application :$applname.\n";
		}
		#print "\n::$ser_offering:::$offering::\n ::::$service::";

		#$cfg->{'SERVICE'} = $service if ($service);
		#$cfg->{'SERVICE'}->{$service}->{'OFFERING' }= $ser_offering if ($ser_offering);
		#$cfg->{'SERVICE'}->{$service}->{'OWNER'} = $owner if ($owner); 
		#$cfg->{'SERVICE'}->{$service}->{'MANAGER'} = $manager if ($manager);

		$cfg->{'OFFERING'} = $ser_offering if ($ser_offering);
		$cfg->{'SERVICE'} = $service if ($service);
		$cfg->{'OWNER'} = $owner if ($owner);
		$cfg->{'MANAGER'} = $manager if ($manager);

		$sth->finish();

		#print "\n OFFERING :$cfg->{'OFFERING'}\n SERVICE:$cfg->{'SERVICE'}\n OWNER:$cfg->{'OWNER'}\n MANAGER:$cfg->{'MANAGER'}\n";
	};
    if ($@) {
        #print "\n FAULT: $@\n";
        die "\n FAULT: $@\n";
    }
}

sub lookup_group_name {
	my $cfg = shift;
	my $service = $cfg->{'SERVICE'};
	my $offering = $cfg->{'OFFERING'};

	print " APPL NAME $cfg->{'APPLNAME'}\ OFFERIN:$cfg->{'OFFERING'} \n $cfg->{'SERVICE'}";
	

	$cfg->{'EGM_GROUP'} = &egm_group_name( $cfg, $service );
    $cfg->{'AVMET_GROUP'} = &avmet_group_name( $cfg, $service );
    $cfg->{'AVMET_SUBGROUP'} = &avmet_subgroup_name( $cfg, $offering );

	print "\nEGM_GROUP:$cfg->{'EGM_GROUP'}\nAVMET_GROUP:$cfg->{'AVMET_GROUP'}\nAVMET_SUBGROUP:$cfg->{'AVMET_SUBGROUP'}\n";
}

 
sub	egm_group_name
{
    my( $cfg )	= shift;
    my( $name )	= "svc-" . lc( shift );
    $name	=~ s/ /\_/g;
    $name	=~ s/&\#45;//g;
    $name	=~ s/\(//g;
    $name	=~ s/\)//g;
    $name	=~ s/\,//g;
    $name	=~ s/\./_/gi;
    $name	=~ s/\///g;
    $name	=~ s/_$//gi;
    $name	=~ s/_&amp;_/_/g;
    $name	=~ s/_\&_/_/g;
    $name	=~ s/_-_/_/g;
    $name	=~ s/\/_/_/gi;
    $name	=~ s/__/_/gi;
    $name	=~ s/_and_/_/g;
    $name	=~ s/_Other_/_/g;
    $name	=~ s/advanced/adv/gi;
    $name	=~ s/allocation/alloc/gi;
    $name	=~ s/Communication/Comm/gi;
    $name	=~ s/architecture/arch/gi;
    $name	=~ s/assessment/assess/gi;
    $name	=~ s/assignment/assign/gi;
    $name	=~ s/business/bus/gi;
    $name	=~ s/collaboration/collab/gi;
    $name	=~ s/compliance/compl/gi;
    $name	=~ s/lifecycle/lifec/gi;
    $name	=~ s/master/mast/gi;
    $name	=~ s/conferencing/conf/gi;
    $name	=~ s/consulting/consult/gi;
    $name	=~ s/environmental/env/gi;
    $name	=~ s/environment/env/gi;
    $name	=~ s/Replications/Repl/gi;
    $name	=~ s/Collaboration/Collab/gi;
    $name	=~ s/customer/cust/gi;
    $name	=~ s/learn_soln_dev/lrn_soln/gi;
    $name	=~ s/development/dev/gi;
    $name	=~ s/engineer/eng/gi;
    $name	=~ s/enterprise/ent/gi;
    $name	=~ s/environmental/env/gi;
    $name	=~ s/excess_goods/excess/gi;
    $name	=~ s/external/ext/gi;
    $name	=~ s/financial/fin/gi;
    $name	=~ s/governance/gov/gi;
    $name	=~ s/implementation/impl/gi;
    $name	=~ s/information/info/gi;
    $name	=~ s/infrastructure/infra/gi;
    $name	=~ s/ing_/_/gi;
    $name	=~ s/innovation/innov/gi;
    $name	=~ s/integration/int/gi;
    $name	=~ s/intelligence/intel/gi;
    $name	=~ s/inventory/inv/gi;
    $name	=~ s/lifecycle_mgmt/lifec_mgm/gi;
    $name	=~ s/management/mgmt/gi;
    $name	=~ s/ment_/_/gi;
    $name	=~ s/operational/ops/gi;
    $name	=~ s/operations/ops/gi;
    $name	=~ s/outsourced/outsrc/gi;
    $name	=~ s/product/prod/gi;
    $name	=~ s/fulfillment/fulfill/gi;
    $name	=~ s/order_mgmt_scheduli/ord_mgt_schd/gi;
    $name	=~ s/performance/perf/gi;
    $name	=~ s/portfolio/port/gi;
    $name	=~ s/process/proc/gi;
    $name	=~ s/project/proj/gi;
    $name	=~ s/provisioning/prov/gi;
    $name	=~ s/registration/reg/gi;
    $name	=~ s/request_/_/gi;
    $name	=~ s/returned/ret/gi;
    $name	=~ s/scheduling/sched/gi;
    $name	=~ s/serial_number/sn/gi;
    $name	=~ s/service/svc/gi;
    $name	=~ s/skills_knowledge/skills/gi;
    $name	=~ s/software/sw/gi;
    $name	=~ s/solution/soln/gi;
    $name	=~ s/strategic/strat/gi;
    $name	=~ s/technology/tech/gi;
    $name	=~ s/tracking/track/gi;
    $name	=~ s/transformation/trans/gi;
    $name	=~ s/certification/cert/gi;
    $name	=~ s/validation/valid/gi;
    $name	=~ s/workforce/workf/gi;
    $name	=~ s/reporting/rptg/gi;
    $name	=~ s/,//g;
    if  (length( $name ) > 32)
    {
        print "EGM-TRUNCATION: $name =>";
        $name	= substr( $name, 0, 32 );
        print "$name\n";
    }
    return( $name );
}





#----------------------------------------------------------------------
sub	avmet_group_name
{
    my( $cfg )	= shift;
    my( $name )	= "SVC-" . shift;
    $name	=~ s/ /\_/g;
    $name	=~ s/&\#45;//g;
    $name	=~ s/_$//gi;
    $name	=~ s/_&amp;_/_and_/g;
    $name	=~ s/Replications/Repl/gi;
    $name	=~ s/Operational/Ops/gi;
    $name	=~ s/Other_Channel_Partner/Channel_Partner/gi;
    $name	=~ s/Environment/env/gi;
    $name	=~ s/Collaboration/Collab/gi;
    $name	=~ s/_\&_/_/g;
    $name	=~ s/\/_/_/g;
    $name	=~ s/_-_/_/g;
    $name	=~ s/__/_/gi;
    $name	=~ s/_and_/_/g;
    $name	=~ s/,//g;
    if  (length( $name ) > 64)
    {
        print "GROUP-TRUNCATION: $name =>";
        $name	= substr( $name, 0, 64 );
        print "$name\n";
    }
    return( $name );
}


#----------------------------------------------------------------------
sub	avmet_subgroup_name
{
    my( $cfg )	= shift;
    my( $name )	= "OFF-" . shift;
    $name	=~ s/ /\_/g;
    $name	=~ s/_\(\d\.\d\)//g;
    $name	=~ s/&\#45;//g;
    $name	=~ s/_$//gi;
    $name	=~ s/_\&_/_/g;
    $name	=~ s/\/_/_/g;
    $name	=~ s/_-_/_/g;
    $name	=~ s/_\&amp;_/_/g;
    $name	=~ s/__/_/gi;
    $name	=~ s/_and_/_/gi;
    $name	=~ s/,//g;
    $name	=~ s/Governance/Govern/gi;
    $name	=~ s/Replications/Repl/gi;
    $name	=~ s/Software/SW/gi;
    $name	=~ s/License/Lic/gi;
    $name	=~ s/demand_supply_commit/demand/gi;
    $name	=~ s/Cisco_Practice_//gi;
    $name	=~ s/Lifecycle/Lifec/gi;
    $name	=~ s/receive/rcv/gi;
    $name	=~ s/Collaboration/Collab/gi;
    $name	=~ s/with_Retailers/Retailsers/gi;
    $name	=~ s/Management/Mgmt/gi;
    $name	=~ s/Architecture/Arch/gi;
    $name	=~ s/Application/Appl/gi;
    $name	=~ s/Strategy/Strat/gi;
    $name	=~ s/Planning/Plan/gi;
    $name	=~ s/Acquisition/Acq/gi;
    $name	=~ s/Execution/Exec/gi;
    $name	=~ s/Information/info/gi;
    $name	=~ s/Communicate/Comm/gi;
    $name	=~ s/_at_/_/gi;
    $name	=~ s/_to_/_/gi;
    $name	=~ s/reversal_support/reversal/gi;
    $name	=~ s/Manufacturing/Mfg/gi;
    $name	=~ s/Integration/Int/gi;
    $name	=~ s/Communicate_Forecast/Forecast/gi;
    $name	=~ s/to_partner/partner/gi;
    $name	=~ s/fromo_partner/partner/gi;
    $name	=~ s/VPN_Remote_User/VPN/gi;
    $name	=~ s/Network_Device_Admin/Device/gi;
    $name	=~ s/VPN_Remote_User/VPN/gi;
    $name	=~ s/Authentication_Authorization/AAA/gi;
    $name	=~ s/Single_Sign-On/SSO/gi;
    $name	=~ s/Java_Virtual_Machine/JVM/gi;
    $name	=~ s/Cisco_Svcs_Fine_Grained_Access_Control_For_Application_Data/Fine_Grained_Control_for_Appl_Data/gi;
    $name	=~ s/Authentication_Authorization/AAA/gi;
    $name	=~ s/Cisco_Virtual_Office/CVO/gi;
    $name	=~ s/Services/Svcs/gi;
    $name	=~ s/Oracle_Business_Intelligence_Enterprise_Edition_\(OBIEE\)/OBIEE/gi;
    $name	=~ s/Solution/Soln/gi;
    if  (length( $name ) > 64)
    {
        print "SUBGROUP-TRUNCATION: $name =>";
        $name	= substr( $name, 0, 64 );
        print "$name\n";
    }
    return( $name );
}
=pod
#----------------------------------------------------------------------
sub	create_egm_groups
{
    my( $cfg )	= shift;
	my $service = $cfg->{'SERVICE'};
    #foreach my $service (sort( keys( %{ $cfg->{services} } ) ))
    #{
    my( $name )	= $cfg->{'EGM_GROUP'};
	print "egm-name - $name \n";
	my( $egm )	= new EMAN::EGM::GroupX( Username => $ENV{USER}, Address => $cfg->{hostname}, DBH => $cfg->{dbh}, BYPASS_SECURITY => 1 );
    $egm->setGroupName( Name => $name );
	#fix for the egm - if the group $name is existing with active status ?
	my $sql = "select * from egm_group_master where egm_group_name like '$name' and egm_group_status like 'A'";
	my $sth = $cfg->{dbh}->prepare($sql);
	$sth->execute();
	my $row_egm = $sth->fetchrow_hashref();
	if($row_egm > 0)
        {
            $cfg->{egm}->{$name}	= { used => 1,
					    avmet_group => $service,
					 };
			print "EGM-PREEXISTING: $name\n";

            $cfg->{'EGM_ID'} = $row_egm->{EGM_GID};

            if  ( $row_egm->{EGM_GROUP_DESCR} =~ /details\/(\d+)/ )
            {
                $cfg->{services}->{$service}->{onramp_resource}	= $1;
                $cfg->{egm}->{onramp_resource}			= $1;
                $cfg->{update}->{onramp_resource}->{$1}->{service} = $service;
                $cfg->{update}->{onramp_resource}->{$1}->{egm_gid} = $row_egm->{EGM_GID};
            }
        }
        else
        {
            $cfg->{insert}->{egm}->{$name}	= {};
	    $cfg->{egm}->{$name}        = { used => 1,
                                            avmet_group => $service,
                                         };

            print "EGM-INSERT: $name\n";
            $egm->setGroupDescr( Descr => "This group provides access control for EMAN Availability Metrics SLAs for: $service" );
            $egm->setGroupStatus( Status => "A" );
            if  (1)
            {
                $egm->insert();
                my( $factory )	= new EMAN::EGM::FunctionTypeFactory( Username => $ENV{USER}, Address => $cfg->{hostname}, DBH => $cfg->{dbh} );
                my( $type )	= $factory->getFunctionTypeByName( FunctionTypeName => "AvMet" );
                $egm->addFunctionType( FunctionType => $type );
                $type		= $factory->getFunctionTypeByName( FunctionTypeName => "OnRamp" );
                $egm->addFunctionType( FunctionType => $type );
                $cfg->{dbh}->commit();
				$cfg->{services}->{$service}->{egm_gid} = $egm->getGid();
            }
		
		
		#should update the egm-group desc having the onramp details
	        my $descr = &create_egm_onramp_resource( $cfg, $egm, $service );
		eval{
			$egm->setGroupDescr( Descr => $descr);
			$egm->update();
			$cfg->{dbh}->commit();
		};
		if($@)
		{
			die "Error in updating the EGM group description : $@";	
		}
        }
    #}
}





#----------------------------------------------------------------------
sub	create_egm_onramp_resource
{
    my( $cfg )	= shift;
    my( $egm )	= shift;
    my( $service )	= shift;
    my( $resource )	= new EMAN::OnRamp::Resource();
    eval
    {
        my( $sql )	= join( "\n",
                                "SELECT",
                                "    *",
                                "FROM",
                                "    acct_resource",
                                "WHERE",
                                "    acct_resource_parent_id = 96835037",
                                "    AND acct_resource_name = '$cfg->{services}->{$service}->{egm_group}'",
                                );
        my( $sth )	= $cfg->{dbh}->prepare( $sql );
        $sth->execute();
        my( $row )	= $sth->fetchrow_hashref();
        $resource->PARENT_ID( 96835037 );		## OnRamp > EMAN > NON-SOX > Applications > EMAN Availability Metrics
        $resource->NAME( $cfg->{services}->{$service}->{egm_group} );
        $resource->CREATED_BY( $ENV{USER} );		## Created
        $resource->APPROVAL( 0 );			## SINGLE=0
        $resource->AVAILABLE( 1 );			## Available
        $resource->CATEGORY_ID( 1007 );			## NON-SOX Reval
        $resource->CLASS_ID( 1003 );			## Account Profile
        $resource->INDEPENDENT( 1 );			## Independent
        $resource->JUST_REQD( 1 );			## Justification Required
        $resource->RESTRICTED( 0 );			## Independent
        $resource->TYPE( 1 );				## Autoprovisioned
        $resource->STATUS( 1 );				## Active
        $resource->ACCT_RES_REVAL_INTERVAL( 11 );	## 11 months
        $resource->ACCT_RESOURCE_ENABLE( 1 );		## Enabled
        $resource->MGR_APPROVE( 0 );			## ???
        $resource->LEVEL( 5 );				## zero-reletive(5); one-relative(6);
        my( $encoded )	= $service;
        $encoded		=~ s/&/%26/g;
        $encoded		=~ s/ /+/g;
        $resource->DESCR( join( "\n",
                                "Subscribers can manage the Service Level Availability targets for the IT Service: ",
                                "<a href='/OPDATA/ExecMetrics/Availability/rest/service/$cfg->{services}->{$service}->{avmet_group_id}' target='metrics'>$service</a> ",
                                "[<a href='/graph/service/name/$encoded'>GRAPH</a>]",
                                "[<a href='/Group_Management/rest/details/$cfg->{services}->{$service}->{egm_group}' target='egm'>EGM</a>]",
                                ));
        if  ($row)
        {
            print "UPD-ONRAMP: $row->{ACCT_RESOURCE_ID} - $cfg->{services}->{$service}->{egm_group}\n";
            $resource->start_transaction( FUNCTION => "Avail Metrics", ACTION => "U", RESOURCE => "Avail Metrics" );
            $resource->RESOURCE_ID( $row->{ACCT_RESOURCE_ID} );
            $resource->update();
            $resource->get_dbh()->commit();
        }
        else
        {
            print "INS-ONRAMP: $row->{ACCT_RESOURCE_ID} - $cfg->{services}->{$service}->{egm_group}\n";
            $resource->start_transaction( FUNCTION => "Avail Metrics", ACTION => "I", RESOURCE => "Avail Metrics" );
            $resource->insert();
            $resource->get_dbh()->commit();
        }
    };
    if  ($@)
    {
        $@	=~ s/, :/,\n\t:/g;
        print "FAULT: $@\n";
        exit( 0 );
    }
	#update the egm group with current onramp details.
	my $descr = join("This is an OnRamp controlled EGM group.  Please use OnRamp to request access.",
		"<a href='http://onramp/details/$resource->{RESOURCE_ID}'    target='$resource->{RESOURCE_ID}' ",
		"    title='Go to this OnRamp Resource' >http://onramp/details/$resource->{RESOURCE_ID}</a>"); 
	return $descr;
}

=cut

#-- prints usage if no command line parameters are passed or there is an unknown
#   parameter or help option is passed
sub usage
{
  print "Unknown option: @_\n" if ( @_ );
  print "usage:  appl_mapto_offering.pl [--applid=APPL_ID] or  [--applname='APPL_NAME'] [--offering='SERIVCE_OFFERING'] [--help|-?]\n";
  exit;
}


