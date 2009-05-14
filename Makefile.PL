use strict;
use warnings;
use inc::Module::Install 0.87;

name('Catalyst-Plugin-RunAfterRequest');

all_from('lib/Catalyst/Plugin/RunAfterRequest.pm');

requires 'Catalyst::Component::InstancePerContext';
requires 'Catalyst::Controller';
requires 'Catalyst::Runtime';
requires 'Catalyst::Test';
requires 'Moose';
requires 'Moose::Role';
requires 'MRO::Compat';

test_requires 'Test::More';

WriteAll;

