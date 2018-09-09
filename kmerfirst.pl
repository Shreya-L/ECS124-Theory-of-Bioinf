#!/usr/bin/perl -w
# Program kmerfirst.pl
# This program finds all the overlapping k-mers of the input string. It builds
# an associative array where each key is one distinct k-mer in the string,
# and the associated value is the starting position where that
#k-mer is FIRST found.  Compare this to kmer2.pl

print "Input the file with the query string\n";
open (QUERY, <>);

while($line = <QUERY>) {
$q = $line;
}

my @qArray = split //, $q;   #this splits the string query into an array of chars
chomp $q;


%stringhash = ();  ##initializing new hash
$hspcount = 0;
my @hspArray;

print "Input the length of the window\n"; 
$k = <>;
chomp $k;

print "Input the threshold value: \n";
$t = <>;
chomp $t;

%kmer = ();                      # This initializes the hash called kmer.
$i = 1;
while (length($q) >= $k) {
  $q =~ m/(.{$k})/; 
  print "$1, $i \n";
   if (! defined $kmer{$1}) {     #defined is a function that returns true
                                  # if a value has already been assigned to
                                  # $kmer{$1}, otherwise it returns false. 
                                  # the ! character is the negation, so
                                  # if $kmer{$1} has no value, then it will
                                  # be assigned the value of $i, the position
                                  # where the k-mer is first found.
    $kmer{$1} = $i; 
         
   }
 $i++;
  $q = substr($q, 1, length($q) -1);
}

#foreach $kmerkey (keys(%kmer)) {
#print "The first occurrence of string $kmerkey is in position 
# $kmer{$kmerkey}\n";
#}





print "Input the file with the database\n"; 
open (DATABASE, <>);

#$/="";
while($line = <DATABASE>) {
chomp $line;
$database.=$line;
}

my @dArray = split //, $database;  ##makes an array out of database string

$j = 1;

while (length($database) >= $k) {
  $database =~ m/(.{$k})/;  
  
  if (defined $kmer{$1}) {  ##if defined in hash table check
  		
  		#print "$1 \t appears in Q at $kmer{$1} and in S at $j\n";
  		$kmerlength = $k; 
  		$right = 0;
  		$left = 0;
  		$i = $kmer{$1};
  		
  		
  			for($a=1;;$a++){
  				
  				if($dArray[($j-1)-$a] eq $qArray[($i-1)-$a]){
  					$left++;
  				}
  				
  				else {
  					last;
  				}
  			
  			}
  			
  			for($b=1;;$b++){
  				
  				if($dArray[($j+2)+$b] eq $qArray[($i+2)+$b]) {
  					$right++;
  				}
  				
  				else {
  					last;
  				}
  			
  			}
  		
  		$dStart = $j-1-$left;
  		#$qStart = $i-1-$left;
  		
  		$total = $kmerlength + $right + $left; ##gives total length of match
  		
  my $hspstring;
  
  		for($y=$dStart; $y<($dStart+$total); $y++) {
  			$hspstring = $hspstring.@dArray[$y];
  		
  		}
  		
  		$match = 1; #need this for conditionals later
  		
  		
  		if($total>=$t) {  #checks if total match is above or eq. to threshold
  		
  			if($hspcount == 0 ) {
  				
  				$hspcount++;
  				$match = 0;
  			
  			
  			}
  			
  			else {
  			
  						foreach $hsp (@hspArray) {
  						
  							if($hsp eq $hspstring) {
  							
  									$match = 1;
  							}
  							
  							else {
  									$match = 0;
  							
  							}
  						
  						}
  			
  			}
  			
  			if($match == 0 ) { ## found a unique HSP
  			
  				print "HSP found: $hspstring\n";
  				push @hspArray, $hspstring;
  			
  			
  			}
  		
  		}
  		
  		if(! defined $stringhash{$hspstring}) {
  		
  				$stringhash{$hspstring} = $dStart+1;
  		}
  		
  	} ##closes if defined
  		
  $j++;		
  $database = substr($database, 1, length($database) -1); #this removes the first character of the current $dna
  
  
  
  
}


