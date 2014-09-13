#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;
use Text::CSV_XS;

my ($rfh, $wfh);
my $tc = Text::CSV_XS->new({
  quote_char => undef,
  binary => 1
});

my $data_file = shift or help();
my $out_file  = shift;

if ($out_file){
  open $wfh, ">", $out_file or die "$out_file:$!";
}else{
  $wfh = \*STDOUT;
}

open $rfh, "<", $data_file or die "$data_file:$!";
while(<$rfh>){
  next unless $tc->parse($_);
  my @row = $tc->fields;
  $row[2] = "" if !defined($row[2]);
  my $element_class = "";
  $element_class .= "bottle " if $row[2] =~ m/【びん】/;
  $element_class .= "can " if $row[2] =~ m/【缶】/;
  $element_class .= "petbottle " if $row[2] =~ m/【ペットボトル】/;
  $element_class .= "paper " if $row[2] =~ m/【古紙.*?】/;
  $element_class .= "cloth " if $row[2] =~ m/【布類】/;
  $element_class .= "combustible " if $row[2] =~ m/可燃/;
  $element_class .= "incombustible " if $row[2] =~ m/不燃/;
  $element_class .= "toxic " if $row[2] =~ m/有害/;
  $element_class .= "large " if $row[2] =~ m/粗大/;
  $element_class .= "recycle " if $row[2] =~ m/リサイクル/;
  $element_class .= "prohibit " if $row[2] =~ m/禁止/;
  $element_class = "other" if $element_class eq "";
  $element_class =~ s/\s*$//;
  $tc->combine(@row, $element_class);
  print $wfh encode('utf-8', $tc->string), "\n";
}
close $rfh;
close $wfh;

sub help{
  die "$0 data_file [out_file]\n";
}