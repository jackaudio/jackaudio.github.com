#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use DateTime;

if (@ARGV != 2) {
  die qq{Usage: $0 "New Post Title" "Author".\n}
}
my $dir    = '_posts';
my $title  = $ARGV[0];
my $author = $ARGV[1];
my $date   = DateTime->now()->ymd;

# Only numbers, letters and hyphen allowed in a lowercase filename
(my $name = $title) =~ tr/A-Z /a-z-/;
$name =~ tr/\$#@~!&*()[];.,:?^ `\\\///d;

open(my $fh, '>', "$dir/$date-$name.md");
binmode($fh);
print $fh <<EOF
---
title:     "$title"
author:    "$author"
date_fmt:  "%F"
date:       $date
categories: news
---
EOF
