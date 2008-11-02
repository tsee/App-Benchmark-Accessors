#!/usr/bin/env perl

use warnings;
use strict;
use App::Benchmark::Accessors;
use UNIVERSAL::require;
use Test::More tests => 1;

my @modules = qw(
    Moose
    Mouse
    Class::Accessor
    Class::Accessor::Fast
    Class::Accessor::Fast::XS
    Class::Accessor::Complex
    Class::Accessor::Constructor
    Mojo::Base
    Class::MethodMaker
    Object::Tiny
    Spiffy
    Class::Spiffy
    accessors
);

for my $module (@modules) {
    $module->require or die $@;
    my $version;
    {
        no strict 'refs';
        $version = ${ $module . '::VERSION' };
    }
    printf "# %s v%s\n", $module, $version;
}

pass('versions');
