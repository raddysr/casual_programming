#!/usr/bin/perl

use strict;
use warnings;

####################################### UNIX COMMMANDS ###################################

my $hostname = `hostname`;

my @crontab = `crontab -l`;

#my @services = `cat ... | grep ...`;

my @services =`find path -type f -name "name" | xargs grep "pattern"`;

####################################### REPORTFILE NAME ##################################

my($sec, $min, $hour, $mday,$mon,$year,$wday,$yday,$idst)=localtime();

$hostname =~ s/\n//;

my $report = $hostname.$mday.$mon.$year.'.txt';

########################################### WORK ########################################

open(FILE,'>>', $report) or die "I can't open it!\n";

print FILE "crontab report:\n";

foreach(@crontab){

        my($con1, $cron2, $cron3, $cron4, $cron5, $script, $arguments)  =split/\t|\s+/,$_;

        open(FILE,'>>', $report) or die "I can't open it!\n";

        print FILE $script."\n";

}

print"Crontab report complete!\n";

print FILE "\nservices report:\n";

foreach(@services){

        open(FILE,'>>', $report) or die "I can't open it!\n";

        print FILE $_;

}

close FILE;

print"Services report complete!\n";