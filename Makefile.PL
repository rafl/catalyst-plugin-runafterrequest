use strict;
use warnings;
use inc::Module::Install 0.87;

name('Catalyst-Plugin-RunAfterRequest');

all_from('lib/Catalyst/Plugin/RunAfterRequest.pm');

requires 'Catalyst::Runtime';
requires 'Catalyst::Component::InstancePerContext';
requires 'Moose';

WriteAll;
