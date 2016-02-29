package CommonModule;

use Exporter;

#base class of this(Arithmetic) module
@ISA =qw(Exporter);


#Exporting the sortHash() subroutine
@EXPORT =qw(sortHash);



#subroutine to sort the key => value's of passed HASH to the subroutine

sub sortHash {

    my @sortedValues;
    my %unSortedHash =@_;
    #my ($unSortedHash) = shift;
    print "\n This is from sub :SortHashMod :: sortHas() :\n\n";
    for my $unsortedKey (keys %unSortedHash){
    
        push(@sortedValues,$unSortedHash{$unsortedKey});
        print "Key  :",join ",",$unsortedKey;
        print " => Value : ",$unSortedHash{$unsortedKey};
        print "\n";
    }
    
    
    return sort(@sortedValues);
}


1;