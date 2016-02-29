    exec ('saveEVAL.pl') or print STDERR "couldn't exec foo: $!";
    
    #{ exec ('saveEVAL.pl') }; print STDERR "couldn' t exec foo: $!";