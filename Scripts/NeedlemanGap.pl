#!/usr/bin/perl -w
#This is the Needleman-Wunsch global alignment algorithm with gaps 
#in the model and
#with match value = 1, and mismatch and indel value = -1.
#dg
open (OUT, '> outer');         
print "Input string 1 \n";
$line = <>;
chomp $line;
@string1 =  split(//, $line);  

print "Input string 2 \n";
$line = <>;
chomp $line;
@string2 =  split(//, $line);

$n = @string1;                 
                               
$m = @string2;

print "The lengths of the two strings are $n, $m \n";   # Just to make sure this works.


print "Input match value \n";
$match = <>;

print "Input mismatch cost \n";
$mismatch = <>;

print "Input indel cost \n";
$indel = <>;


$V[0][0] = 0;                  

for ($i = 1; $i <= $n; $i++) { 
                               
                               
   $V[$i][0] = (-$i)*($indel);
   print OUT "$string1[$i-1]";  # Note the -1 here because array indexes start at 0 (ug!)
}
	
   print OUT "\n\n";

for ($j = 1; $j <= $m; $j++) { # Assign the row 0 values and print String 2
   $V[0][$j] = (-$j)*($indel);
   
   print OUT "$string2[$j-1]";
   
   
}

for ($i = 1; $i <= $n; $i++) {      # follow the recurrences to fill in the V matrix.
 for ($j = 1; $j <= $m; $j++) {
#   print OUT "$string1[$i-1], $string2[$j-1]\n"; # This is here  for debugging purposes.
   if ($string1[$i-1] eq $string2[$j-1]) {
     $t = $match; }
   else {
   $t = (-1)*($mismatch);
   }

  $max = $V[$i-1][$j-1] + $t;  
#  print OUT "For $i, $j, t is $t \n"; # Another debugging line.


  if ($max < $V[$i][$j-1] -$indel) {
    $max = $V[$i][$j-1] -$indel;
    
    
  }

  if ($V[$i-1][$j] -$indel > $max) {
    $max = $V[$i-1][$j] -$indel;
  }
  $V[$i][$j] = $max; 
 print OUT "V[$i][$j] has value $V[$i][$j]\n";
  }
}
print OUT "\n The similarity value of the two strings is $V[$n][$m]\n";

close(OUT);
