#!/usr/bin/env perl

use strict;
use warnings;

use Digest::MD5;

my $file=shift;

open(FH, "<", $file) || die "$!";

my $expected = <FH>;

# should be EOF
unless (eof(FH))
{
    print STDERR "MD5FILE contained more than one line... Just using the first!\n";
} 

close(FH) || die "$!";

# extract the md5sum
$expected =~ s/^(\S+).*/$1/s;

my $ctx = Digest::MD5->new;

while (<>) 
{
    $ctx->add($_);
    print $_; 
};

my $got = $ctx->hexdigest;

if ($got ne $expected)
{ 
    die "Wrong checksum: Found $got but expected $expected\n";
}
