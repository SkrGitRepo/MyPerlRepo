#!perl -w
use strict;
use Data::Dumper;
my $i =1;
my $j = 9;
my $num=5;
my ($n,$r,$c,$sp,$s);
$n=$num;
 
 for($r=1; $r<=$num; $r++,$n=$n-2)
 {
  for($sp=$r; $sp>1; $sp--) {
     print " ";
 }
  if ($i <= 5){
  print $i++;
  }
  for($s=$n; $s>=1; $s--) {
     printf " ";
     }
  if($r<$num){
  
     print " ";
     printf $j--;
     printf " ";
     printf" \n";
  }
 }
