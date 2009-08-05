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
requires 'MooseX::AttributeHelpers';
requires 'MooseX::Types::Moose';
requires 'namespace::autoclean';

test_requires 'Test::More';
test_requires 'Module::Find';

resources repository =>
'http://dev.catalyst.perl.org/repos/Catalyst/Catalyst-Plugin-RunAfterRequest/trunk/';

WriteAll;

