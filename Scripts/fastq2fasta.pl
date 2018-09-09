#!/usr/bin/perl
#FastQtoFASTA

print "Please input the name of a file to be read.\n";
$filename = <>;
open IN, "$filename";
print "Please input the name of the file to print to.\n";
$outfile = <>;
open OUT, ">$outfile";



$count = 1;

while ($line = <IN>) {

	if($count == 1) {
		$line =~ tr/@/>/;
		print OUT "$line";
	    $count++;
	}
	elsif($count == 2) {
		print OUT "$line";
		$count++;
	}
	elsif($count == 3) {
		
		$count++;
	}
	elsif($count == 4) {
		$count = 1;
	}
}   
close (IN) ;
close (OUT);

