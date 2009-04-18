use strict;
use warnings;
use inc::Module::Install;

name('Catalyst-Plugin-RunAfterRequest');

all_from('lib/Catalyst/Plugin/RunAfterRequest.pm');

requires 'Catalyst::Runtime';
requires 'Catalyst::Component::InstancePerContext';
requires 'Moose';

WriteAll;
