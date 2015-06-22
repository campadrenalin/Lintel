#!/usr/bin/perl
use warnings;
use strict;

use FindBin;
use local::lib "$FindBin::Bin/../vendor";
use lib "$FindBin::Bin/../";

use Lintel::Promise;

use Lintel::Template::Factory;
our $tmpl = Lintel::Template::Factory->new(config => {
	INCLUDE_PATH => "$FindBin::Bin/templates",
	INTERPOLATE  => 1,
});

print $tmpl->build("hello.tmpl", title => 'foo')
	->req("content", Lintel::Promise->wrap("example"))
	->execute();
