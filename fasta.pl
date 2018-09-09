#!/usr/bin/perl
# fasta2Fastq

print "Please input the name of a file to be read.\n";
$filename = <>;
open IN, "$filename";
print "Please input the name of the file to print to.\n";
$outfile = <>;
open OUT1, ">$outfile";


$count = 1;

while ($line = <IN>) {

	if($count == 1) {
		$line =~ tr/>/@/;
		print OUT1 "$line";
		$line3 = $line;
	    $count++;
	}
	elsif($count == 2) {
		print OUT1 "$line";
		$line4 = $line;
		$line3 =~ tr/@/+/;
		print OUT1 "$line3";
		$line4 =~ tr/ACTG/B/;
		print OUT1 "$line4";
		$count = 1; 
	}
	
	
	
	
	
	
	
	
	
}   
close (IN) ;
close (OUT1);
