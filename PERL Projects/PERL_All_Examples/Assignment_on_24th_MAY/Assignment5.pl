#!perl -w
use strict;
use Data::Dumper;
use lib './module_lib/';
use CommonModule;


my %newDynamicHash;

my %staticHash = ("20GB","20480 MB","10GB","10240 MB","40GB","40960MB","1GB","1024 MB");

my %dynamicHash=();

print "KEY => VALUE pair of dynamic hash before Runtime addition : ",Dumper \%newDynamicHash;

%newDynamicHash = addHashValRuntime(\%staticHash,\%dynamicHash);

print "\n KEY => VALUE pair of dynamic hash after Runtime addition : \n ",Dumper \%newDynamicHash;


